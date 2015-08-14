package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdmininfoManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.model.ITUserManager;
import com.hrclub.model.IntegralManager;
import com.hrclub.to.ITUserTO;
import com.hrclub.util.Logger;

public class CommendITCommand extends Command {
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
		String hrID = (String) request.getSession().getAttribute("hrID");
       String password=null;
       if(null!=adminuserid) {
         password=(AdmininfoManager.getInstance().findAdminByID(adminuserid.toString())).getPassword();}
       else {
    	   password= HRManager.getInstance().getHRPassword(hrID);
       }
       String userid = request.getParameter("userid");
       
       
		String sex = request.getParameter("sex");
		int sexint = 0;
		if (sex.equals("women"))
			sexint = 1;

		String ages = request.getParameter("age").trim().toString();
		int age = 0;
		if (ages != null)
			age = Integer.parseInt(ages);
		String email = request.getParameter("email");
		String born = request.getParameter("born");
		String name = request.getParameter("name");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String post = request.getParameter("post");
		String telephone = request.getParameter("telephone");
		String mobiletphone = request.getParameter("mobiletphone");
		ITUserTO itUser = new ITUserTO();
		itUser.setUserid(userid);
		itUser.setAge(age);
		itUser.setPassword(password);
		itUser.setSex(sexint);
		itUser.setBorn(born);
		itUser.setEmail(email);
	    itUser.setName(name);
	    itUser.setAddress(address);
	    itUser.setCity(city);
	    itUser.setMobiletphone(mobiletphone);
	    itUser.setPost(post);
	    itUser.setProvince(province);
	    itUser.setTelephone(telephone);
		ITUserManager itUserDAO = ITUserManager.getInstance();
		HttpSession session = request.getSession();
		session.setAttribute("useridc", userid);
		if(itUserDAO.insertITUser(itUser)>0){
				
			if(null==adminuserid){
			IntegralManager.getInstance().increase(hrID, 1, 10);
			resultPage = ApplicationResources.COMMENDITSPE;
			}
			else {
				
				resultPage = ApplicationResources.ADMINITSPE;
			}
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
		return CommandFactory.COMMENDIT;
	}

}
