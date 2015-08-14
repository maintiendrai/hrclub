package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;

public class LettermanagerCommand extends Command {

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String[] letterIDs = request.getParameterValues("letterID");
		String sign = request.getParameter("sign");
		System.out.println(sign);
		JobManager letterDAO = JobManager.getInstance();
		if (sign.equals("delstate")) {
			for (int i = 0; i < letterIDs.length; i++) {
				//System.out.println(userids[i]);
				if (letterDAO.deleteLetter(letterIDs[i]) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
				
					resultPage = ApplicationResources.TOSHOWLETTER;
			}
		}
		if (sign.equals("startstate")) {
			for (int i = 0; i < letterIDs.length; i++) {
				//System.out.println(userids[i]);
				if (letterDAO.updateLetterStatus(letterIDs[i], 0) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.TOSHOWLETTER;
			}
		}
	
		result.setResultPage(resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.LETTERMANAGER;
	}

}
