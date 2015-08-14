package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;

public class HRstatusCommand extends Command {

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String[] hrIDs = request.getParameterValues("hrid");
		String sign = request.getParameter("sign");
		System.out.println(sign);
		HRManager itUserDAO = HRManager.getInstance();
		if (sign.equals("stop")) {
			for (int i = 0; i < hrIDs.length; i++) {
				System.out.println(hrIDs[i]);
				if (itUserDAO.updateHRStatus(hrIDs[i], 2) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
				
					resultPage = ApplicationResources.HRMANAGERDO;
			}
		}
		if (sign.equals("open")) {
			for (int i = 0; i < hrIDs.length; i++) {
				System.out.println(hrIDs[i]);
				if (itUserDAO.updateHRStatus(hrIDs[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.HRMANAGERDO;
			}
		}
		if (sign.equals("pass")) {
			for (int i = 0; i < hrIDs.length; i++) {
				System.out.println(hrIDs[i]);
				if (itUserDAO.updateHRStatus(hrIDs[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.HRMANAGERDO;
			}
		}

		if (sign.equals("hrstop")) {
			for (int i = 0; i < hrIDs.length; i++) {
				System.out.println(hrIDs[i]);
				if (itUserDAO.updateHRStatus(hrIDs[i], 2) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
				
					resultPage = ApplicationResources.HRAUDITING;
			}
		}
		if (sign.equals("hropen")) {
			for (int i = 0; i < hrIDs.length; i++) {
				System.out.println(hrIDs[i]);
				if (itUserDAO.updateHRStatus(hrIDs[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.HRAUDITING;
			}
		}
		if (sign.equals("hrpass")) {
			for (int i = 0; i < hrIDs.length; i++) {
				System.out.println(hrIDs[i]);
				if (itUserDAO.updateHRStatus(hrIDs[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.HRAUDITING;
			}
		}
		
		result.setResultPage(resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.HRSTATUS;
	}

}
