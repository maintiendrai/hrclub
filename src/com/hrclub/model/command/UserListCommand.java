package com.hrclub.model.command;
import com.hrclub.model.*;

import java.util.*;
import javax.servlet.http.*;

import com.hrclub.util.*;
import com.hrclub.to.*;
import com.hrclub.*;
public class UserListCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USER_LIST;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute(USER_NAME);
		String usertype = (String) session.getAttribute(USER_TYPE);
		int intUsertype =Integer.parseInt(usertype);
		if (username == null || usertype == null) {
			throw new Exception("请先登录！");
		}
		if (intUsertype !=  ADMIN_MANAGER && intUsertype!= ADMIN_ROOT) {
			throw new Exception("请以管理员的身份登录！");
		}
		
		CommandResult result = new CommandResult();

		String resultPage = null;
		String strPageNum = request.getParameter("pageNum");
		String strPageLength = request.getParameter("pageLength");
		int pageNum = 1;
		int pageLen = DEFAULT_PAGE_LENGTH;
		if (strPageNum != null) {
			if (!strPageNum.equals("")) {
				pageNum = Integer.parseInt(strPageNum);
			}
		}
		if (strPageLength != null) {
			if (!strPageLength.equals("")) {
				pageLen = Integer.parseInt(strPageLength);
			}
		}
		UserManager um =  UserManager.getInstance();

		String action = request.getParameter("action");
		if (action == null)
			action = "";
		
		if (action.equalsIgnoreCase("delete") ) { 
				String userID = request.getParameter("userID");
				um.deleteUser(userID); 
		} 
		
		String userID = request.getParameter("likeuserID");
		if(userID!=null){
			if(userID.equals("")){
				userID=null;
			}
		}
		String userName= request.getParameter("userName");
		if(userName!=null){
			if(userName.equals("")){
				userName=null;
			}
		}
		String strstatus= request.getParameter("status");
		int status=-1;
		if(strstatus!=null){
			status=Integer.parseInt(strstatus);
		}
		Page page = um.findUserByPage(pageNum,pageLen,userID,userName,status);
		 
		resultPage = ApplicationResources.USER_LIST;
	 
		
		request.setAttribute("page", page);
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
