package com.hrclub.model.command.job;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;

import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class SimfinjobCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		
		String byjob = request.getParameter("byjobh");
		String byaddress = request.getParameter("byaddressh");
		String keyname = request.getParameter("keyname").trim();
		String operation = request.getParameter("operation");
	    
		
		Properties prop=new Properties();
		prop.put("operation", operation);
		prop.put("byjobh", byjob);
		prop.put("byaddressh", byaddress);
		
		prop.put("keyname", keyname);
		
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));

		
		Page mypage=JobManager.getInstance().findJobinfoBysim(pageNum, 15, byjob,
				byaddress, keyname);
		
	
		
		request.setAttribute("prop", prop);
		request.setAttribute("mypage", mypage);
		
		resultPage = ApplicationResources.SIMRESULT;
		
		result.setResultPage(resultPage);

		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.SIMFINDJOB;
	}

}
