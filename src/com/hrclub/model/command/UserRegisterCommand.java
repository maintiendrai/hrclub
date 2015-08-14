package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.ApplicationResources;
import com.hrclub.util.*;
import com.hrclub.to.*;
public class UserRegisterCommand  extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.USER_REGISTER;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String userID = request.getParameter("userID"); 
		String userName = request.getParameter("userName"); 
		String password = request.getParameter("password"); 
		String type = request.getParameter("type");  
		String identifyCard = request.getParameter("identifyCard"); 
		String identifyType = request.getParameter("identifyType"); 
		String prov = request.getParameter("prov"); 
		String city = request.getParameter("city"); 
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
		
		UserTO user = new UserTO();
		user.setStatus(UserManager.USER_STATUS_AVAILABLE);
		user.setUserid(userID);
		user.setUsername(userName);
		user.setPassword(password);
		user.setType(Integer.parseInt(type));
		 
		user.setIdentifyCard(identifyCard);
		user.setIdentifyType(Integer.parseInt(identifyType));
		user.setProv(prov);
		user.setCity(city);
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
		
		boolean flag=UserManager.getInstance().userRegister(user);
		
		if(flag==true){
			resultPage = ApplicationResources.USER_REGISTER_RESULT;
		}else{
			throw new Exception("ÓÃ»§×¢²áÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
