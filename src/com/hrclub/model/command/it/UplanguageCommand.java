package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.LanguageTO;
import com.hrclub.util.Logger;

public class UplanguageCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object userido=request.getSession().getAttribute("userid");
			if(null!=userido){
		String userid = (String) request.getSession().getAttribute("userid");
      
		String languageIDs = request.getParameter("languageID");
		int languageID=0;
		if(null!=languageIDs)
			languageID=Integer.parseInt(languageIDs);

		ITUserManager languageDAO = ITUserManager.getInstance();
		
		String languagenames = request.getParameter("languagename");
		int languagename=0;
		if(null!=languagenames)
			languagename=Integer.parseInt(languagenames);
		
		String grades = request.getParameter("grade");
		int grade=0;
		if(null!=grades)
			grade=Integer.parseInt(grades);
	
		if (!languageDAO.isLangExisttwo(userid, languagename,languageID)) {
	
		
		LanguageTO to=new LanguageTO();
		to.setLanguageID(languageID);
		to.setUserid(userid);
		to.setLanguagename(languagename);
		to.setGrade(grade);
	
	   if(languageDAO.updateLanguage(to)>0)
			resultPage = ApplicationResources.ITLANGUAGE;
	   else
			resultPage = ApplicationResources.ERROR_PAGE;
		}else
			{
			request.setAttribute("msgerror", "已有该外语！");
			resultPage = ApplicationResources.TOUPLANGUAGE+"?"+languageIDs;
			}
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
		return CommandFactory.UPLAUGUAGE;
	}

}

