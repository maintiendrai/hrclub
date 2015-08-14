package com.hrclub.model.command.serverorder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.model.ServerorderMannager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ServerorderListCommand extends Command{
	
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SERVERORDER_LIST;
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
		String hrIDs = request.getParameter("hrIDs");
		String kinds = request.getParameter("kinds");
		String statuss = request.getParameter("statuss");
		if(("null").equals(hrIDs)&&("null").equals(kinds)&&("null").equals(statuss)){
			Page mypage=ServerorderMannager.getInstance().findOderByPage(pageNum, 10);
	    	request.setAttribute("mypage", mypage);
		}
		else {
	    	Page mypage=ServerorderMannager.getInstance().findOderByPage(pageNum, 10, hrIDs, kinds, statuss);
	    	request.setAttribute("mypage", mypage);
		}
	
		request.setAttribute("hrIDs", hrIDs);
		request.setAttribute("kinds", kinds);
		request.setAttribute("statuss", statuss);
		resultPage = ApplicationResources.SERVERORDER_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
