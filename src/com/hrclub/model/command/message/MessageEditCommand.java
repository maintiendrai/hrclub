package com.hrclub.model.command.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.to.MessageTO;
import com.hrclub.util.Logger;

public class MessageEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.Message_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int messageID = Integer.parseInt(request.getParameter("messageID"));
			int kind = Integer.parseInt(request.getParameter("kind"));
			String subject = request.getParameter("subject");
			String context = request.getParameter("context");
			String puttime = request.getParameter("puttime");
			String starttime = request.getParameter("starttime");
			String endtime = request.getParameter("endtime");

			MessageTO to = new MessageTO();
			to.setMessageID(messageID);
			to.setKind(kind);
			to.setSubject(subject);				
			to.setContext(context);
			to.setPuttime(puttime);			
			to.setStarttime(starttime);
			to.setEndtime(endtime);		

			boolean flag = MessageManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.MESSAGE_RETURN;
			} else {
				throw new Exception("单位信息修改失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
