package com.hrclub.model.command.itintegral;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ItintegralManager;
import com.hrclub.to.ItintegralTO;
import com.hrclub.util.Logger;

public class ItintegralQueryCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ITINTEGRAL_QUERY;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String itID = request.getParameter("itID");

		ItintegralTO to = ItintegralManager.getInstance().findItByID(itID);
		request.setAttribute("to", to);

		resultPage = ApplicationResources.ITINTEGRAL_SHOW;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
