package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.CooperateutilManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ITskillcomfListCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ITSKILLCOMF_LIST;
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
		String skillame = request.getParameter("skillame");
		if(skillame==null){
			Page mypage=ComfManager.getInstance().findITskillByPage(pageNum, 10);
			request.setAttribute("mypage", mypage);
		}
		else {
			Page mypage=ComfManager.getInstance().findITskillByPage(pageNum, 10, skillame);
			request.setAttribute("mypage", mypage);
		}
		
		resultPage = ApplicationResources.ITSKILLCOMF_LIST;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
