package com.hrclub.model.command.integral;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.InsideMailManager;
import com.hrclub.model.IntegralManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class IntegralListCommand extends Command{
	
			
		static org.apache.log4j.Logger logger = Logger.getLogger();

		public String getName() {
			return CommandFactory.INTEGRAL_LIST;
		}

		public Object execute(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			CommandResult result = new CommandResult();
			String resultPage = null;
			HttpSession session = request.getSession();
			
			String adminID = (String)session.getAttribute("adminuserid");
			if(null==adminID) {
				resultPage = ApplicationResources.ADMIN_LOGIN;

				result.setResultPage(resultPage);
				return result;
			
			}	
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			String hrIDs = request.getParameter("hrIDs");
			if(("null").equals(hrIDs)||("").equals(hrIDs)){
				Page integralpage=IntegralManager.getInstance().findHrByPage(pageNum, 10);
				request.setAttribute("integralpage", integralpage);
			}
			else {
		    	Page integralpage=IntegralManager.getInstance().findHrByPage(pageNum, 10, hrIDs);
		    	request.setAttribute("integralpage", integralpage);
			}
			
			request.setAttribute("hrIDs", hrIDs);
			resultPage = ApplicationResources.INTEGRAL_LIST;
			
			 
			result.setResultPage(resultPage);

			logger
					.debug(this.getName() + "'s result will be sent to "
							+ resultPage);

			return result;
		}

	}
