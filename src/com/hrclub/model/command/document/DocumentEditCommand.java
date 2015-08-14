package com.hrclub.model.command.document;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.DocumentManager;
import com.hrclub.to.DocumentTO;
import com.hrclub.util.Logger;

public class DocumentEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DOCUMENT_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int documentID = Integer.parseInt(request.getParameter("documentID"));
			String documentname = request.getParameter("documentname");
		    int kind = Integer.parseInt(request.getParameter("kind"));
		    String nameID = request.getParameter("nameID");
		    String url = request.getParameter("url");
		    int integral = Integer.parseInt(request.getParameter("integral"));
		    String size = request.getParameter("size");
			
		    DocumentTO to = new DocumentTO();
		    to.setDocumentID(documentID);
			to.setDocumentname(documentname);
			to.setKind(kind);
			to.setNameID(nameID);
			to.setUrl(url);
			to.setIntegral(integral);
			to.setSize(size);
			boolean flag = DocumentManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.DOCUMENT_RETURN;
			} else {
				throw new Exception("单位信息修改失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
