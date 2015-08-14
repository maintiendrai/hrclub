package com.hrclub.model.command;

import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.util.*;
import com.hrclub.to.*;
import com.hrclub.*;

public class UserDetailCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USER_DETAIL;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute(USER_NAME);
		String usertype = (String) session.getAttribute(USER_TYPE);

		

		CommandResult result = new CommandResult();

		String resultPage = null;

		String userID = request.getParameter("userID");

		UserManager um = UserManager.getInstance();

		UserTO user = null;

		String action = request.getParameter("action");
		if (action == null)
			action = "";

		if (action.equalsIgnoreCase("update")) {
			if(usertype==null) throw new Exception("请先登录！");
			int intUsertype = Integer.parseInt(usertype);
			
			if (intUsertype == ADMIN_ROOT|| intUsertype == ADMIN_MANAGER) {
				user = um.findUserByID(userID);
			} else if (intUsertype == USER) {
				user = um.findUserByID(username);
			} else {
				throw new Exception("权限不足");
			}

			resultPage = ApplicationResources.USER_EDIT;
		} else if (action.equalsIgnoreCase("add")) {
			if(usertype==null) throw new Exception("请先登录！");
			int intUsertype = Integer.parseInt(usertype);
			
			if (intUsertype == ADMIN_ROOT || intUsertype == ADMIN_MANAGER) {
				user = new UserTO();
				resultPage = ApplicationResources.USER_EDIT;
			} else {
				throw new Exception("权限不足");
			}
		} else {
			user = um.findUserByID(userID);
			resultPage = ApplicationResources.USER_DETAIL;
		}

		user.setPassword("");
		request.setAttribute("user", user);
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
