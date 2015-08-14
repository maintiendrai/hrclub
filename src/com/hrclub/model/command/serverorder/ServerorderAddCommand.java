package com.hrclub.model.command.serverorder;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ServerorderMannager;
import com.hrclub.to.ServerorderTO;
import com.hrclub.util.Logger;

public class ServerorderAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.SERVERORDER_ADD;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		HttpSession session = request.getSession();
		
		String hrID = (String)session.getAttribute("hrID");
		if(null==hrID) {
			resultPage = ApplicationResources.HRLOGIN;

			result.setResultPage(resultPage);
			return result;
			
		}

		if (request.getParameter("method").equals("addItem")) {
			String buytime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

			request.setAttribute("buytime", buytime);
			
			resultPage = ApplicationResources.SERVERORDER_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("add")) {
			String hrIDs = request.getParameter("hrID");
			int kind = Integer.parseInt(request.getParameter("kind"));
			String ordertitle = request.getParameter("ordertitle");
			String oderinfo = request.getParameter("oderinfo");
			int status = Integer.parseInt(request.getParameter("status"));
			String buytime = request.getParameter("buytime");

			ServerorderTO to = new ServerorderTO();
			to.setHrID(hrIDs);
			to.setKind(kind);
			to.setOrdertitle(ordertitle);
			to.setOderinfo(oderinfo);
			to.setStatus(status);
			to.setBuytime(buytime);

			boolean flag = ServerorderMannager.getInstance().insert(to);

			if (flag == true) {
				resultPage = ApplicationResources.ORDER_RETURN;
			} else {
				throw new Exception("∂©µ•ÃÓ–¥¥ÌŒÛ ß∞‹£°");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
			
		return null;
		

	}
}
