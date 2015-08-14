package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.util.Logger;

public class HRloginCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		

		String hrID = request.getParameter("hrID");
		String password = request.getParameter("password");
		HRManager htinfodao = HRManager.getInstance();
		if (htinfodao.isHRExist(hrID)
				&& htinfodao.getHRPassword(hrID).equals(password))

		{
			int status = htinfodao.findHRByID(hrID).getStatus();
			HttpSession session = request.getSession();
			session.setAttribute("hrID", hrID);
			session.setAttribute("HRstatus", status);
			resultPage = ApplicationResources.INDEX;

		} else
			{
			resultPage = ApplicationResources.HRLOGIN;
        	request.setAttribute("msgerror", "账户或密码错误！");
			}

		request.setAttribute("hrID", hrID);

		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.HRLOGIN;
	}

}
