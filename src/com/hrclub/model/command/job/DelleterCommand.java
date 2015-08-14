package com.hrclub.model.command.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.util.Logger;

public class DelleterCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.DELLETER;
		
	}
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
		String jobID=request.getParameter("jobID");
		String[] letterID =request.getParameterValues("letterID");
		resultPage = ApplicationResources.TOLETER+jobID;
	   
		for(int i=0;i<letterID.length;i++){
	    	if(JobManager.getInstance().deleteJobletter(letterID[i])==0)
	    		resultPage = ApplicationResources.ERROR_PAGE;
	    }
    	   
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}

