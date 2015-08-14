package com.hrclub.model.command.serverorder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ServerorderMannager;
import com.hrclub.to.Page;
import com.hrclub.to.ServerorderTO;
import com.hrclub.util.Logger;

public class ServerorderEditCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SERVERORDER_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if (request.getParameter("method").equals("editItem")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			Integer orderID = Integer.valueOf(request.getParameter("orderID"));
			ServerorderTO to = ServerorderMannager.getInstance().findOderByID(
					orderID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.SERVERORDER_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} 
		if (request.getParameter("method").equals("edit")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			Integer oderID = Integer.valueOf(request.getParameter("oderID"));
			String hrID = request.getParameter("hrID");
			int kind = Integer.parseInt(request.getParameter("kind"));
			String ordertitle = request.getParameter("ordertitle");
			String oderinfo = request.getParameter("oderinfo");
			int status = Integer.parseInt(request.getParameter("status"));
			String buytime = request.getParameter("buytime");

			ServerorderTO to = new ServerorderTO();
			to.setOderID(oderID);
			to.setHrID(hrID);
			to.setKind(kind);
			to.setOrdertitle(ordertitle);
			to.setOderinfo(oderinfo);
			to.setStatus(status);
			to.setBuytime(buytime);

			boolean flag = ServerorderMannager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.SERVERORDER_RETURN;
			} else {
				throw new Exception("¶©µ¥ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}
		if (request.getParameter("method").equals("editItemhr")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			Integer orderID = Integer.valueOf(request.getParameter("orderID"));
			ServerorderTO to = ServerorderMannager.getInstance().findOderByID(
					orderID);
			request.setAttribute("to", to);

			resultPage = ApplicationResources.SERVERORDER_EDITHR;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		} 
		if (request.getParameter("method").equals("edithr")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
            HttpSession session = request.getSession();
			
			String hrID = (String)session.getAttribute("hrID");
			if(null==hrID) {
				resultPage = ApplicationResources.HRLOGIN;

				result.setResultPage(resultPage);
				return result;
				
			}
			Integer oderID = Integer.valueOf(request.getParameter("oderID"));
			String hrIDs = request.getParameter("hrID");
			int kind = Integer.parseInt(request.getParameter("kind"));
			String ordertitle = request.getParameter("ordertitle");
			String oderinfo = request.getParameter("oderinfo");
			int status = Integer.parseInt(request.getParameter("status"));
			String buytime = request.getParameter("buytime");

			ServerorderTO to = new ServerorderTO();
			to.setOderID(oderID);
			to.setHrID(hrIDs);
			to.setKind(kind);
			to.setOrdertitle(ordertitle);
			to.setOderinfo(oderinfo);
			to.setStatus(status);
			to.setBuytime(buytime);

			boolean flag = ServerorderMannager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.ORDER_RETURN;
			} else {
				throw new Exception("¶©µ¥ÐÞ¸ÄÊ§°Ü£¡");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}
		if (request.getParameter("method").equals("list")) {
			CommandResult result = new CommandResult();
			String resultPage = null;
			HttpSession session = request.getSession();
			Object userID = session.getAttribute("hrID");
			String hrID=null;

				if (null !=userID) {
					hrID=session.getAttribute("hrID").toString();
					
				}else {
					resultPage = ApplicationResources.HRLOGIN;
				result.setResultPage(resultPage);
				return result;
				}
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			Page mypage=ServerorderMannager.getInstance().findOderByPage(pageNum, 10,hrID);
			request.setAttribute("mypage", mypage);
			
			resultPage = "/serverorder/serverorderListhr.jsp";
			
			 
			result.setResultPage(resultPage);

			logger
					.debug(this.getName() + "'s result will be sent to "
							+ resultPage);

			return result;

		}
			
		return null;
		

	}

}
