package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITUserTO;
import com.hrclub.util.Logger;

public class ITinfoupCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		ITUserTO ituser = new ITUserTO();
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		String userid = (String) request.getSession().getAttribute("userid");

		String name = request.getParameter("name");
		int sex=2;
		String sexs = request.getParameter("sex");
		if (sexs.equals("male"))
		 sex=0;
		else
			sex=1;
		String ages = request.getParameter("age");
		int age=Integer.parseInt(ages);
		String email = request.getParameter("email");
		String born=request.getParameter("born");

		
		 String province = request.getParameter("province");
		 String city = request.getParameter("city");
		String address = request.getParameter("address");
		String post = request.getParameter("post");
		
		String telephone = request.getParameter("telephone");
	
		String mobiletphone = request.getParameter("mobiletphone");
		
		
		ituser.setUserid(userid);
		ituser.setName(name);
		ituser.setSex(sex);
		ituser.setAge(age);
		ituser.setBorn(born);
		ituser.setEmail(email);
		ituser.setProvince(province);
		ituser.setCity(city);
		ituser.setAddress(address);
		ituser.setPost(post);
		ituser.setTelephone(telephone);
		ituser.setMobiletphone(mobiletphone);
		
		ITUserManager ituserdao = ITUserManager.getInstance();
		if (ituserdao.updateITUser(ituser) > 0)
			resultPage = ApplicationResources.ITINFOSHOW;
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
		return CommandFactory.ITINFOUP;
	}

}
