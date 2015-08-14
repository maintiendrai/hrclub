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

public class ShowjobCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.SHOWJOB;
		
	}
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object hrIDo=request.getSession().getAttribute("hrID");
		if(null!=hrIDo){
		String hrID = (String) request.getSession().getAttribute("hrID");
		Page mypage;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		if(hrID==null){
			mypage=JobManager.getInstance().findJobByPage(pageNum, 10);
		
		
		}
		else{
			mypage=JobManager.getInstance().findJobByhrID(pageNum,10, hrID);
		}
       if(null!=mypage){
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.JOBMANGER;
       }
       else
    	   resultPage = ApplicationResources.ERROR_PAGE;
		}
		else {
			request.setAttribute("msgerror", "请重新登录！");
			 resultPage = ApplicationResources.HRLOGIN;
		}
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

	

}