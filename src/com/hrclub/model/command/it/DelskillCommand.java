package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.util.Logger;

public class DelskillCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String skillIDs = request.getParameter("skillID");
		int skillID=0;
		if(null!=skillIDs){
			skillID=Integer.parseInt(skillIDs);
			ITUserManager itskillDAO = ITUserManager.getInstance();
			//ITskillDAO itskillDAO=new ITskillDAO();
		  if(itskillDAO.deleteITskill(skillID)>0)
			  resultPage = ApplicationResources.ITSKILL;
		  else 
			  resultPage = ApplicationResources.UPERROR;
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
		return  CommandFactory.DELSKILL;
	}

}
