package com.hrclub.model.command.job;

import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class ShowalljobCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();
	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.SHOWALLJOB;
		
	}
	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		CommandResult result = new CommandResult();
		String resultPage = null;
	
		Page mypage;
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String operation=request.getParameter("operation");
		Properties prop=new Properties();
		prop.put("operation", operation);
		mypage=JobManager.getInstance().findJobByPage(pageNum,15);
		
       if(null!=mypage){
		request.setAttribute("mypage", mypage);
		request.setAttribute("prop", prop);
		resultPage = ApplicationResources.SIMRESULT;
       }
       else
    	   resultPage = ApplicationResources.ERROR_PAGE;
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;
	}

}

