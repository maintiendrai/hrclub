package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITskillTO;
import com.hrclub.util.Logger;

public class AddskillCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String userid = (String) request.getSession().getAttribute("userid");

		String skillnameIDs = request.getParameter("skillnameID");
		ITUserManager itskillDAO = ITUserManager.getInstance();
		int skillnameID = 0;
		if (null != skillnameIDs)
			skillnameID = Integer.parseInt(skillnameIDs);
		if (!itskillDAO.isITskillExist(userid, skillnameID)) {
			String degrees = request.getParameter("degree");
			int degree = 0;
			if (null != degrees)
				degree = Integer.parseInt(degrees);
			String times = request.getParameter("time");
			int time = 0;
			if (null != times)
				time = Integer.parseInt(times);

			ITskillTO to = new ITskillTO();
			to.setUserid(userid);
			to.setDegree(degree);
			to.setSkillnameID(skillnameID);
			to.setTime(time);

			if (itskillDAO.inserITskill(to) > 0)
				resultPage = ApplicationResources.ITSKILL;
			else
				resultPage = ApplicationResources.ERROR_PAGE;

		} else{
			request.setAttribute("msgerror", "已有该技能！");
			resultPage = ApplicationResources.ITSKILL;

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
		return CommandFactory.ADDSKILL;
	}

}
