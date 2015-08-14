package com.hrclub.model.command.cooperateutil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.CooperateutilManager;
import com.hrclub.to.CooperateutilTO;
import com.hrclub.util.Logger;

public class CooperateutilAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.COOPERATEUTIL_ADD;
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
			resultPage = ApplicationResources.COOPERATEUTIL_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("add")) {
			int utilkind = Integer.parseInt(request.getParameter("utilkind"));
			String utilname = request.getParameter("utilname");
			String contactname = request.getParameter("contactname");
			String telephone = request.getParameter("telephone");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String utilinfo = request.getParameter("utilinfo");

			CooperateutilTO to = new CooperateutilTO();
			to.setUtilkind(utilkind);
			to.setUtilname(utilname);
			to.setContactname(contactname);
			to.setTelephone(telephone);
			to.setAddress(address);
			to.setEmail(email);
			to.setUtilinfo(utilinfo);

			boolean flag = CooperateutilManager.getInstance().insert(to);

			if (flag == true) {
				resultPage = ApplicationResources.COOPERATEUTIL_RETURN;
			} else {
				throw new Exception("单位信息新增失败！");
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
