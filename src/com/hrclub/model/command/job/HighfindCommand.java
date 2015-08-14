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

public class HighfindCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		
		String byjob = request.getParameter("byjobh");
		String byaddress = request.getParameter("byaddressh");
		String bycalling = request.getParameter("bycallingh");
		String bytime= request.getParameter("bytime");
		
		String keyname = request.getParameter("keyname").trim();
		String sign=null;
		sign= request.getParameter("sign");
		
		String bykind = request.getParameter("bykind");
		String bydegree = request.getParameter("bydegree");
		String byyear = request.getParameter("byyear");
		String bywage= request.getParameter("bywage");
		String bycorpkind = request.getParameter("bycorpkind");
		String operation = request.getParameter("operation");
		Properties prop=new Properties();
		prop.put("operation", operation);
		prop.put("byjobh", byjob);
		prop.put("byaddressh", byaddress);
		prop.put("bycallingh", bycalling);
		prop.put("bytime", bytime);
		prop.put("bykind", bykind);
		prop.put("bydegree", bydegree);
		prop.put("byyear", byyear);
		prop.put("bywage", bywage);
		prop.put("bycorpkind", bycorpkind);
		
		prop.put("keyname", keyname);
		
		
		
	    int pageNum = Integer.parseInt(request.getParameter("pageNum"));
     
		
		Page mypage=JobManager.getInstance().findJobinfoByhigh(pageNum, 15, byjob, byaddress, bycalling, bytime, bykind, bydegree, byyear, bywage, bycorpkind,keyname);
		
	
		
		request.setAttribute("prop", prop);
		request.setAttribute("mypage", mypage);
		
		if(sign==null)
			resultPage = ApplicationResources.SIMRESULT;
			else if(sign.equals("adminhighfind"))
				resultPage = ApplicationResources.ADMINFINDJOBRESULT;
			result.setResultPage(resultPage);
		
		result.setResultPage(resultPage);

		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.HIGHFIND;
	}

}
