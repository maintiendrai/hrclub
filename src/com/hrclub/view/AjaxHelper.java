package com.hrclub.view;

import com.hrclub.model.*;

public class AjaxHelper {
	public String isUserExist(String userID) {
		if(UserManager.getInstance().isExist(userID)){
			return "对不起，该帐号已存在，请重新输入。";
		}else{
			return "恭喜您，该帐号不存在，可以申请。";
		}
	}
	public String isExpertExist(String expertID) {
		if(UserManager.getInstance().isExist(expertID)){
			return "对不起，该帐号已存在，请重新输入。";
		}else{
			return "恭喜您，该帐号不存在，可以申请。";
		}
	}
}
