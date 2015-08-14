package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.util.Logger;

public class DellanguageCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String languageIDs = request.getParameter("languageID");
	
		int languageID=0;
		if(null!=languageIDs){
			languageID=Integer.parseInt(languageIDs);
			ITUserManager languageDAO = ITUserManager.getInstance();
			//LanguageDAO languageDAO=new LanguageDAO();
		  if(languageDAO.deletLanguage(languageID)>0)
			  resultPage = ApplicationResources.ITLANGUAGE;
		}
		else
			
			resultPage = ApplicationResources.UPERROR;
		}

		else resultPage = ApplicationResources.ITLOGIN;
		result.setResultPage(resultPage);
		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return  CommandFactory.DELLAUGUAGE;
	}

}

