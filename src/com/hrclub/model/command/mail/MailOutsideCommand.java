package com.hrclub.model.command.mail;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.*;
import com.hrclub.util.Logger;

public class MailOutsideCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MAIL_OUT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

			String[] revID = request.getParameterValues("revID");
			String subject = request.getParameter("subject");
			String context = request.getParameter("context");
			List hrmails = null;
			List itmails = null;
			
			if(revID.length==2){
			
		    	hrmails = HRManager.getInstance().getAllHREmail();
			
		    	itmails = ITUserManager.getInstance().getAllUserEmail();
			
			}
			
			if(revID[0].equals("1")&&revID.length==1){
				
				hrmails = HRManager.getInstance().getAllHREmail();
				
			}
			
            if(revID[0].equals("2")&&revID.length==1){
				
            	itmails = ITUserManager.getInstance().getAllUserEmail();
				
			}
			
			MailManager m = MailManager.getInstance();
			try {
				
				if(hrmails != null)
					m.startSendMail(hrmails, subject, context);
				
				if(itmails != null)
					m.startSendMail(itmails, subject, context);
    			
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			boolean flag = true;

			if (flag == true) {
				resultPage = ApplicationResources.MAIL_SUCCESS;
			} else {
				throw new Exception("∑¢ÀÕ ß∞‹£°");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}
}
