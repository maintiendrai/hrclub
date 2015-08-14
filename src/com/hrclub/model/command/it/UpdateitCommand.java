package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.dao.ITUserDAO;
import com.hrclub.to.ITUserTO;
import com.hrclub.util.Logger;

public class UpdateitCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object userido=request.getSession().getAttribute("userid");
			if(null!=userido){
	             
		String userid = request.getParameter("userid");
		String userid2 = request.getParameter("userid2");
		String password= request.getParameter("password");
		String ages = request.getParameter("age");
		int age = 0;
		if (ages != null)
			age = Integer.parseInt(ages);
		String email = request.getParameter("email");
		ITUserTO itUser = new ITUserTO();
		itUser.setUserid(userid);
		itUser.setAge(age);
		itUser.setPassword(password);
		
		itUser.setEmail(email);
		ITUserDAO ituserdao = new ITUserDAO();
		if(ituserdao.update(itUser,userid2)>0)
			resultPage=ApplicationResources.UPSUCCESS;
		else 
			resultPage=ApplicationResources.UPERROR;

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
		return CommandFactory.UPDATEIT;
	}

}
