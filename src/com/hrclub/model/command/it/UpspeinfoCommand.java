package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITUserSpecialityTO;
import com.hrclub.util.Logger;

public class UpspeinfoCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object userido=request.getSession().getAttribute("userid");
			if(null!=userido){
		String userid = (String) request.getSession().getAttribute("userid");

		
		String namekey = request.getParameter("namekey");
		String degrees = request.getParameter("degree");
		int degree = 0;
		if (null != degrees)
			degree = Integer.parseInt(degrees);
 
		String city = request.getParameter("byaddressh");
		city=","+city;
		String workyears = request.getParameter("workyear");
		int workyear = 0;
		if (null != workyears)
			workyear = Integer.parseInt(workyears);
		
		String kinds = request.getParameter("bykind");
		int kind = Integer.parseInt(kinds);
		
		
		String positiontype = request.getParameter("byjobh");
		positiontype=","+positiontype;
		String school = request.getParameter("school");

		


	
		String wages = request.getParameter("wage");

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
		
		if(!positiontype.equals("no")||positiontype.equals(""))
		to.setPositiontype(positiontype);
		to.setSchool(school);
		to.setSelfvalue(selfvalue);
		to.setTrain(train);
		to.setUserid(userid);

		to.setCity(city);
        to.setWage(wage);
        to.setWorkyear(workyear);
        to.setKind(kind);
		ITUserManager ituserSpecialityDAO = ITUserManager.getInstance();
		if (ituserSpecialityDAO.isUserExistSpec(userid)) {
			if (ituserSpecialityDAO.updateITUserSpeciality(to) > 0)
				resultPage = ApplicationResources.TOITBASEINFO;
		} else if (ituserSpecialityDAO.insertITUserSpeciality(to) > 0)
			resultPage = ApplicationResources.TOITBASEINFO;
		else
			resultPage = ApplicationResources.ERROR_PAGE;


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
		return CommandFactory.UPSPEINFO;
	}

}
