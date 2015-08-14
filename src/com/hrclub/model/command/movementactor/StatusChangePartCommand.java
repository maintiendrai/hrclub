package com.hrclub.model.command.movementactor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementactorManager;
import com.hrclub.util.Logger;

public class StatusChangePartCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENTACTOR_CHANGE_PART;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		CommandResult result = new CommandResult();
		String resultPage = null;
		MovementactorManager MovementactorDAO = MovementactorManager.getInstance();
		String[] maID = request.getParameterValues("maID");
		
		int moveID = Integer.parseInt(request.getParameter("moveID"));
		boolean flag = false;
		for(int i=0;i<maID.length;i++)
		{
			flag = MovementactorDAO.changestatus(maID[i],1);
			
		}
		
		if (flag == true) {
			resultPage = "/movementactor/movementactor.do?operation=movequery&method=show&pageNum=1&moveID="+moveID;
		} else {
			throw new Exception("�޸�ʧ�ܣ�");
		}

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
