package com.hrclub.model.command.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.InsideMailManager;
import com.hrclub.to.MailTO;
import com.hrclub.util.Logger;

public class MailEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MAIL_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int mailID = Integer.parseInt(request.getParameter("mailID"));
			String sentID = request.getParameter("sentID");
			int sentkind = Integer.parseInt(request.getParameter("sentkind"));
			String revID = request.getParameter("revID");
			int revkind = Integer.parseInt(request.getParameter("revkind"));
			String subject = request.getParameter("subject");
			String context = request.getParameter("context");
			String time = request.getParameter("time");
			int status = Integer.parseInt(request.getParameter("status"));

			MailTO to = new MailTO();
		    to.setMailID(mailID);
			to.setSentID(sentID);
		    to.setSentkind(sentkind);
		    to.setRevID(revID);
		    to.setRevkind(revkind);
		    to.setSubject(subject);
		    to.setContext(context);
		    to.setTime(time);
		    to.setStatus(status);

			boolean flag = InsideMailManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.MAIL_RETURN;
			} else {
				throw new Exception("ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
