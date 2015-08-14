package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.to.HRinfoTO;
import com.hrclub.util.Logger;

public class HRaddinfoCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object hrIDo=request.getSession().getAttribute("hrID");
		if(null!=hrIDo){
		String hrID = (String) hrIDo;
	
		String name = request.getParameter("name");
		int sex=2;
		String sexs = request.getParameter("sex");
		if (sexs.equals("male"))
		 sex=0;
		if (sexs.equals("woman"))
		 sex=1;
		
		String born = request.getParameter("born");
		
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String callings=request.getParameter("calling");
		
		int calling=Integer.parseInt(callings);
		
		String address=request.getParameter("address");
		String telephone=request.getParameter("telephone");
		String mobilephone = request.getParameter("mobilephone");
		String corpkinds=request.getParameter("corpkind");
		int corpkind=Integer.parseInt(corpkinds);
		String corporation=request.getParameter("corporation");
		String corinfo=request.getParameter("corinfo");
		String email=request.getParameter("email");
		String website=request.getParameter("website");
		
	
		HRinfoTO to=new HRinfoTO();
		to.setSex(sex);
		to.setAddress(address);
		to.setBorn(born);
		to.setCalling(calling);
		to.setCity(city);
		to.setCorinfo(corinfo);
		to.setCorpkind(corpkind);
		to.setHrID(hrID);
		to.setMobilephone(mobilephone);
		to.setName(name);
		to.setEmail(email);
		to.setProvince(province);
		to.setTelephone(telephone);
		to.setWebsite(website);
		to.setCorporation(corporation);
		HRManager hrinfodao = HRManager.getInstance();
	//	ProjectDAO projectdao=new ProjectDAO();
	   if(hrinfodao.updateHR(to)>0)
			resultPage = ApplicationResources.TOHRINFO;
	   else
			resultPage = ApplicationResources.ERROR_PAGE;
		}
		else
			resultPage = ApplicationResources.HRLOGIN;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.HRADDINFO;
	}

}
