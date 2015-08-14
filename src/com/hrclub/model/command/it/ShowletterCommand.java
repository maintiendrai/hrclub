package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ShowletterCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.SHOWLETTER;
		
	}
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String userid = request.getSession().getAttribute("userid").toString();
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		//System.out.println(pageNum);
		Page mypage=JobManager.getInstance().findJobletterByuserID(pageNum, 10, userid);
		
		request.setAttribute("mypage", mypage);
		
	
		resultPage = ApplicationResources.LETTERMANAGER;
	
		}
		else 
			resultPage = ApplicationResources.ITLOGIN;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

	

}
