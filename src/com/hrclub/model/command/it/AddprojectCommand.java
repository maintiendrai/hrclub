package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;

import com.hrclub.to.ProjectTO;

import com.hrclub.util.Logger;

public class AddprojectCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		   Object adminuserid = request.getSession().getAttribute("adminuserid");
		String userid = (String) request.getSession().getAttribute("userid");
      
		String projectname = request.getParameter("projectname");
	    
		String starttime = request.getParameter("starttime");
		
		String endtime = request.getParameter("endtime");
		String hardware = request.getParameter("hardware");
		String software=request.getParameter("software");
		String projectinfo=request.getParameter("projectinfo");
		String projectsizes=request.getParameter("projectsize");
	
		int projectsize=0;
		if(null!=projectsizes)
			projectsize=Integer.parseInt(projectsizes);
		System.out.print(userid);
		String place=request.getParameter("place");
		
		ProjectTO to=new ProjectTO();
		to.setUserid(userid);
		to.setProjectname(projectname);
		to.setEndtime(endtime);
		to.setHardware(hardware);
		to.setPlace(place);
		to.setProjectinfo(projectinfo);
		to.setProjectsize(projectsize);
		to.setSoftware(software);
		to.setStarttime(starttime);
		ITUserManager projectdao = ITUserManager.getInstance();
	//	ProjectDAO projectdao=new ProjectDAO();
	   if(projectdao.insertProject(to)>0)
	   { if(null==adminuserid)
			resultPage = ApplicationResources.ITPROJECT;
	   else 
		   resultPage = ApplicationResources.ADMINITPRO;
	   }
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
		return CommandFactory.ADDPROJECT;
	}

}
