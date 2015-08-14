package com.hrclub.model.command.movement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MovementListlimtCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENT_LIST_LIMT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		Page movementpage = MovementManager.getInstance().findMoveByPage2(
				pageNum, 10);
		request.setAttribute("movementpage", movementpage);

		resultPage = ApplicationResources.MOVEMENT_LIST_LIMT;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
