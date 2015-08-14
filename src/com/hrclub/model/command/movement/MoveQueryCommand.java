package com.hrclub.model.command.movement;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.*;
import com.hrclub.to.MovementTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MoveQueryCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVE_QUERY;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int moveID = Integer.parseInt(request.getParameter("moveID"));

		MovementTO to = MovementManager.getInstance().findMovementByID(moveID);
		request.setAttribute("to", to);	

		if (request.getParameter("method").equals("show")) {

			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			Page page = MovementactorManager.getInstance().findActorByMovID(pageNum, 10, moveID);
			request.setAttribute("page", page);
			
			resultPage = ApplicationResources.MOVE_SHOW;

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
