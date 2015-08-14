package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITUserTO;
import com.hrclub.util.Logger;

public class ITUserRegisterCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ITREGEDIT;
	}

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String userid = request.getParameter("userid");
		ITUserManager itUserDAO = ITUserManager.getInstance();
	if(!itUserDAO.isUserExist(userid)){
		String password = request.getParameter("password");
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
	

		if (itUserDAO.regeditITUser(itUser)>0) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			resultPage = ApplicationResources.INDEX;
		} else {
			request.setAttribute("msgerror", "用户注册失败！");
			resultPage = ApplicationResources.TIREGEDIT;
		}
	}
	else 
	 {
		request.setAttribute("msgerror", "用户名已存在！");
		resultPage = ApplicationResources.TIREGEDIT;
	}
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
