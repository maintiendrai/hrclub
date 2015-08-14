package com.hrclub.model.command.admininfo;

import java.io.PrintWriter;

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

public class AdminLoginCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMIN_LOGIN;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		HttpSession session = request.getSession();
		String adminID = request.getParameter("adminID");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		AdmininfoTO to = AdmininfoManager.getInstance().findAdminByIDAndRole(adminID,role);
//		PrintWriter out = response.getWriter();
		if (to != null) {
			if (!to.getPassword().equals(password)){
				String reply ="√‹¬Î¥ÌŒÛ!";
				request.setAttribute("reply", reply);
				String userid = "userid";
				session.setAttribute("adminuserid", userid);
//				out.print("√‹¬Î¥ÌŒÛ!");
				resultPage = ApplicationResources.ADMIN_LOGIN;
			}
			else {
				
				session.setAttribute("adminuserid", adminID);
				session.setAttribute("adminrole", role);
				resultPage = ApplicationResources.ADMIN_INDEX;
			}
		} else {
			
		     	String reply ="”√ªß√˚¥ÌŒÛ!";
		    	request.setAttribute("reply", reply);
		    	String userid = "userid";
		    	session.setAttribute("adminuserid", userid);
//		    	out.print("”√ªß√˚¥ÌŒÛ!");
		    	resultPage = ApplicationResources.ADMIN_LOGIN;
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
//		out.flush();
//		out.close();
		return result;

	}
}
