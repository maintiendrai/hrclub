package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.*;
import com.hrclub.util.Logger;

public class SpecialitycomfEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SPECIAlITYCOMF_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int specialityID = Integer.parseInt(request.getParameter("specialityID"));
			String specialityname = request.getParameter("specialityname");

			SpecialitycomfTO to = new SpecialitycomfTO();
			to.setSpecialityID(specialityID);
			to.setSpecialityname(specialityname);

			boolean flag = ComfManager.getInstance().updateSpeciality(to);

			if (flag == true) {
				resultPage = ApplicationResources.SPECIAlITYCOMF_RETURN;
			} else {
				throw new Exception("ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
