package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.WorkexperienceTO;
import com.hrclub.util.Logger;

public class UPwordCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String workid = request.getParameter("workID");

		String comkinds = request.getParameter("comkind");
		// System.out.print("sign");
		
		if (null != comkinds && null != workid) {
			int workID = Integer.parseInt(workid);
			int comkind =  Integer.parseInt(comkinds);
			
			String userid = (String) request.getSession()
					.getAttribute("userid");
			String address = request.getParameter("address");

			String compname = request.getParameter("compname");
			String place = request.getParameter("place");
			String starttime = request.getParameter("starttime");
			String levertime = request.getParameter("levertime");
			String info = request.getParameter("info");

			WorkexperienceTO to = new WorkexperienceTO();
			to.setWorkID(workID);
			to.setUserid(userid);
			to.setAddress(address);
			to.setCompname(compname);
			to.setComkind(comkind);
			to.setPlace(place);
			to.setStarttime(starttime);
			to.setLevertime(levertime);
			to.setInfo(info);
			ITUserManager worddao = ITUserManager.getInstance();
		//	WorkexperienceDAO worddao = new WorkexperienceDAO();
			if (worddao.updateWrok(to) > 0)
				resultPage = ApplicationResources.WORKEXPERIENCE;
		} else
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
		return CommandFactory.UPWORD;
	}

}
