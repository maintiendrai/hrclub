package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.util.Logger;

public class UphrpasswordCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object hrIDo=request.getSession().getAttribute("hrID");
		if(null!=hrIDo){
		String hrID = (String)hrIDo;

		String password = request.getParameter("password");

		String password1 = request.getParameter("password1");
		HRManager hrdao = HRManager.getInstance();

		if (password.equals(hrdao.getHRPassword(hrID)) && hrdao.updateHRPassword(hrID, password1)== 1)
		{request.setAttribute("msgerror", "修改成功！");
				resultPage = ApplicationResources.HRUPPASSWORD;
		}
			else
			{ request.setAttribute("msgerror", "修改失败！");
				resultPage = ApplicationResources.HRUPPASSWORD;
			}
		}
		else
			resultPage = ApplicationResources.HRLOGIN;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.UPHRPASSWORD;
	}

}
