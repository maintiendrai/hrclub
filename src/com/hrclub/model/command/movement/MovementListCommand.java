package com.hrclub.model.command.movement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.model.MovementManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MovementListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENT_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
        HttpSession session = request.getSession();
		
		String adminID = (String)session.getAttribute("adminuserid");
		if(null==adminID) {
			resultPage = ApplicationResources.ADMIN_LOGIN;

			result.setResultPage(resultPage);
			return result;
		
		}	
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String puttimes = request.getParameter("puttimes");
		String statuss = request.getParameter("statuss");
		if(("null").equals(puttimes)&&("null").equals(statuss)){
			Page movementpage = MovementManager.getInstance().findMoveByPage(pageNum, 10);
			request.setAttribute("movementpage", movementpage);
		}
		else {
			Page movementpage = MovementManager.getInstance().findMoveByPage(pageNum, 10, puttimes, statuss);
			request.setAttribute("movementpage", movementpage);
		}
		
		request.setAttribute("puttimes", puttimes);
		request.setAttribute("statuss", statuss);
		resultPage = ApplicationResources.MOVEMENT_LIST;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
