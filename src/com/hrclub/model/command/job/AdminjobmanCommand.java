package com.hrclub.model.command.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;

public class AdminjobmanCommand extends Command {

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		 HttpSession session = request.getSession();
			
			String adminID = (String)session.getAttribute("adminuserid");
			if(null==adminID) {
				resultPage = ApplicationResources.ADMIN_LOGIN;

				result.setResultPage(resultPage);
				return result;
			
			}	
		String[] jobIDs = request.getParameterValues("jobID");
		String sign = request.getParameter("sign");
		JobManager jobdao = JobManager.getInstance();
		if (sign.equals("del")) {
			for (int i = 0; i < jobIDs.length; i++) {
			
				if (jobdao.deleteJob(jobIDs[i]) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
				
					resultPage = ApplicationResources.ADMINMANAGERDO;
			}
		}
		if (sign.equals("stop")) {
			for (int i = 0; i < jobIDs.length; i++) {
			
				if (jobdao.updateJobStatus(jobIDs[i], 1) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.ADMINMANAGERDO;
			}
		}
		if (sign.equals("start")) {
			for (int i = 0; i < jobIDs.length; i++) {
			
				if (jobdao.updateJobStatus(jobIDs[i], 0) != 1)
					resultPage = ApplicationResources.ERROR_PAGE;
				else
					resultPage = ApplicationResources.ADMINMANAGERDO;
			}
		}
		result.setResultPage(resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.ADMINJOB;
	}

}
