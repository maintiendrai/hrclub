package com.hrclub.model.command.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.to.MessageTO;
import com.hrclub.util.Logger;

public class MessQueryCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.Mess_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int messageID = Integer.parseInt(request.getParameter("messageID"));
		MessageTO to = MessageManager.getInstance().findMessByID(
				messageID);
		request.setAttribute("to", to);

		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.MESS_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} else if (request.getParameter("method").equals("edit")) {

			resultPage = ApplicationResources.MESSAGE_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else {
			return null;
		}
	}
}
