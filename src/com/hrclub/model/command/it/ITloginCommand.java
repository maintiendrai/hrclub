package com.hrclub.model.command.it;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;

import com.hrclub.util.Logger;

public class ITloginCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		ITUserManager ituserdao = ITUserManager.getInstance();

		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
         
		if (ituserdao.isUserExist(userid)
				&& ituserdao.getUserPassword(userid).equals(password)) {
			HttpSession session = request.getSession();
			session.setAttribute("userid", userid);
			resultPage = ApplicationResources.INDEX;

		} else
		{	resultPage = ApplicationResources.ITLOGIN;
        	request.setAttribute("msgerror", "账户或密码错误！");
		}
		

		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.ITLOGIN;
	}

}
