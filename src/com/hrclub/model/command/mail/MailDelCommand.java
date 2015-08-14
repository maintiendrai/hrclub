package com.hrclub.model.command.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.InsideMailManager;
import com.hrclub.util.Logger;

public class MailDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MAIL_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int mailID = Integer.parseInt(request.getParameter("mailID"));
		
		boolean flag=InsideMailManager.getInstance().delete(mailID);
		
		if(flag==true){
			resultPage = ApplicationResources.MAIL_RETURN;
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
