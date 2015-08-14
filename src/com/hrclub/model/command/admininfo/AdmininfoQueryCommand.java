package com.hrclub.model.command.admininfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdmininfoManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.AdmininfoTO;
import com.hrclub.util.Logger;

public class AdmininfoQueryCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMININFODAO_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {

		if (request.getParameter("method").equals("show")) {
			
			CommandResult result = new CommandResult();
			String resultPage = null;
			String adminID = request.getParameter("adminID");
			AdmininfoTO to = AdmininfoManager.getInstance().findAdminByID(adminID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.ADMININFO_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} 
		
		if (request.getParameter("method").equals("edit")) {
			
			CommandResult result = new CommandResult();
			String resultPage = null;
			String adminID = request.getParameter("adminID");
			AdmininfoTO to = AdmininfoManager.getInstance().findAdminByID(adminID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.ADMININFO_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} 
		
		if (request.getParameter("method").equals("editmima")) {
			
			CommandResult result = new CommandResult();
			String resultPage = null;
			HttpSession session = request.getSession();
			
			String adminID = (String)session.getAttribute("adminuserid");
			if(null==adminID) {
				resultPage = ApplicationResources.ADMIN_LOGIN;

				result.setResultPage(resultPage);
				return result;
			
			}		
			AdmininfoTO to = AdmininfoManager.getInstance().findAdminByID(adminID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.ADMININFO_EDITMIMA;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} 
			
		return null;
		
	}
}
