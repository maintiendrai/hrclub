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

public class IntegralEditCommand extends Command{

		static org.apache.log4j.Logger logger = Logger.getLogger();

		public String getName() {
			return CommandFactory.INTEGRAL_EDIT;
		}

		public Object execute(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			if (request.getParameter("method").equals("editItem")) {
				CommandResult result = new CommandResult();
				String resultPage = null;
				String hrID = request.getParameter("hrID");
				IntegralTO to = IntegralManager.getInstance().findHrByID(
						hrID);
				request.setAttribute("to", to);

				resultPage = ApplicationResources.INTEGRAL_EDIT;

				result.setResultPage(resultPage);

				logger.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

				return result;

			} else if (request.getParameter("method").equals("edit")) {
				CommandResult result = new CommandResult();
				String resultPage = null;
				String hrID = request.getParameter("hrID");
				int num = Integer.parseInt(request.getParameter("num"));
				

				IntegralTO to = new IntegralTO();
				
				to.setHrID(hrID);
				to.setNum(num);
				

				boolean flag = IntegralManager.getInstance().update(to);

				if (flag == true) {
					resultPage = ApplicationResources.INTEGRAL_RETURN;
				} else {
					throw new Exception("»ý·ÖÐÞ¸ÄÊ§°Ü£¡");
				}

				result.setResultPage(resultPage);

				logger.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

				return result;

			} else{
				return null;
			}

		}

	}
