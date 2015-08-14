package com.hrclub.model.command.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.ComfManager;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.util.Logger;

public class CertificateComDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.CERTIFICATECOMF_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int certificateID = Integer.parseInt(request.getParameter("certificateID"));
		
		boolean flag=ComfManager.getInstance().deleteCertificate(certificateID);
		
		if(flag==true){
			resultPage = ApplicationResources.CERTIFICATECOMF_RETURN;
		}else{
			throw new Exception("ɾ��ʧ�ܣ�");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
