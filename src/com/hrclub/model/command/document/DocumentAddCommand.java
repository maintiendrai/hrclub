package com.hrclub.model.command.document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.DocumentManager;
import com.hrclub.sample.upload.BackGroundService;
import com.hrclub.sample.upload.FileUploadStatus;
import com.hrclub.to.DocumentTO;
import com.hrclub.util.ConfigManager;
import com.hrclub.util.Logger;

public class DocumentAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DOCUMENT_ADD;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
      
		if (request.getParameter("method").equals("addItem")) {

		    HttpSession session = request.getSession();
				
			String adminID = (String)session.getAttribute("adminuserid");
			if(null==adminID) {
				resultPage = ApplicationResources.ADMIN_LOGIN;

				result.setResultPage(resultPage);
				return result;
				
			}	

			resultPage = ApplicationResources.DOCUMENT_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		
		if (request.getParameter("method").equals("addItemHr")) {
            
			HttpSession session = request.getSession();
			
			String hrID = (String)session.getAttribute("hrID");
			if(null==hrID) {
				resultPage = ApplicationResources.HRLOGIN;

				result.setResultPage(resultPage);
				return result;
				
			}
			
			int totlesize = DocumentManager.getInstance().totlesize(hrID,"1");
			String filebaseurl = ConfigManager.getPropValue("file_totlesize");
			int size = Integer.parseInt(filebaseurl);
			
			if(totlesize >size) {
				
				request.setAttribute("msgerror", "您已超过文件上传总量!");
				resultPage = "/FrontController.do?operation=documentquery&method=showhr&pageNum=1";

				result.setResultPage(resultPage);
				return result;
				
			}
			
			resultPage = ApplicationResources.DOCUMENT_ADDHR;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		
		return null;		

	}
}
