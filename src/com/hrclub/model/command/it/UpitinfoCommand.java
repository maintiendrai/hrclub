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

public class UpitinfoCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.UPITINFO;
	}

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

		Object userido=request.getSession().getAttribute("userid");
			if(null!=userido){
		String userid = (String) request.getSession().getAttribute("userid");
      
	
        ITUserTO to=new ITUserTO();
        to=ITUserManager.getInstance().findUserByID(userid);
		if (to!=null) {
			request.setAttribute("to", to);
			resultPage = ApplicationResources.ITINFO;
		} else {
			throw new Exception("´íÎó£¡");
		}

            }

	else resultPage = ApplicationResources.ITLOGIN;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}
