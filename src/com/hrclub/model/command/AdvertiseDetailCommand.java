package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.ApplicationResources;
import com.hrclub.util.*;
import com.hrclub.to.*;
public class AdvertiseDetailCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERTISE_DETAIL;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute(USER_NAME);
		String usertype = (String) session.getAttribute(USER_TYPE);
		if (username == null || usertype == null) {
			throw new Exception("请先登录！");
		}
		int intUsertype = Integer.parseInt(usertype);
		if (intUsertype != ADMIN_MANAGER && intUsertype != ADMIN_ROOT) {
			throw new Exception("请以管理员的身份登录！");
		}
		
		CommandResult result = new CommandResult();

		String resultPage = null;

		String adID = request.getParameter("adID"); 

		AdvertisementManager am = AdvertisementManager.getInstance();

		AdvertisementTO ad = null;
		
		String action = request.getParameter("action");
		if (action == null)
			action = "";
		
		if (action.equalsIgnoreCase("update")) {
			ad = am.findAdvertiseByID(Integer.parseInt(adID));
			resultPage = ApplicationResources.ADVERTISE_EDIT;
		} else if (action.equalsIgnoreCase("add")) {
			ad = new AdvertisementTO();
			resultPage = ApplicationResources.ADVERTISE_EDIT;
		} else {
			 
		}
		
		
		request.setAttribute("ad",ad);
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
