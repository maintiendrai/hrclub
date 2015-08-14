package com.hrclub.model.command.document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.DocumentManager;
import com.hrclub.model.IntegralManager;
import com.hrclub.to.DocumentTO;
import com.hrclub.to.IntegralTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class DocumentQueryCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DOCUMENT_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		

		if (request.getParameter("method").equals("show")) {
            
			int documentID = Integer.parseInt(request.getParameter("documentID"));
			
			DocumentTO to = DocumentManager.getInstance().findDocumentByID(documentID);
			
			request.setAttribute("to", to);
			resultPage = ApplicationResources.DOCUMENT_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} 
		if (request.getParameter("method").equals("edit")) {
            
			int documentID = Integer.parseInt(request.getParameter("documentID"));
			
			DocumentTO to = DocumentManager.getInstance().findDocumentByID(documentID);
			
			request.setAttribute("to", to);
			
			resultPage = ApplicationResources.DOCUMENT_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} 
		if (request.getParameter("method").equals("showhr")) {
            
			HttpSession session = request.getSession();
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			if(null==session.getAttribute("hrID")){
				
				resultPage = ApplicationResources.HRLOGIN;
				
				 
				result.setResultPage(resultPage);
				return result;
			}
			else{
			String nameID =(String) session.getAttribute("hrID");
			IntegralTO to=IntegralManager.getInstance().findHrByID(nameID);
			request.setAttribute("to", to);
			Page mypage=DocumentManager.getInstance().findDocumentByPage(pageNum, 10,nameID);
			request.setAttribute("mypage", mypage);
			
			resultPage = ApplicationResources.DOCUMENT_LIST_HR;
			
			 
			result.setResultPage(resultPage);

			logger
					.debug(this.getName() + "'s result will be sent to "
							+ resultPage);

			return result;}

		} 
		
        if (request.getParameter("method").equals("showone")) {
            
            int documentID = Integer.parseInt(request.getParameter("documentID"));
			
			DocumentTO to = DocumentManager.getInstance().findDocumentByID(documentID);
			
			request.setAttribute("to", to);
			resultPage = ApplicationResources.DOCUMENT_SHOW_HR;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} 
		return null;
		
	}
}
