package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.WorkexperienceTO;
import com.hrclub.util.Logger;

public class CommendITworkCommand extends Command {

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
		String userid =request.getSession().getAttribute("useridc").toString();
       
		String address = request.getParameter("address");
	
		String compname = request.getParameter("compname");
		
		String comkinds = request.getParameter("comkind");
		int comkind=Integer.parseInt(comkinds);
		String place = request.getParameter("place");
		String starttime=request.getParameter("starttime");
		String levertime=request.getParameter("levertime");
		String info=request.getParameter("info");
		
		WorkexperienceTO to=new WorkexperienceTO();
		to.setUserid(userid);
		to.setAddress(address);
		to.setCompname(compname);
		to.setComkind(comkind);
		to.setPlace(place);
		to.setStarttime(starttime);
		to.setLevertime(levertime);
		to.setInfo(info);
		
		ITUserManager worddao=ITUserManager.getInstance();
	   if( worddao.insertWork(to)>0)
		   {if(null==adminuserid)
			resultPage = ApplicationResources.COMMENDWORKTOPRO;
		   else 
			   resultPage = ApplicationResources.ADMINWORKTOPRO;
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
		return CommandFactory.COMMENDITWORK;
	}

}
