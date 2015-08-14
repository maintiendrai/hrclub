package com.hrclub.model.command.it;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class FindITCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object adminuserid=request.getSession().getAttribute("adminuserid");
		
		Page mypage=null;
		
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String operation = request.getParameter("operation");
		String sign = request.getParameter("sign");
		String speh = request.getParameter("speh");
		String byjobh = request.getParameter("byjobh");
		String byaddressh = request.getParameter("byaddressh");
	
		String finkey = request.getParameter("finkey");
		
		Properties prop=new Properties();
		prop.put("operation", operation);
		prop.put("sign", sign);
		prop.put("speh", speh);
		prop.put("byjobh", byjobh);
		prop.put("byaddressh", byaddressh);
		prop.put("finkey", finkey);
		ITUserManager itusermanger=ITUserManager.getInstance();
		if(sign.equals("sim")){
			mypage=itusermanger.findUserBysim(pageNum, 15, speh, byjobh, byaddressh, finkey);
			if(null!=mypage){
				request.setAttribute("mypage", mypage);
				if(null==adminuserid)
				resultPage = ApplicationResources.FINDITRESULT;
				else 
				resultPage = ApplicationResources.ADMINFINDITRESULT;
					
			}
			else 
				resultPage = ApplicationResources.ERROR_PAGE;
		}
        if(sign.equals("high")){
        	
        
        	String byitskillh = request.getParameter("byitskillh");
        	
    		String bykind = request.getParameter("bykind");
    		String degree = request.getParameter("degree");
    		String crertname = request.getParameter("crertname");
    		String workyear = request.getParameter("workyear");
    		String bywage=""; 
    		bywage= request.getParameter("bywage");
    		String school="";
    		school = request.getParameter("school");
    		String languagename = request.getParameter("languagename");
    		String core = request.getParameter("core");
    		prop.put("byitskillh", byitskillh);
    		
    		prop.put("bykind", bykind);
    		prop.put("degree", degree);
    		prop.put("crertname", crertname);
    		prop.put("workyear", workyear);
    		prop.put("bywage", bywage);
    		prop.put("school", school);
    		prop.put("languagename", languagename);
    		prop.put("core", core);
    		mypage=itusermanger.findUserByshigh(pageNum, 15, speh, byjobh, byaddressh, finkey, 
    				byitskillh,bykind, degree, crertname, workyear, bywage, school, languagename,core);
			if(null!=mypage){
				request.setAttribute("mypage", mypage);
				if(null==adminuserid)
				resultPage = ApplicationResources.FINDITRESULT;
				else 
					resultPage = ApplicationResources.ADMINFINDITRESULT;
					
			}
			else 
				resultPage = ApplicationResources.ERROR_PAGE;
			
		}

		request.setAttribute("prop", prop);
		result.setResultPage(resultPage);

		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.FINDIT;
	}

}
