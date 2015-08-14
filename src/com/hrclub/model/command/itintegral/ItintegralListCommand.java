package com.hrclub.model.command.itintegral;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ItintegralManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ItintegralListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ITINTEGRAL_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		HttpSession session = request.getSession();

		String adminID = (String) session.getAttribute("adminuserid");
		if (null == adminID) {
			resultPage = ApplicationResources.ADMIN_LOGIN;

			result.setResultPage(resultPage);
			return result;

		}
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String itIDs = request.getParameter("itIDs");
		if (("null").equals(itIDs) || ("").equals(itIDs)) {
			Page itintegralpage = ItintegralManager.getInstance().findItByPage(
					pageNum, 10);
			request.setAttribute("itintegralpage", itintegralpage);
		} else {
			Page itintegralpage = ItintegralManager.getInstance().findItByPage(pageNum, 10, itIDs);
			request.setAttribute("itintegralpage", itintegralpage);
		}

		request.setAttribute("itIDs", itIDs);
		resultPage = ApplicationResources.ITINTEGRAL_LIST;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
