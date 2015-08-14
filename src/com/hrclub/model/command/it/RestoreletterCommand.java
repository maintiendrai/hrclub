package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.util.Logger;

public class RestoreletterCommand  extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		String restore = request.getParameter("restore");
		String letterID = request.getParameter("letterID");
		String jobID = request.getParameter("jobID");
		
	    JobManager.getInstance().updateRestore(letterID, restore);
	    resultPage = "/showjobleter.do?operation=showjobleter&pageNum=1&jobID="+jobID;
		
		
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;

	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.RESTORELETTER;
	}

}
