package com.hrclub.model.command.advertisement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdvertManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.AdvertTO;
import com.hrclub.util.Logger;

public class AdvertEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERT_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		if (request.getParameter("method").equals("editItem")) {

			int adID = Integer.parseInt(request.getParameter("adID"));
			AdvertTO to = AdvertManager.getInstance().findAdvertByID(adID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.ADVERT_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}
		if (request.getParameter("method").equals("edit")) {

			int adID = Integer.parseInt(request.getParameter("adID"));
			String adname = request.getParameter("adname");
			String adpurl = request.getParameter("adpurl");
			String weburl = request.getParameter("weburl");
//			int type = Integer.parseInt(request.getParameter("type"));
			int type = 0;
			int status = Integer.parseInt(request.getParameter("status"));

			AdvertTO to = new AdvertTO();
			to.setAdID(adID);
			to.setAdname(adname);
			to.setAdpurl(adpurl);
			to.setWeburl(weburl);
			to.setType(type);
			to.setStatus(status);

			boolean flag = AdvertManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.ADVERT_RETURN;
			} else {
				throw new Exception("¹ã¸æÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}
		return null;

	}

}
