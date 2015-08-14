package com.hrclub.model.command.movementactor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.model.MovementactorManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MovactorListCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVACTOR_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
       
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String memberID = request.getParameter("memberID");
		String kind = request.getParameter("kind");
		
		Page mypage = MovementactorManager.getInstance().findMovByUserID(pageNum, 10, memberID, kind);
		request.setAttribute("mypage", mypage);
		
		
		request.setAttribute("memberID", memberID);
		request.setAttribute("kind", kind);
		resultPage = ApplicationResources.MOVACTOR_LIST;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
