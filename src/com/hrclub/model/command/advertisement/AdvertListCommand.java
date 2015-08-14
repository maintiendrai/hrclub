package com.hrclub.model.command.advertisement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdvertManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class AdvertListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERT_LIST;
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
		String adnames = request.getParameter("adnames");
		String statuss = request.getParameter("statuss");
		if(("null").equals(adnames)&&("null").equals(statuss)){
			Page mypage=AdvertManager.getInstance().findAdvertByPage(pageNum, 10);
	    	request.setAttribute("mypage", mypage);
		}
		else {
			Page mypage=AdvertManager.getInstance().findAdvertByPage(pageNum, 10, adnames, statuss);
	    	request.setAttribute("mypage", mypage);
		}
		
		request.setAttribute("adnames", adnames);
		request.setAttribute("statuss", statuss);

		resultPage = ApplicationResources.ADVERT_LIST;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
