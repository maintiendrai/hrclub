package com.hrclub.model.command.mail;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.InsideMailManager;
import com.hrclub.to.MailTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MailQueryCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MAIL_QUERY;
	}

	public Object execute(HttpServletRequest request,

	HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;

		if (request.getParameter("method").equals("show")) {
			
			int mailID = Integer.parseInt(request.getParameter("mailID"));
			
			MailTO to = InsideMailManager.getInstance().findMailByID(mailID);
			
			request.setAttribute("to", to);
			
			resultPage = ApplicationResources.MAIL_SHOW;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

		}
		if (request.getParameter("method").equals("edit")) {
			
            int mailID = Integer.parseInt(request.getParameter("mailID"));
			
			MailTO to = InsideMailManager.getInstance().findMailByID(mailID);
			
			request.setAttribute("to", to);

			resultPage = ApplicationResources.MAIL_EDIT;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		if (request.getParameter("method").equals("showone")) {
			Object userido=request.getSession().getAttribute("userid");
			Object hrIDo=request.getSession().getAttribute("hrID");
			if(null==userido&&null==hrIDo){
				resultPage = ApplicationResources.INDEX;
				result.setResultPage(resultPage);
				return result;
			}
			int pageNum = Integer.parseInt(request.getParameter("pageNum"));
			int revkind = Integer.parseInt(request.getParameter("revkind"));
			String revID = request.getParameter("revID");
			Page mypage=InsideMailManager.getInstance().findMailByRevID(pageNum, 10, revID ,revkind);
			request.setAttribute("mypage", mypage);
			
			resultPage = ApplicationResources.MAIL_LIST_ONE;
		
			result.setResultPage(resultPage);

			logger
					.debug(this.getName() + "'s result will be sent to "
							+ resultPage);

			return result;
		}
		if (request.getParameter("method").equals("read")) {
			Object userido=request.getSession().getAttribute("userid");
			Object hrIDo=request.getSession().getAttribute("hrID");
			if(null==userido&&null==hrIDo){
				resultPage = ApplicationResources.INDEX;
				result.setResultPage(resultPage);
				return result;
			}

            int mailID = Integer.parseInt(request.getParameter("mailID"));
			
			MailTO to = InsideMailManager.getInstance().findMailByID(mailID);
			
			request.setAttribute("to", to);
			
			boolean flag = InsideMailManager.getInstance().updatestatus(mailID, 1);
			
			resultPage = ApplicationResources.MAIL_SHOW_ONE;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		if (request.getParameter("method").equals("del")) {
			HttpSession session = request.getSession();

            int mailID = Integer.parseInt(request.getParameter("mailID"));
			
			MailTO to = InsideMailManager.getInstance().findMailByID(mailID);
			
			request.setAttribute("to", to);
			
			boolean flag = InsideMailManager.getInstance().updatestatus(mailID, 2);
			
			Object userid = session.getAttribute("userid");
			Object hrID = session.getAttribute("hrID");
			String revID=null;
			String revkind=null;
			if(null==userid&&null==hrID){
				resultPage = ApplicationResources.INDEX;
				result.setResultPage(resultPage);
				return result;
			}                               
				if (null !=userid) {
					revID=session.getAttribute("userid").toString();
					revkind="2";
				}
				if (null !=hrID) {
					revID=session.getAttribute("hrID").toString();
					revkind="1";
				}
			
			resultPage = "/mail/maillistone.do?operation=mailquery&method=showone&pageNum=1&revkind="+revkind+"&revID="+revID;

			result.setResultPage(resultPage);

			return result;
		}
		return null;
	}
}
