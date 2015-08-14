package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.JobletterTO;
import com.hrclub.util.Logger;

public class QueryletterCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		JobletterTO to=null;
		String sign = request.getParameter("sign");
		String letterID = request.getParameter("letterID");
	   to=JobManager.getInstance().findJobletterByID(letterID);
	   
	   if(sign.equals("itsign"))
		resultPage = ApplicationResources.SHOWLETTER;
	   else if(sign.equals("hrsign")){
		   JobManager.getInstance().updateLetterStatus(letterID, 1);
		   resultPage = ApplicationResources.HRSHOWLETTER;
		   }
		request.setAttribute("to", to);

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;

	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.QUERYLETTER;
	}

}
