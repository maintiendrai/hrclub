package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.ApplicationResources;
import com.hrclub.util.*;
import com.hrclub.to.*;
public class ChangePasswordCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.CHANGE_PASSWORD;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();

		String resultPage = null;
		
		HttpSession session = request.getSession();
		String username=(String)session.getAttribute( USER_NAME);
		String usertype=(String)session.getAttribute( USER_TYPE);
		if(username==null||usertype==null){
			throw new Exception("ÇëÏÈµÇÂ¼£¡");
		}
		int intUsertype=Integer.parseInt(usertype);
		String oldpassword = request.getParameter("oldpassword"); 
		String newpassword = request.getParameter("newpassword");  
		
		boolean f=false;
		if(intUsertype== EXPERT||intUsertype== USER){
			f=UserManager.getInstance().changePassword(username,oldpassword,newpassword,intUsertype);
		}  else{
			
		} 
		if (f) {
			resultPage = ApplicationResources.SUCCESS_PAGE+"?info=ÐÞ¸ÄÃÜÂë³É¹¦£¡";
		} else {
			throw new Exception("ÐÞ¸ÄÃÜÂëÊ§°Ü£¡");
		} 
		
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
