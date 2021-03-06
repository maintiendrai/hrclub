package com.hrclub.model.command.job;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.HRManager;
import com.hrclub.model.JobManager;

import com.hrclub.to.JobinfoTO;
import com.hrclub.util.Logger;

public class PutJobCommand extends Command {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	@Override
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		String sign = request.getParameter("sign");

		String hrID = (String) request.getSession().getAttribute("hrID");

		Object adminuserid = request.getSession().getAttribute("adminuserid");
		String positiontype = request.getParameter("positiontype");
		// int positiontype=Integer.parseInt(positiontypes);

		String specialityIDs = request.getParameter("specialityID");
		int specialityID = Integer.parseInt(specialityIDs);

		String jobtitle = request.getParameter("jobtitle");
		String requests = request.getParameter("request");
		String degrees = request.getParameter("degree");

		int degree = Integer.parseInt(degrees);

		String explain = request.getParameter("explain");
		String deal = request.getParameter("deal");
		String nums = request.getParameter("num");
		int num=0;
		if(nums!=null)
			num= Integer.parseInt(nums);
		 

		String wages = request.getParameter("wage");
		int wage = Integer.parseInt(wages);

		String puttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(Calendar.getInstance().getTime());
		String starttime = request.getParameter("starttime");
		String endtime = request.getParameter("endtime");

		String province = request.getParameter("province");
		String city = request.getParameter("byaddressh");
		city = "," + city;
		String kinds = request.getParameter("kind");
		int kind = Integer.parseInt(kinds);

		String years = request.getParameter("year");
		int year=0;
		if(!years.equals(""))
			year= Integer.parseInt(years);
		JobinfoTO to = new JobinfoTO();

		if (null == adminuserid)
		{	to.setHrID(hrID);
		to.setCorporation(HRManager.getInstance().findHRByID(hrID).getCorporation());
		 }
		else
		{
			to.setCorporation("hrclub");
			to.setHrID("hrclub");
		}
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
		if (sign == null) {

			if (null == adminuserid) {
				jobinfodao.insertJobinfo(to);
				resultPage = ApplicationResources.JOBMANAGERDO;
			} else {
				jobinfodao.admininsertJobinfo(to);
				resultPage = ApplicationResources.ADMINJOBMANGE;
			}

		}
		// if(sign.equals("upjob"))
		else if (sign.equals("upjob")) {
			String jobID = request.getParameter("jobID");
			int jobid = Integer.parseInt(jobID);
			to.setJobID(jobid);
			if (jobinfodao.updateJobinfo(to) > 0)
				resultPage = ApplicationResources.JOBMANAGERDO;

			else
				resultPage = ApplicationResources.ERROR_PAGE;

		} else
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
		return CommandFactory.PUTJOB;
	}

}
