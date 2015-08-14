package com.hrclub.model.command.advertisement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdvertManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.util.Logger;

public class AdvertDelCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERT_DELETE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int adID = Integer.parseInt(request.getParameter("adID"));

		boolean flag = AdvertManager.getInstance().delete(adID);

		if (flag == true) {
			resultPage = ApplicationResources.ADVERT_RETURN;
		} else {
			throw new Exception("É¾³ýÊ§°Ü£¡");
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
