package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.util.Logger;

public class SpecialitycomfDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SPECIAlITYCOMF_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int specialityID = Integer.parseInt(request.getParameter("specialityID"));
		
		boolean flag=ComfManager.getInstance().deleteSpeciality(specialityID);
		
		if(flag==true){
			resultPage = ApplicationResources.SPECIAlITYCOMF_RETURN;
		}else{
			throw new Exception("É¾³ýÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
