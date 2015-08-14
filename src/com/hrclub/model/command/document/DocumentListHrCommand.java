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
import com.hrclub.model.MessageManager;
import com.hrclub.to.IntegralTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class DocumentListHrCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DOCUMENT_LIST_HR_ALL;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
        HttpSession session = request.getSession();
		
		String hrID = (String)session.getAttribute("hrID");
		IntegralTO to=IntegralManager.getInstance().findHrByID(hrID);
		request.setAttribute("to", to);
		if(null==hrID) {
			resultPage = ApplicationResources.HRLOGIN;

			result.setResultPage(resultPage);
			return result;
			
		}
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String nameIDs = request.getParameter("nameIDs");
		String kinds = request.getParameter("kinds");
		if(("null").equals(nameIDs)&&("null").equals(kinds)){
			Page mypage=DocumentManager.getInstance().findDocumentByPage(pageNum, 10);
	    	request.setAttribute("mypage", mypage);
		}
		else {
	    	Page mypage=DocumentManager.getInstance().findDocumentByPage(pageNum, 10, nameIDs, kinds);
	    	request.setAttribute("mypage", mypage);
		}
		
		request.setAttribute("nameIDs", nameIDs);
		request.setAttribute("kinds", kinds);
		resultPage = ApplicationResources.DOCUMENT_LIST_HR_ALL;
		
		 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}
}
