package com.hrclub.model.command.cooperateutil;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.CooperateutilManager;
import com.hrclub.util.Logger;

public class CooperateutilDelCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.COOPERATEUTIL_DELETE;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int utilID = Integer.parseInt(request.getParameter("utilID"));
		
		boolean flag=CooperateutilManager.getInstance().delete(utilID);
		
		if(flag==true){
			resultPage = ApplicationResources.COOPERATEUTIL_RETURN;
		}else{
			throw new Exception("单位信息删除失败！");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
