package com.hrclub.model.command.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.IntegralManager;
import com.hrclub.model.MessageManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MessageListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.Message_LIST;
	}
	
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
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String puttimes = request.getParameter("puttimes");
		String kinds = request.getParameter("kinds");
		if(("null").equals(puttimes)&&("null").equals(kinds)){
			Page mypage=MessageManager.getInstance().findMessByPage(pageNum, 10);
	    	request.setAttribute("mypage", mypage);
		}
		else {
	    	Page mypage=MessageManager.getInstance().findMessByPage(pageNum, 10, puttimes, kinds);
	    	request.setAttribute("mypage", mypage);
		}
		
		request.setAttribute("puttimes", puttimes);
		request.setAttribute("kinds", kinds);
		resultPage = ApplicationResources.MESSAGE_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
