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

public class UphrinfoCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;

		String hrIDr=request.getParameter("hrID");
		if(hrIDr==null){
		String hrID = (String) request.getSession().getAttribute("hrID");

		
        HRinfoTO to= HRManager.getInstance().findHRByID(hrID);
          if(null!=to)
          { 
        	    request.setAttribute("to", to);
				resultPage = ApplicationResources.UPHRINFO;
          }
			else
				resultPage = ApplicationResources.HRLOGIN;
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
		return CommandFactory.UPHRINFO;
	}

}
