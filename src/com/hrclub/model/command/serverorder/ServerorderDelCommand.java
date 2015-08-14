package com.hrclub.model.command.serverorder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ServerorderMannager;
import com.hrclub.util.Logger;

public class ServerorderDelCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SERVERORDER_DELETE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getParameter("method").equals("delall")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			Integer oderID = Integer.valueOf(request.getParameter("orderID"));

			boolean flag = ServerorderMannager.getInstance().delete(oderID);

			if (flag == true) {
				resultPage = ApplicationResources.SERVERORDER_RETURN;
			} else {
				throw new Exception("É¾³ýÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		if (request.getParameter("method").equals("delhr")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
            HttpSession session = request.getSession();
			
			String hrID = (String)session.getAttribute("hrID");
			if(null==hrID) {
				resultPage = ApplicationResources.HRLOGIN;

				result.setResultPage(resultPage);
				return result;
				
			}
			Integer oderID = Integer.valueOf(request.getParameter("orderID"));

			boolean flag = ServerorderMannager.getInstance().delete(oderID);

			if (flag == true) {
				resultPage = ApplicationResources.ORDER_RETURN;
			} else {
				throw new Exception("É¾³ýÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		return null;
	}
}
