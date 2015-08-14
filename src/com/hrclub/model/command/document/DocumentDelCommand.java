package com.hrclub.model.command.document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.DocumentManager;
import com.hrclub.util.Logger;

public class DocumentDelCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DOCUMENT_DELETE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getParameter("method").equals("delall")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			int documentID = Integer.parseInt(request
					.getParameter("documentID"));

			boolean flag = DocumentManager.getInstance().delete(documentID);

			if (flag == true) {
				resultPage = ApplicationResources.DOCUMENT_RETURN;
			} else {
				throw new Exception("É¾³ýÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		if (request.getParameter("method").equals("delhr")) {
			
			CommandResult result = new CommandResult();
			String resultPage = null;
            HttpSession session = request.getSession();
			
			String hrID = (String)session.getAttribute("hrID");
			if(null==hrID) {
				resultPage = ApplicationResources.HRLOGIN;

				result.setResultPage(resultPage);
				return result;
				
			}
			int documentID = Integer.parseInt(request
					.getParameter("documentID"));

			boolean flag = DocumentManager.getInstance().delete(documentID);

			if (flag == true) {
				resultPage = "/FrontController.do?operation=documentquery&method=showhr&pageNum=1";
			} else {
				throw new Exception("É¾³ýÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		return null;
	}
}
