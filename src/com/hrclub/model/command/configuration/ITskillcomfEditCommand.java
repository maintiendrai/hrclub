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

public class ITskillcomfEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ITSKILLCOMF_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int skilID = Integer.parseInt(request.getParameter("skilID"));
			String skillame = request.getParameter("skillame");

			ITskillcomfTO to = new  ITskillcomfTO();
			to.setSkilID(skilID);
			to.setSkillame(skillame);

			boolean flag = ComfManager.getInstance().updateITskill(to);

			if (flag == true) {
				resultPage = ApplicationResources.ITSKILLCOMF_RETURN;
			} else {
				throw new Exception("ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
