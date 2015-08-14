package com.hrclub.model.command.advertisement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdvertManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.AdvertTO;
import com.hrclub.util.Logger;

public class AdvertAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERT_ADD;
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
		if (request.getParameter("method").equals("addItem")) {
			resultPage = ApplicationResources.ADVERT_ADD;
			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}
		if (request.getParameter("method").equals("add")) {
			
			String adname = request.getParameter("adname");
			String adpurl = request.getParameter("adpurl");
			String weburl = request.getParameter("weburl");
//			int type = Integer.parseInt(request.getParameter("type"));
			int type = 0;
			int status = Integer.parseInt(request.getParameter("status"));

			AdvertTO to = new AdvertTO();
			
			to.setAdname(adname);
			to.setAdpurl(adpurl);
			to.setWeburl(weburl);
			to.setType(type);
			to.setStatus(status);

			boolean flag = AdvertManager.getInstance().insert(to);

			if (flag == true) {
				resultPage = ApplicationResources.ADVERT_RETURN;
			} else {
				throw new Exception("π„∏ÊÃÌº” ß∞‹£°");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		return null;
	}
}
