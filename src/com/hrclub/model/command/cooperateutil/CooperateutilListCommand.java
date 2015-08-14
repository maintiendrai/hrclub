package com.hrclub.model.command.cooperateutil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.CooperateutilManager;
import com.hrclub.model.MessageManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class CooperateutilListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.COOPERATEUTIL_LIST;
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
		String utilnames = request.getParameter("utilnames");
		String utilkinds = request.getParameter("utilkinds");
		if(("null").equals(utilnames)&&("null").equals(utilkinds)){
			Page mypage=CooperateutilManager.getInstance().findUtilByPage(pageNum, 10);
	    	request.setAttribute("mypage", mypage);
		}
		else {
	    	Page mypage=CooperateutilManager.getInstance().findUtilByPage(pageNum, 10, utilnames, utilkinds);
	    	request.setAttribute("mypage", mypage);
		}
		
		request.setAttribute("utilnames", utilnames);
		request.setAttribute("utilkinds", utilkinds);
		resultPage = ApplicationResources.COOPERATEUTIL_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
