package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.CertificateTO;
import com.hrclub.util.Logger;

public class CommendITcert extends Command {

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
        String crertnameone = request.getParameter("crertnameone");
		
		String crertnametwo = request.getParameter("crertnametwo");
		String crertnamethree = request.getParameter("crertnamethree");
		String crertnamefour = request.getParameter("crertnamefour");
		String crertnamezero = request.getParameter("crertnamezero");
		
		String crertname=null;
		if(!crertnamezero.equals("select"))
			crertname=crertnamezero;
		
		if(!crertnameone.equals("select"))
			crertname=crertnameone;
		
		if(!crertnametwo.equals("select"))
			crertname=crertnametwo;
		
		if(!crertnamethree.equals("select"))
			crertname=crertnamethree;
		
		if(!crertnamefour.equals("select"))
			crertname=crertnamefour;
		
		ITUserManager certificatefDAO=ITUserManager.getInstance();
		if(!certificatefDAO.isCertExist(userid, crertname)){
		
		String kinds = request.getParameter("kind");
		int kind=0;
		if(null!=kinds)
			kind=Integer.parseInt(kinds);
	    
		
		
		String number = request.getParameter("number");
		String grades = request.getParameter("grade");
	
		
		float grade = 0;
		if(null!=grades)
			grade=Float.parseFloat(grades);
	
	
		
		CertificateTO to=new CertificateTO();
		to.setUserid(userid);
		to.setCrertname(crertname);
		to.setGrade(grade);
		to.setKind(kind);
	    to.setNumber(number);
		
	   
	   if(certificatefDAO.inserCertificatet(to)>0)
	   {   if(null==adminuserid)
			resultPage = ApplicationResources.COMMENDITCERT;
	   else 
		   resultPage = ApplicationResources.ADMINITCERT;
		}
	   }
	   else
	   {
		   request.setAttribute("msgerror", "���и�֤�飡");
			if(null==adminuserid)
				resultPage = ApplicationResources.COMMENDITCERT;
			else 
				resultPage = ApplicationResources.ADMINITCERT;
			
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
		// TODO �Զ����ɷ������
		return CommandFactory.COMMENDITCERT;
	}

}
