package com.hrclub.model.command.movement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementManager;
import com.hrclub.util.Logger;

public class MovementDelCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENT_DELETE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int moveID = Integer.parseInt(request.getParameter("moveID"));

		boolean flag = MovementManager.getInstance().delete(moveID);

		if (flag == true) {
			resultPage = ApplicationResources.MOVEMENT_RETURN;
		} else {
			throw new Exception("É¾³ý»î¶¯Ê§°Ü£¡");
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
