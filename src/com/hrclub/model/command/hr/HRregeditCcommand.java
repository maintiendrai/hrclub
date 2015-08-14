package com.hrclub.model.command.hr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.model.IntegralManager;
import com.hrclub.to.HRinfoTO;
import com.hrclub.to.IntegralTO;
import com.hrclub.util.Logger;

public class HRregeditCcommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO 自动生成方法存根
		CommandResult result = new CommandResult();
		String resultPage = null;
		String hrID = request.getParameter("hrid");

		String password = request.getParameter("password");

		String corporation = request.getParameter("corporation");

		String email = request.getParameter("email");
		String name = request.getParameter("name");

		int sex = 2;
		String sexs = request.getParameter("sex");
		if (sexs.equals("male"))
			sex = 0;
		else
			sex = 1;
		String born = request.getParameter("born");
		String province = request.getParameter("province");
		String city = request.getParameter("city");
		String telephone = request.getParameter("telephone");
		String mobilephone = request.getParameter("mobilephone");

		String corpkinds = request.getParameter("corpkind");
		int corpkind = Integer.parseInt(corpkinds);

		String corinfo = request.getParameter("corinfo");

		String website = request.getParameter("website");

		String callings = request.getParameter("calling");

		int calling = Integer.parseInt(callings);

		String address = request.getParameter("address");

		HRinfoTO to = new HRinfoTO();

		to.setHrID(hrID);
		to.setPassword(password);
		to.setCorporation(corporation);
		to.setSex(sex);
		to.setEmail(email);
		to.setBorn(born);
		to.setCalling(calling);
		to.setCity(city);
		to.setCorinfo(corinfo);
		to.setCorpkind(corpkind);
		to.setHrID(hrID);
		to.setMobilephone(mobilephone);
		to.setName(name);
		to.setProvince(province);
		to.setTelephone(telephone);
		to.setWebsite(website);
		to.setCorporation(corporation);
		to.setAddress(address);
		HRManager htinfodao = HRManager.getInstance();
		int flag = htinfodao.insertHR(to);
		if (flag > 0) {
			IntegralTO ito = new IntegralTO();
			ito.setHrID(hrID);
			ito.setNum(100);
			if (IntegralManager.getInstance().insert(ito)) {
				HttpSession session = request.getSession();
				session.setAttribute("hrID", hrID);
				session.setAttribute("HRstatus", 0);
				resultPage = ApplicationResources.INDEX;
			}
		} else {
			throw new Exception("用户注册失败！");
		}
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.HRREGEDIT;
	}

}
