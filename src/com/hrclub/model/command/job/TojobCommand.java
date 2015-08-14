package com.hrclub.model.command.job;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.JobletterTO;
import com.hrclub.util.Logger;

public class TojobCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String jobID = request.getParameter("jobID");
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String userID = (String) request.getSession().getAttribute("userid");

	
		String jobtitle = request.getParameter("jobtitle");
		String content = request.getParameter("content");
		JobletterTO to=new JobletterTO();
		to.setJobID(jobID);
		to.setUserID(userID);
		to.setContent(content);
		to.setJobtitle(jobtitle);
		JobManager jobinfodao = JobManager.getInstance();
	    if(jobinfodao.insertJobletter(to)>0)
	    {
	    	request.setAttribute("msgerror", "申请成功！");
	    	resultPage = "/showletter.do?operation=showletter&pageNum=1";
	    }
	    else
			resultPage = ApplicationResources.ERROR_PAGE;
		}

		else 
			{
			jobID=request.getParameter("jobID");
	      	request.setAttribute("msgerror", "请登录！");
			resultPage = ApplicationResources.TOJOB+jobID;
			
			}
		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.TOJOB;
	}

}
