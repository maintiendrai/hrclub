package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.util.*;
import com.hrclub.to.*;
import com.hrclub.*;
public class UserEditCommand  extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USER_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute(USER_NAME);
		String usertype = (String) session.getAttribute(USER_TYPE);
		int intUsertype=Integer.parseInt(usertype);
		if (username == null || usertype == null) {
			throw new Exception("请先登录！");
		}
		if (intUsertype==EXPERT) {
			throw new Exception("权限不足！");
		}

		CommandResult result = new CommandResult();

		String resultPage = null;

		UserTO user = new UserTO();
		String action = request.getParameter("action");
		if (action == null)
			action = "";

		
		

		UserManager um =  UserManager.getInstance();

		if (action.equalsIgnoreCase("update")) {
			String userName = request.getParameter("userName");  
			String type = request.getParameter("type");    
			String openType = request.getParameter("openType");  
			if(openType==null) openType="3";
			else {
				if(openType.equals("")) {
					openType="3";
				}
			}
			String prov = request.getParameter("prov"); 
			String city = request.getParameter("city"); 
			String identifyCard = request.getParameter("identifyCard"); 
			String identifyType = request.getParameter("identifyType");  
			String address = request.getParameter("address"); 
			String postcode = request.getParameter("postcode"); 
			String tel = request.getParameter("tel"); 
			String mobile = request.getParameter("mobile"); 
			String fax = request.getParameter("fax"); 
			String email = request.getParameter("email"); 
			String qqmsn = request.getParameter("qqmsn"); 
			String desc = request.getParameter("desc");  
			String bankAccount = request.getParameter("bankAccount"); 
			String banktype = request.getParameter("banktype");  
			if(banktype==null) banktype="-1";
			else {
				if(banktype.equals("")) {
					banktype="-1";
				}
			}
			 
			
			user.setUsername(userName);
			user.setType(Integer.parseInt(type));
			user.setOpenType(Integer.parseInt(openType));
			user.setProv(prov);
			user.setCity(city);
			user.setIdentifyCard(identifyCard);
			user.setIdentifyType(Integer.parseInt(identifyType));
			user.setAddress(address);
			user.setPostcode(postcode);
			user.setTel(tel);
			user.setMobile(mobile);
			user.setFax(fax);
			user.setEmail(email);
			user.setQqmsn(qqmsn);
			user.setDesc(desc); 
			user.setBankAccount(bankAccount);
			user.setBanktype(Integer.parseInt(banktype));
			
			String userID = request.getParameter("userID"); 
			if(userID.equals(username)||intUsertype==  ADMIN_ROOT){
				
				user.setUserid(userID);
				boolean f=um.updateUser(user);
				if(f) {
					resultPage = ApplicationResources.SUCCESS_PAGE+"?info=修改成功";
				}else {
					resultPage = ApplicationResources.ERROR_PAGE+"?info=修改失败";
				}
			}else{
				throw new Exception("权限不足！");
			}
		} else if(action.equalsIgnoreCase("updateStatus")){
			
			String userID = request.getParameter("userID"); 
			String status = request.getParameter("status"); 
			if( intUsertype==  ADMIN_ROOT||intUsertype== ADMIN_MANAGER){
				
				user.setUserid(userID);
				user.setStatus(Integer.parseInt(status));
				um.updateUserStatus(user);
			}else{
				throw new Exception("权限不足！");
			}
		}else if(action.equalsIgnoreCase("resetbbs")) { 
			String userID = request.getParameter("userID");  
			logger.debug("reset "+userID+"'s bbs");
			if( intUsertype==  ADMIN_ROOT||intUsertype== ADMIN_MANAGER){
				
				user = UserManager.getInstance().findUserByID(userID) ;
				 
			}else{
				throw new Exception("权限不足！");
			}
			
			
			
		}else {
			//
			//um.userRegister(user);
		}
		
		if(intUsertype==  USER) {
			
		}else {
			resultPage = "/qy.act?operation=" +CommandFactory.USER_LIST;
		}
		
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
