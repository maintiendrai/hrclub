package com.hrclub.model.command.job;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.JobManager;
import com.hrclub.to.JobinfoTO;
import com.hrclub.util.Logger;

public class AdminupjobCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
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
		String positiontype = request.getParameter("positiontype");
	

		String specialityIDs = request.getParameter("specialityID");
		int specialityID = Integer.parseInt(specialityIDs);

		String jobtitle = request.getParameter("jobtitle");
		String requests = request.getParameter("request");
		String degrees = request.getParameter("degree");

		int degree = Integer.parseInt(degrees);

		String explain = request.getParameter("explain");
		String deal = request.getParameter("deal");
		String nums = request.getParameter("num");
		int num = Integer.parseInt(nums);

		String wages = request.getParameter("wage");
		int wage = Integer.parseInt(wages);

		String puttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(Calendar.getInstance().getTime());
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");

		String province = request.getParameter("province");
		String city = request.getParameter("byaddressh");
		city=","+city;
		String kinds = request.getParameter("kind");
		int kind = Integer.parseInt(kinds);

		String years = request.getParameter("year");
		int year = Integer.parseInt(years);
		JobinfoTO to = new JobinfoTO();
	
		to.setCity(city);
		to.setDeal(deal);
		to.setDegree(degree);
		to.setEndtime(endtime);
		to.setExplain(explain);

		to.setJobtitle(jobtitle);
		to.setKind(kind);
		to.setNum(num);
		to.setPositiontype(positiontype);
		to.setProvince(province);
		to.setRequest(requests);
		to.setSpecialityID(specialityID);
		to.setStarttime(starttime);
		to.setPuttime(puttime);
		to.setWage(wage);
		to.setYear(year);
		JobManager jobinfodao = JobManager.getInstance();
	
			String jobID = request.getParameter("jobID");
			int jobid = Integer.parseInt(jobID);
			to.setJobID(jobid);
			if (jobinfodao.updateJobinfo(to) > 0)
				resultPage = ApplicationResources.ADMINMANAGERDO;

			else
				resultPage = ApplicationResources.ERROR_PAGE;

		result.setResultPage(resultPage);
		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);
		return result;
	}

	@Override
	public String getName() {
		// TODO 自动生成方法存根
		return CommandFactory.ADMINUPJOB;
	}

}
