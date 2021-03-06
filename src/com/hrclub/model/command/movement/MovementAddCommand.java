package com.hrclub.model.command.movement;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementManager;
import com.hrclub.to.MovementTO;
import com.hrclub.util.Logger;

public class MovementAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENT_ADD;
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
		if (request.getParameter("method").equals("addItem")) {
			String puttime=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());

			request.setAttribute("puttime", puttime);
			
			resultPage = ApplicationResources.MOVEMENT_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("add")) {

			int status = Integer.parseInt(request.getParameter("status"));
			int integral = Integer.parseInt(request.getParameter("integral"));
			String subject = request.getParameter("subject");
			String context = request.getParameter("context");
			String puttime = request.getParameter("puttime");
			String starttime = request.getParameter("starttime");
			String endtime = request.getParameter("endtime");

			MovementTO to = new MovementTO();

			to.setIntegral(integral);
			to.setSubject(subject);
			to.setContext(context);
			to.setStatus(status);
			to.setPuttime(puttime);
			to.setStarttime(starttime);
			to.setEndtime(endtime);

			boolean flag = MovementManager.getInstance().insert(to);

			if (flag == true) {
				resultPage = ApplicationResources.MOVEMENT_RETURN;
			} else {
				throw new Exception("�����ʧ�ܣ�");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} else {
			return null;
		}

	}
}
