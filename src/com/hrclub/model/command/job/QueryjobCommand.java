package com.hrclub.model.command.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.JobinfoTO;
import com.hrclub.util.Logger;

public class QueryjobCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.QUERYJOB;

	}

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String jobIDs = request.getParameter("jobID");
		String sign = request.getParameter("sign");
		
		int jobID = Integer.parseInt(jobIDs);

		JobManager jobinfodao = JobManager.getInstance();

		JobinfoTO to = jobinfodao.findJobinfoByjobID(jobID);
		request.setAttribute("to", to);
		if(null==sign)
		  resultPage = ApplicationResources.QUERYJOB;
		else if(sign.equals("adminquery"))
			resultPage = ApplicationResources.ADMINSHOWONE;
		else if(sign.equals("adminupquery"))
			resultPage = ApplicationResources.ADMINUPJOB;
		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}
}
