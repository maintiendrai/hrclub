package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.*;
import com.hrclub.util.Logger;

public class CertificateComAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.CERTIFICATECOMF_ADD;
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
			resultPage = ApplicationResources.CERTIFICATECOMF_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("add")) {
		
			String certificatename = request.getParameter("certificatename");
			int kind = Integer.valueOf(request.getParameter("kind"));

			CertificateComfTO to = new CertificateComfTO();
			to.setCertificatename(certificatename);
			to.setKind(kind);

			boolean flag = ComfManager.getInstance().insertCertificate(to);

			if (flag == true) {
				resultPage = ApplicationResources.CERTIFICATECOMF_RETURN;
			} else {
				throw new Exception("ÐÂÔöÊ§°Ü£¡");
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
