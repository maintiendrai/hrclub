package com.hrclub.model.command.serverorder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ServerorderMannager;
import com.hrclub.to.ServerorderTO;
import com.hrclub.util.Logger;

public class ServerQueryCommand extends Command{
	
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SERVER_QUERY;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Integer oderID = Integer.valueOf(request.getParameter("orderID"));
		
		ServerorderTO to=ServerorderMannager.getInstance().findOderByID(oderID);
		request.setAttribute("to", to);
	
		resultPage = ApplicationResources.SERVER_SHOW;
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}

}
