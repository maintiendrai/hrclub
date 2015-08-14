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

public class MovementEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENT_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		CommandResult result = new CommandResult();
		String resultPage = null;
		int moveID = Integer.parseInt(request.getParameter("moveID"));
		int integral = Integer.parseInt(request.getParameter("integral"));
		String subject = request.getParameter("subject");
		String context = request.getParameter("context");
		int status = Integer.parseInt(request.getParameter("status"));
		String puttime = request.getParameter("puttime");
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");

		MovementTO to = new MovementTO();

		to.setMoveID(moveID);
		to.setIntegral(integral);
		to.setSubject(subject);
		to.setContext(context);
		to.setStatus(status);
		to.setPuttime(puttime);
		to.setStarttime(starttime);
		to.setEndtime(endtime);

		boolean flag = MovementManager.getInstance().update(to);

		if (flag == true) {
			resultPage = ApplicationResources.MOVEMENT_RETURN;
		} else {
			throw new Exception("»î¶¯ÐÞ¸ÄÊ§°Ü£¡");
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
