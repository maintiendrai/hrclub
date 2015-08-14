package com.hrclub.model.command.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ShowJobLeterCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.SHOWJOBLETER;
		
	}
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
		String jobID=request.getParameter("jobID");
		String sign=request.getParameter("sign");
		Page mypage;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
			mypage=JobManager.getInstance().findJobletterByjobID(pageNum, 15, jobID);
			request.setAttribute("mypage", mypage);
	
       if(null==sign){
		resultPage = ApplicationResources.SHOWJOBLETER;
       }
       else if(sign.equals("admin"))
    	   resultPage = ApplicationResources.ADMINSHOWJOBLETTER;
       
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

	

}