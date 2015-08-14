package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITUserSpecialityTO;
import com.hrclub.util.Logger;

public class CommendITspeCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object hrIDo=request.getSession().getAttribute("hrID");
		Object adminuserid = request.getSession().getAttribute("adminuserid");
	   if(null!=hrIDo||null!=adminuserid)
	   {
		String userid = (String) request.getSession().getAttribute("useridc");
		String namekey = request.getParameter("namekey");
		String degrees = request.getParameter("degree");
		int degree = 0;
		if (null != degrees)
			degree = Integer.parseInt(degrees);

		String workyears = request.getParameter("workyear");
		int workyear = 0;
		if (null != workyears)
			workyear = Integer.parseInt(workyears);
		
		String kinds = request.getParameter("kind");
		int kind = 0;
		if (null != kinds)
			kind = Integer.parseInt(kinds);
		
		
		String positiontype = request.getParameter("byjobh");
		positiontype=","+positiontype;
		String school = request.getParameter("school");

	
		
		String province = request.getParameter("province");
		String city = request.getParameter("byaddressh");
   
		city=","+city;
		//System.out.print(workaddr);
		String wages = request.getParameter("wage");
		System.out.print(wages);
        int wage=Integer.parseInt(wages);
        String specialityID = request.getParameter("specialityID");

	

		String educate = request.getParameter("educate");
		String hortation = request.getParameter("hortation");
		String train = request.getParameter("train");
		String selfvalue = request.getParameter("selfvalue");

		ITUserSpecialityTO to = new ITUserSpecialityTO();
		to.setNamekey(namekey);
		to.setDegree(degree);
		to.setEducate(educate);
		to.setHortation(hortation);
		to.setSpecialityID(specialityID);
		to.setPositiontype(positiontype);
		to.setSchool(school);
		to.setSelfvalue(selfvalue);
		to.setTrain(train);
		to.setUserid(userid);
		to.setProvince(province);
		to.setCity(city);
        to.setWage(wage);
        to.setWorkyear(workyear);
        to.setKind(kind);
		ITUserManager ituserSpecialityDAO = ITUserManager.getInstance();
	
		if (ituserSpecialityDAO.insertITUserSpeciality(to) > 0)
			
			{
			if(null==adminuserid) 
				resultPage = ApplicationResources.COMMENDITWORK;
			    else  
			    	resultPage = ApplicationResources.ADMINITWORK;
				}
		else
			resultPage = ApplicationResources.ERROR_PAGE;
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
		return CommandFactory.COMMENDITSPE;
	}

}
