package com.hrclub.model.command.admininfo;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.AdmininfoManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.AdmininfoTO;
import com.hrclub.util.Logger;

public class AdmininfoAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADMININFODAO_ADD;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
        HttpSession session = request.getSession();
		
		String adminIDs = (String)session.getAttribute("adminuserid");
		if(null==adminIDs) {
			resultPage = ApplicationResources.ADMIN_LOGIN;

			result.setResultPage(resultPage);
			return result;
		
		}			

		if (request.getParameter("method").equals("addItem")) {
			resultPage = ApplicationResources.ADMININFO_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}
		if (request.getParameter("method").equals("add")) {
			String adminID = request.getParameter("adminID");
			String password = request.getParameter("password");
			String adminname = request.getParameter("adminname");
			int role = Integer.parseInt(request.getParameter("role"));

			AdmininfoTO to = new AdmininfoTO();
			to.setAdminID(adminID);
			to.setPassword(password);
			to.setAdminname(adminname);
			to.setRole(role);

			boolean flag = AdmininfoManager.getInstance().insert(to);

			if (flag == true) {
				resultPage = ApplicationResources.ADMININFO_RETURN;
			} else {
				throw new Exception("管理员新增失败！");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		} 
		if (request.getParameter("method").equals("check")) {
			String adminID = request.getParameter("adminID");
			AdmininfoTO to = AdmininfoManager.getInstance().findAdminByID(adminID);
			PrintWriter out = response.getWriter();
			if(to!=null){
				  out.print("该用户已存在!");
				}
				else{
				  out.print("该用户可以使用!");
				}
			
			out.flush();
			out.close();
			return null;
		}
		else {
			return null;
		}

	}
}
