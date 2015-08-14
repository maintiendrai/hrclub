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

public class ByaddressCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
	
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String city = request.getParameter("city");
	
		Page mypage=JobManager.getInstance().findJobinfoByyCity(pageNum, 15,city);
		
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.SHOWFINDJOB;
		
		result.setResultPage(resultPage);

		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.BYADDRESS;
	}

}
