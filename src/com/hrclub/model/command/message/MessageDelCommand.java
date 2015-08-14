package com.hrclub.model.command.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MessageManager;
import com.hrclub.util.Logger;

public class MessageDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.Message_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int messageID = Integer.parseInt(request.getParameter("messageID"));
		
		boolean flag=MessageManager.getInstance().delete(messageID);
		
		if(flag==true){
			resultPage = ApplicationResources.MESSAGE_RETURN;
		}else{
			throw new Exception("��λ��Ϣɾ��ʧ�ܣ�");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
