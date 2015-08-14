package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;

public class StopstateCommand extends Command {

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String[] userids = request.getParameterValues("userid");
		String sign = request.getParameter("sign");
		System.out.println(sign);
		ITUserManager itUserDAO = ITUserManager.getInstance();
		if (sign.equals("stop")) {
			for (int i = 0; i < userids.length; i++) {
				//System.out.println(userids[i]);
				if (itUserDAO.updateStatus(userids[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
				
					resultPage = ApplicationResources.ITMANAGERDO;
			}
		}
		if (sign.equals("open")) {
			for (int i = 0; i < userids.length; i++) {
				//System.out.println(userids[i]);
				if (itUserDAO.updateStatus(userids[i], 0) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.ITMANAGERDO;
			}
		}
		if (sign.equals("tocore")) {
			for (int i = 0; i < userids.length; i++) {
				// System.out.println(userids[i]);
				if (itUserDAO.updateCore(userids[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.ITMANAGERDO;
			}
		}

		if (sign.equals("offcore")) {
			for (int i = 0; i < userids.length; i++) {
				// System.out.println(userids[i]);
				if (itUserDAO.updateCore(userids[i], 0) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.ITMANAGERDO;
			}
		}
		result.setResultPage(resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.STOPSTATE;
	}

}
