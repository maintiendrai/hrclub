package com.hrclub.model.command.job;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class AdminshowjobCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.ADMINSHOWJOB;
		
	}
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
		Page mypage;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
	
			mypage=JobManager.getInstance().findJobByPage(pageNum, 10);
		
		
	
       if(null!=mypage){
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.ADMINJOB;
       }
       else
    	   resultPage = ApplicationResources.ERROR_PAGE;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

	
}
