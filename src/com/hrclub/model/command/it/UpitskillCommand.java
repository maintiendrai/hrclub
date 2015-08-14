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

public class UpitskillCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object userido=request.getSession().getAttribute("userid");
			if(null!=userido){
		String userid = (String) request.getSession().getAttribute("userid");
      
		String skillIDs = request.getParameter("skillID");
		int skillID=0;
		if(null!=skillIDs)
			skillID=Integer.parseInt(skillIDs);
		String skillnameIDs = request.getParameter("skillnameID");
		int skillnameID=0;
		if(null!=skillnameIDs)
			skillnameID=Integer.parseInt(skillnameIDs);
		String degrees = request.getParameter("degree");
		int degree=0;
		if(null!=degrees)
			degree=Integer.parseInt(degrees);
		String times = request.getParameter("time");
		int time=0;
		if(null!=times)
			time=Integer.parseInt(times);
		  
		ITUserManager itskillDAO = ITUserManager.getInstance();
		if (!itskillDAO.isITskillExisttwo(userid, skillnameID,skillID)) {
	
		
		ITskillTO to=new ITskillTO();
		to.setSkillID(skillID);
		to.setUserid(userid);
		to.setDegree(degree);
		to.setSkillnameID(skillnameID);
		to.setTime(time);

	   if(itskillDAO.updateITskill(to)>0)
			resultPage = ApplicationResources.ITSKILL;
	   else
			resultPage = ApplicationResources.ERROR_PAGE;
	   }
	   else{
		   request.setAttribute("msgerror", "���иü��ܣ�");
			resultPage =  ApplicationResources.TOUPSKILL+"?"+skillnameIDs;
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
		// TODO �Զ����ɷ������
		return CommandFactory.UPITSKILL;
	}

}

