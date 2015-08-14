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

public class EdititCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		Object userido=request.getSession().getAttribute("userid");
		if(null!=userido){
		ITUserTO ituser = null;
		String userid = request.getParameter("userid");
		ITUserDAO ituserdao = new ITUserDAO();
		ituser = ituserdao.findUserByID(userid);
		resultPage = ApplicationResources.EDITIT;
		request.setAttribute("ituser", ituser);;
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
		// TODO �Զ����ɷ������
		return CommandFactory.EDITIT;
	}

}
