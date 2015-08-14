package com.hrclub.model.command.hr;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.to.HRinfoTO;
import com.hrclub.util.Logger;

public class QeueyHRCommand extends Command {


	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.QEUEYHR;
		
	}
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
		String hrID=null;
		
		String sign=request.getParameter("sign");
		if(null!=sign&&sign.equals("it")){
			HRManager ituserdao =HRManager.getInstance();
			hrID=request.getParameter("hrID");
	    	HRinfoTO	to=ituserdao.findHRByID(hrID);
	    	request.setAttribute("to", to);
	    	resultPage ="/hr/hrinfoforit.jsp";
			result.setResultPage(resultPage);
	    	return result;
		}
		else
		{
		
		hrID = (String) request.getSession().getAttribute("hrID");
		
		 if(hrID==null)
			 hrID=request.getParameter("hrID");
		if(hrID!=null){
	
	  	HRManager ituserdao =HRManager.getInstance();
	    	HRinfoTO	to=ituserdao.findHRByID(hrID);
       if(null!=to){
	    	request.setAttribute("to", to);
	    	
	    	if(null==sign)
			resultPage = ApplicationResources.HRINFO;
	    	else if(sign.equals("sign"))
	    		resultPage = ApplicationResources.ADMINHRINFO;
	    	else if(sign.equals("it"))
	    		resultPage ="/hr/hrinfoforit.jsp";
	    	
       } else {
    	   resultPage = ApplicationResources.ERROR_PAGE;
    	   
       }
			}
		else
			resultPage = ApplicationResources.HRLOGIN;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
		}
	}
	

}
