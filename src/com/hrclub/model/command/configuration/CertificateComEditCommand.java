package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.to.*;
import com.hrclub.util.Logger;

public class CertificateComEditCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.CERTIFICATECOMF_EDIT;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

			CommandResult result = new CommandResult();
			String resultPage = null;
			int certificateID = Integer.parseInt(request.getParameter("certificateID"));
			String certificatename = request.getParameter("certificatename");
			int kind = Integer.parseInt(request.getParameter("kind"));

			CertificateComfTO to = new  CertificateComfTO();
			to.setCertificateID(certificateID);
			to.setCertificatename(certificatename);
			to.setKind(kind);

			boolean flag = ComfManager.getInstance().updateCertificate(to);

			if (flag == true) {
				resultPage = ApplicationResources.CERTIFICATECOMF_RETURN;
			} else {
				throw new Exception("�޸�ʧ�ܣ�");
			}

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;

	}

}
