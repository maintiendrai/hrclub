package com.hrclub.model.command.mail;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.model.ITUserManager;
import com.hrclub.model.InsideMailManager;
import com.hrclub.to.MailTO;
import com.hrclub.util.Logger;

public class MailAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MAIL_ADD;
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

		if (request.getParameter("method").equals("addItem")) {
			
			String puttime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

			request.setAttribute("puttime", puttime);
			
		 	HRManager hrdao =HRManager.getInstance();
		 	
		 	List hrID = hrdao.getAllHrID();
		 	
		 	request.setAttribute("hrID", hrID);
		 	
		 	ITUserManager itdao =ITUserManager.getInstance();
		 	
		 	List itID = itdao.getAllUserID();
		 	
		 	request.setAttribute("itID", itID);
			
			resultPage = ApplicationResources.MAIL_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("add")) {
			String sentID = request.getParameter("sentID");
			int sentkind = 3;
			String revID = request.getParameter("revID");
			int revkind = Integer.parseInt(request.getParameter("revkind"));
			String subject = request.getParameter("subject");
			String context = request.getParameter("context");
			String time = request.getParameter("time");
			int status = 0;
			String[] revIDs=revID.split(",");
			boolean flag = false;

			for(int i=0;i<revIDs.length;i++) {
		    	MailTO to = new MailTO();
		        to.setSentID(sentID);
		        to.setSentkind(sentkind);
	    	    to.setRevID(revIDs[i]);
		        to.setRevkind(revkind);
		        to.setSubject(subject);
		        to.setContext(context);
	    	    to.setTime(time);
		        to.setStatus(status);
            	flag = InsideMailManager.getInstance().insert(to);	 
			}
			if (flag == true) {
				resultPage = ApplicationResources.MAIL_RETURN;
			} else {
				throw new Exception("·¢ËÍÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else {
			return null;
		}

	}
}
