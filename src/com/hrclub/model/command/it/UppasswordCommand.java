package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.util.Logger;

public class UppasswordCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object userido = request.getSession().getAttribute("userid");
		if (null != userido) {
			String userid = (String) request.getSession()
					.getAttribute("userid");

			String password = request.getParameter("password");

			String password1 = request.getParameter("password1");

			ITUserManager ituserdao = ITUserManager.getInstance();
			// WorkexperienceDAO worddao = new WorkexperienceDAO();
			if (password.equals(ituserdao.getUserPassword(userid))
					&& ituserdao.updatePassword(userid, password1) == 1) {
				request.setAttribute("msgerror", "修改成功！");
				resultPage = ApplicationResources.ITUPPASSWORD;
			} else {
				request.setAttribute("msgerror", "修改失败！");
				resultPage = ApplicationResources.ITUPPASSWORD;
			}

		}

		else
			resultPage = ApplicationResources.ITLOGIN;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.UPPASSWORD;
	}

}
