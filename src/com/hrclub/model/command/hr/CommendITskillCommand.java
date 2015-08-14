package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITskillTO;
import com.hrclub.util.Logger;

public class CommendITskillCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object hrIDo=request.getSession().getAttribute("hrID");
		Object adminuserid = request.getSession().getAttribute("adminuserid");
	   if(null!=hrIDo||null!=adminuserid)
	   {
		String userid = (String) request.getSession().getAttribute("useridc");

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
			{ if(null==adminuserid)
				resultPage = ApplicationResources.COMMENDITSKILL;
			else 
				resultPage = ApplicationResources.ADMINITSKILL;
			}
			else
				resultPage = ApplicationResources.ERROR_PAGE;

		} else
			{
			 request.setAttribute("msgerror", "已有该IT技能！");
			if(null==adminuserid)
				resultPage = ApplicationResources.COMMENDITSKILL;
			else 
				resultPage = ApplicationResources.ADMINITSKILL;
			}

			   }
			  else if (null==hrIDo)
				   resultPage = ApplicationResources.HRLOGIN;
			  else 	   resultPage = ApplicationResources.ADMIN_LOGIN;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.COMMENDITSKILL;
	}

}
