package com.hrclub.model.command;

import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.ApplicationResources;
import com.hrclub.util.*;
import com.hrclub.to.*;

public class UserLevelCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USER_LEVEL;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute(USER_NAME);
		String usertype = (String) session.getAttribute(USER_TYPE);
		int intUsertype = Integer.parseInt(usertype);

		CommandResult result = new CommandResult();

		String resultPage = null;

		String userID = request.getParameter("userID");

		String action = request.getParameter("action");
		if (action == null)
			action = "";
		if (action.equalsIgnoreCase("update")) {
			if (intUsertype == ADMIN_ROOT || intUsertype == ADMIN_MANAGER) {
				String point = request.getParameter("point");
				String credit = request.getParameter("credit");
				String valueRate = request.getParameter("valueRate");
				String isvip = request.getParameter("isvip");
				UserLevelTO userLevel = new UserLevelTO();
				userLevel.setUserID(userID);
				userLevel.setPoint(Integer.parseInt(point));
				userLevel.setCredit(Integer.parseInt(credit));
				userLevel.setValueRate(Float.parseFloat(valueRate));
				userLevel.setIsvip(Integer.parseInt(isvip));
				
				UserManager.getInstance().updateUserLevelByID(userLevel);
				resultPage = "/qy.act?operation=userlist";
				
			} else {
				throw new Exception("请以管理员的身份登录！");
			}
		} else {
			UserLevelTO userLevel = UserManager.getInstance()
					.findUserLevelByID(userID);
			if (intUsertype == ADMIN_ROOT || intUsertype == ADMIN_MANAGER) {
				resultPage = ApplicationResources.USER_LEVEL_MANAGER;
			} else {
				resultPage = ApplicationResources.USER_LEVEL;
			}

			request.setAttribute("userLevel", userLevel);
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
