package com.hrclub.model.command.integral;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.IntegralManager;
import com.hrclub.to.IntegralTO;
import com.hrclub.util.Logger;
public class IntegralQueryCommand extends Command{
			
		static org.apache.log4j.Logger logger = Logger.getLogger();

		public String getName() {
			return CommandFactory.INTEGRAL_QUERY;
		}

		public Object execute(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			CommandResult result = new CommandResult();
			String resultPage = null;
			String hrID = request.getParameter("hrID");
			
			IntegralTO to=IntegralManager.getInstance().findHrByID(hrID);
			request.setAttribute("to", to);
		
			resultPage = ApplicationResources.INTEGRAL_SHOW;
			
	 
			result.setResultPage(resultPage);

			logger
					.debug(this.getName() + "'s result will be sent to "
							+ resultPage);

			return result;

		}

	}
