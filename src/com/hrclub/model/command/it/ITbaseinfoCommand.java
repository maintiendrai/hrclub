package com.hrclub.model.command.it;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.ITUserManager;
import com.hrclub.to.ITUserSpecialityTO;
import com.hrclub.to.ITUserTO;
import com.hrclub.util.Logger;

public class ITbaseinfoCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String userid = null;
		String sign = request.getParameter("sign");
		userid = (String) request.getSession().getAttribute("userid");
		if (userid == null)
			userid = request.getParameter("userid");
		if (userid != null) {

			ITUserManager ituserdao = ITUserManager.getInstance();
			ITUserTO itbaseto = ituserdao.findUserByID(userid);

			ITUserSpecialityTO itspeto = ituserdao
					.findUserSpecialityByID(userid);

			List listwork = ituserdao.findITworkByID(userid);
			List listpro = ituserdao.findITprojectByuserID(userid);
			List listcert = ituserdao.findCertificateByID(userid);
			List listskill = ituserdao.findITskillByID(userid);
			List listilang = ituserdao.findLanguageByID(userid);

			request.setAttribute("itbaseto", itbaseto);

			if (itspeto != null)
				request.setAttribute("itspeto", itspeto);
			if (listwork != null)
				request.setAttribute("listwork", listwork);
			if (listpro != null)
				request.setAttribute("listpro", listpro);
			if (listcert != null)
				request.setAttribute("listcert", listcert);
			if (listskill != null)
				request.setAttribute("listskill", listskill);
			if (listilang != null)
				request.setAttribute("listilang", listilang);

			if (sign.equals("sign")) {
				resultPage = ApplicationResources.ADMINITINFO;
			}
			else if (sign.equals("hrsign")) {
			
				resultPage = ApplicationResources.HRFINDITINFO;
			}
			else if (sign.equals("itsign")) {
				resultPage = ApplicationResources.ITBASEINFO;
			}
			else if (sign.equals("findit")) {
				resultPage = ApplicationResources.FINDITINFO;
			}

		} else
			resultPage = ApplicationResources.INDEX;

		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.ITBASEINFO;
	}

}
