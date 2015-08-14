package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.util.Logger;

public class DelitCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
		
		String userid = request.getParameter("userid");
		ITUserManager ituserdao = ITUserManager.getInstance();
		//ITUserDAO ituserdao = new ITUserDAO();
		if(ituserdao.deleteITUser(userid)>0)
		resultPage = ApplicationResources.UPSUCCESS;
		else
			
			resultPage = ApplicationResources.UPERROR;
		result.setResultPage(resultPage);
		logger
		.debug(this.getName() + "'s result will be sent to "
				+ resultPage);
		
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.DELIT;
	}

}
