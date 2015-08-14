package com.hrclub.model.command.admininfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdmininfoManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.util.Logger;

public class AdmininfoDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMININFODAO_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String adminID = request.getParameter("adminID");
		
		boolean flag=AdmininfoManager.getInstance().delete(adminID);
		
		if(flag==true){
			resultPage = ApplicationResources.ADMININFO_RETURN;
		}else{
			throw new Exception("π‹¿Ì‘±…æ≥˝ ß∞‹£°");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
