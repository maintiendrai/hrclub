package com.hrclub.model.command.cooperateutil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.CooperateutilManager;
import com.hrclub.to.CooperateutilTO;
import com.hrclub.util.Logger;

public class CooperateutilEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.COOPERATEUTIL_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int utilID = Integer.parseInt(request.getParameter("utilID"));
			int utilkind = Integer.parseInt(request.getParameter("utilkind"));
			String utilname = request.getParameter("utilname");
			String contactname = request.getParameter("contactname");
			String telephone = request.getParameter("telephone");
			String address = request.getParameter("address");
			String email = request.getParameter("email");
			String utilinfo = request.getParameter("utilinfo");


			CooperateutilTO to = new CooperateutilTO();
			to.setUtilID(utilID);
			to.setUtilkind(utilkind);	
			to.setUtilname(utilname);				
			to.setContactname(contactname);	
			to.setTelephone(telephone);				
			to.setAddress(address);	
			to.setEmail(email);			
			to.setUtilinfo(utilinfo);

			boolean flag = CooperateutilManager.getInstance().update(to);

			if (flag == true) {
				resultPage = ApplicationResources.COOPERATEUTIL_RETURN;
			} else {
				throw new Exception("单位信息修改失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
