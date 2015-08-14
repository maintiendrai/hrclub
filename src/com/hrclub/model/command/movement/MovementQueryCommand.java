package com.hrclub.model.command.movement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementManager;
import com.hrclub.to.MovementTO;
import com.hrclub.util.Logger;

public class MovementQueryCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENT_QUERY;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int moveID = Integer.parseInt(request.getParameter("moveID"));

		MovementTO to = MovementManager.getInstance().findMovementByID(moveID);
		request.setAttribute("to", to);

		if (request.getParameter("method").equals("show")) {

			resultPage = ApplicationResources.MOVEMENT_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} else if (request.getParameter("method").equals("edit")) {

			resultPage = ApplicationResources.MOVEMENT_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else {
			return null;
		}

	}

}
