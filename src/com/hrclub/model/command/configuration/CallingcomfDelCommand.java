package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.util.Logger;

public class CallingcomfDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.CALLINGCOMF_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int callingID = Integer.parseInt(request.getParameter("callingID"));
		
		boolean flag=ComfManager.getInstance().deleteCalling(callingID);
		
		if(flag==true){
			resultPage = ApplicationResources.CALLINGCOMF_RETURN;
		}else{
			throw new Exception("É¾³ýÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
