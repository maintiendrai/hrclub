package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;

import com.hrclub.util.*;
import com.hrclub.to.*; 
public class AdvertiseEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.ADVERTISE_EDIT;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String username = (String) session.getAttribute(USER_NAME);
		String usertype = (String) session.getAttribute(USER_TYPE);
		if (username == null || usertype == null) {
			throw new Exception("请先登录！");
		}
		int intUsertype = Integer.parseInt(usertype);
		if (intUsertype != ADMIN_MANAGER && intUsertype != ADMIN_ROOT) {
			throw new Exception("请以管理员的身份登录！");
		}

		CommandResult result = new CommandResult();

		String resultPage = null;

		AdvertisementTO ad = new AdvertisementTO();
		String action = request.getParameter("action");
		if (action == null)
			action = "";

		String type = request.getParameter("type");
		String adName = request.getParameter("adName");
		String industryID = request.getParameter("industry"); 
		String areaID = request.getParameter("areaID");
//		String expertID = request.getParameter("expertID");
//		String trainID = request.getParameter("trainID"); 
//		String workID = request.getParameter("workID"); 
		String adurl = request.getParameter("adurl"); 
		String clickurl = request.getParameter("clickurl"); 
		String status = request.getParameter("status"); 
		 
		ad.setType(Integer.parseInt(type));
		ad.setAdName(adName);
		ad.setIndustryID(Integer.parseInt(industryID));
//		ad.setTrainID(Integer.parseInt(trainID));
//		ad.setWorkID(Integer.parseInt(workID));
		ad.setStatus(Integer.parseInt(status));
		ad.setAreaID(areaID);
//		ad.setExpertID(expertID);
		ad.setAdurl(adurl);
		ad.setClickurl(clickurl); 

		AdvertisementManager am = AdvertisementManager.getInstance();

		if (action.equalsIgnoreCase("update")) {
			String adID = request.getParameter("adID");
			ad.setAdID(Integer.parseInt(adID));
			am.updateAdvertise(ad);
		} else {
			am.createAdvertise(ad);
		}
 
		
		resultPage = "/qy.act?operation=" +CommandFactory.ADVERTISE_LIST;
		
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
