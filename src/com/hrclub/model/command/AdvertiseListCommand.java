package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.util.*;
import com.hrclub.to.*;
import com.hrclub.*;
public class AdvertiseListCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERTISE_LIST;
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
		String strPageNum = request.getParameter("pageNum");
		String strPageLength = request.getParameter("pageLength");
		int pageNum = 1;
		int pageLen = DEFAULT_PAGE_LENGTH;
		if (strPageNum != null) {
			if (!strPageNum.equals("")) {
				pageNum = Integer.parseInt(strPageNum);
			}
		}
		if (strPageLength != null) {
			if (!strPageLength.equals("")) {
				pageLen = Integer.parseInt(strPageLength);
			}
		}

		AdvertisementManager am = AdvertisementManager.getInstance();

		String action = request.getParameter("action");
		if (action == null)
			action = "";

		if (action.equalsIgnoreCase("delete")) {
			String adID = request.getParameter("adID");
			am.deleteAdvertise(Integer.parseInt(adID));

		}
		Page page = null;

		page = am.findNoticeByPage(pageNum, pageLen );

		resultPage = ApplicationResources.ADVERTISE_LIST;

		request.setAttribute("page", page);
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
