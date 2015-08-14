package com.hrclub.model.command.it;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITUserSpecialityTO;
import com.hrclub.util.Logger;

public class ITinfoeduCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String userid = (String) request.getSession().getAttribute("userid");
        String sign=null;
		
		
		ITUserManager ituserdao = ITUserManager.getInstance();
		if (ituserdao.isUserExistSpec(userid)){
			ITUserSpecialityTO to=ituserdao.findUserSpecialityByID(userid);
			if(to!=null)
			{
				request.setAttribute("to", to);
				resultPage = ApplicationResources.ITINFOEDU;
			}
			else
				resultPage = ApplicationResources.ERROR_PAGE;
		}
		else
			{
			request.setAttribute("sign", sign);
			resultPage = ApplicationResources.ITINFOEDU;
			
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
		return CommandFactory.ITINFOEDU;
	}

}

