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

public class AdmininfoEditCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMININFODAO_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		if (request.getParameter("method").equals("update")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			String adminID = request.getParameter("adminID");
			String password = request.getParameter("password");
			String adminname = request.getParameter("adminname");
			int role = Integer.parseInt(request.getParameter("role"));

			AdmininfoTO to = new AdmininfoTO();
			to.setAdminID(adminID);
			to.setPassword(password);
			to.setAdminname(adminname);
			to.setRole(role);

			boolean flag = AdmininfoManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.ADMININFO_RETURN;
			} else {
				throw new Exception("ÐÅÏ¢ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("updateone")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			String adminID = request.getParameter("adminID");
			String password = request.getParameter("password");
			String oldpassword = request.getParameter("oldpassword");
			String adminname = request.getParameter("adminname");
			HttpSession session = request.getSession();

			int role = Integer.parseInt(session.getAttribute("adminrole")
					.toString());
			AdmininfoTO adminTo = AdmininfoManager.getInstance().findAdminByID(adminID);
			if(!adminTo.getPassword().equals(oldpassword)) {
				request.setAttribute("msgerror", "¾ÉÃÜÂë´íÎó!");
				resultPage = "/admininfo.do?operation=admininfoquery&method=editmima";
				result.setResultPage(resultPage);
				return result;
			}
			
			AdmininfoTO to = new AdmininfoTO();
			to.setAdminID(adminID);
			to.setPassword(password);
			to.setAdminname(adminname);
			to.setRole(role);

			boolean flag = AdmininfoManager.getInstance().update(to);

			if (flag == true) {
				request.setAttribute("msgerror", "ÐÞ¸Ä³É¹¦!");
				resultPage = "/admininfo.do?operation=admininfoquery&method=editmima";
			} else {
				throw new Exception("ÐÅÏ¢ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		
		return null;

	}

}
