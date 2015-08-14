package com.hrclub.model.command.movementactor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementManager;
import com.hrclub.model.MovementactorManager;
import com.hrclub.to.MovementTO;
import com.hrclub.to.MovementactorTO;
import com.hrclub.util.Logger;

public class MovementactorEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENTACTOR_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		CommandResult result = new CommandResult();
		String resultPage = null;
		int maID = Integer.parseInt(request.getParameter("maID"));
		int moveID = Integer.parseInt(request.getParameter("moveID"));	
		int kind = Integer.parseInt(request.getParameter("kind"));
		int status = Integer.parseInt(request.getParameter("status"));
		String memberID = request.getParameter("memberID");
		String starttime = request.getParameter("starttime");

		MovementactorTO to = new MovementactorTO();

		to.setMaID(maID);
		to.setMoveID(moveID);
		to.setKind(kind);
		to.setStatus(status);
		to.setMemberID(memberID);
		to.setStarttime(starttime);

		boolean flag = MovementactorManager.getInstance().update(to);

		if (flag == true) {
			resultPage = ApplicationResources.MOVEMENTACTOR_RETURN;
		} else {
			throw new Exception("ÐÞ¸ÄÊ§°Ü£¡");
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
