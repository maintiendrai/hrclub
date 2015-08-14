package com.hrclub.model.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.hrclub.model.DAOObject;
import com.hrclub.to.JobinfoTO;
import com.hrclub.to.Page;
import com.hrclub.util.SqlUtil;



public class JobinfoDAO extends DAOObject {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public JobinfoDAO() {
		super();
	}

	public int insert(JobinfoTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into jobinfo(hrID,specialityID,positiontype,jobtitle,degree,"
						+ "request,deal,status,num,puttime,starttime,endtime,wage,province,city,"
						+ "kind,year,explains,corporation) values('");

		sb.append(to.getHrID());
		sb.append("','");
		sb.append(to.getSpecialityID());
		sb.append("','");
		sb.append(to.getPositiontype());
		sb.append("','");
		sb.append(to.getJobtitle());
		sb.append("','");
		sb.append(to.getDegree());
		sb.append("','");
		sb.append(to.getRequest());
		sb.append("','");
		sb.append(to.getDeal());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("','");
		sb.append(to.getNum());
		//sb.append("','2007-02-03','");
		sb.append("','");
		sb.append(to.getPuttime());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getEndtime());
		sb.append("','");
		sb.append(to.getWage());
		sb.append("','");
		sb.append(to.getProvince());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("','");
		sb.append(to.getYear());
		sb.append("','");
		sb.append(to.getExplain());
		sb.append("','");
		sb.append(to.getCorporation());
		sb.append("')");
	
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	public int admininsert(JobinfoTO to) {
		StringBuffer sb = new StringBuffer(
				"insert into jobinfo(hrID,specialityID,positiontype,jobtitle,degree,"
						+ "request,deal,status,num,puttime,starttime,endtime,wage,province,city,"
						+ "kind,year,explains,corporation) values('");

		sb.append(to.getHrID());
		sb.append("','");
		sb.append(to.getSpecialityID());
		sb.append("','");
		sb.append(to.getPositiontype());
		sb.append("','");
		sb.append(to.getJobtitle());
		sb.append("','");
		sb.append(to.getDegree());
		sb.append("','");
		sb.append(to.getRequest());
		sb.append("','");
		sb.append(to.getDeal());
		sb.append("','");
		sb.append(to.getStatus());
		sb.append("','");
		sb.append(to.getNum());
		//sb.append("','2007-02-03','");
		sb.append("','");
		sb.append(to.getPuttime());
		sb.append("','");
		sb.append(to.getStarttime());
		sb.append("','");
		sb.append(to.getEndtime());
		sb.append("','");
		sb.append(to.getWage());
		sb.append("','");
		sb.append(to.getProvince());
		sb.append("','");
		sb.append(to.getCity());
		sb.append("','");
		sb.append(to.getKind());
		sb.append("','");
		sb.append(to.getYear());
		sb.append("','");
		sb.append(to.getExplain());
		sb.append("','");
		sb.append(to.getCorporation());
		sb.append("')");
	
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	public JobinfoTO findJobinfoByjobID(int jobID) {
		Statement stmt = null;

		ResultSet rs = null;
		JobinfoTO to = new JobinfoTO();
		try {

			stmt = conn.createStatement();
			String sql = "select *  from jobinfo where jobID='"
					+ jobID + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				
				to.setJobID(jobID);
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setJobtitle(rs.getString("jobtitle"));
				to.setCity(rs.getString("city"));
				to.setDeal(rs.getString("deal"));
				to.setDegree(rs.getInt("degree"));
				to.setEndtime(rs.getDate("endtime").toString());
				to.setExplain(rs.getString("explains"));
				to.setHrID(rs.getString("hrID"));
				to.setJobtitle(rs.getString("jobtitle"));
				to.setKind(rs.getShort("kind"));
				to.setNum(rs.getInt("num"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setProvince(rs.getString("province"));
				to.setPuttime(rs.getDate("puttime").toString());
				to.setRequest(rs.getString("request"));
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setStarttime(rs.getDate("starttime").toString());
				to.setWage(rs.getInt("wage"));
				to.setYear(rs.getInt("year"));
				
				
				
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return to;
	}
	public List<JobinfoTO> findJobinfoByDegree(String degree) {
		List<JobinfoTO> list = null;
		Statement stmt = null;

		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select jobID,hrID,specialityID,positiontype,num,jobtitle  from jobinfo where degree='"
					+ degree + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobinfoTO to = new JobinfoTO();
				to.setJobID(rs.getInt("jobID"));
				to.setHrID(rs.getString("hrID"));
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setJobtitle(rs.getString("jobtitle"));
				  to.setNum(rs.getInt("num"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return list;
	}

	public List<JobinfoTO> findJobinfoByhrID(String hrID) {
		List<JobinfoTO> list = null;
		Statement stmt = null;

		ResultSet rs = null;
		try {

			stmt = conn.createStatement();
			String sql = "select jobID,specialityID,positiontype,num,jobtitle  from jobinfo where hrID='"
					+ hrID + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobinfoTO to = new JobinfoTO();
				to.setHrID(hrID);
				to.setJobID(rs.getInt("jobID"));
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setJobtitle(rs.getString("jobtitle"));
				  to.setNum(rs.getInt("num"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return list;
	}
	
	public Page  findJobinfoByCity(int pagenum, int pagelen,String city) {
		logger.debug("start find job....");
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select  job.jobID, job.hrID,job.jobtitle,job.num,job.puttime,job.starttime,job.specialityID,job.corporation,job.positiontype from jobinfo job where  job.status=0 and job.city =',"
			+ city + ",' order by job.puttime desc";
	
		logger.debug(sql);
		
		   Long finditstart=System.currentTimeMillis();
	        logger.debug("start find job:"+finditstart);
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
            System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				JobinfoTO to = new JobinfoTO();
				to.setCity(city);
				to.setJobID(rs.getInt("jobID"));
				to.setHrID(rs.getString("hrID"));
				to.setSpecialityID(rs.getInt("specialityID"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setPuttime(rs.getDate("puttime").toString());	
				to.setStarttime(rs.getDate("starttime").toString());
				to.setJobtitle(rs.getString("jobtitle"));
				  to.setNum(rs.getInt("num"));
			   to.setCorporation(rs.getString("corporation"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
	
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		 Long finditend=System.currentTimeMillis();
		   System.out.println("findITtiem:"+(finditend-finditstart));
	       logger.debug("findIT end:"+(finditend-finditstart));
		return page;
	}
	
	
	public Page  findJobinfoByhigh(int pagenum, int pagelen,String byjob,String byaddress,String bycalling,String bytime,String bykind
		,String bydegree,String byyear, String bywage,String bycorpkind,String keyname) {
		
		logger.debug("start find job....");
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		
		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		
		
		String sql = "select job.jobID, job.hrID,job.jobtitle,job.positiontype,job.num,job.puttime,job.corporation from jobinfo job where  job.status=0  ";
		
		if(!keyname.equals(""))
			sql+=" and ( job.jobtitle like '%"+keyname+"%' or job.explains  like '%"+keyname+"%' )";
		if(!byjob.equals("no"))
		sql=SqlUtil.toSql(sql,byjob,",","job.positiontype","and");
		if(!byaddress.equals("no"))
		sql=SqlUtil.toCitySql(sql,byaddress,",","job.city","and");
		
		
	
		if(!bykind.equals("no")) sql+=" and job.kind='"+bykind+"'";
		if(!bydegree.equals("no")) sql+=" and job.degree='"+bydegree+"'";
		if(!byyear.equals("no")) sql+=" and job.year='"+byyear+"'";
		if(!bywage.equals("no")) sql+=" and job.wage='"+bywage+"'";
		if(!bytime.equals("no"))
			sql+=" and TO_DAYS(NOW()) - TO_DAYS(job.starttime) <= '"+bytime+"'";
		
		String sqls=null;
		
		if(!bycalling.equals("no")||!bycorpkind.equals("no")){
		String sqlhr = "select hrID  from hrinfo where ";
		if(!bycorpkind.equals("no"))
			 sqlhr=SqlUtil.toSql(sqlhr,bycorpkind,",","corpkind","and");
		
		if(!bycalling.equals("no"))
		 sqlhr=SqlUtil.toSql(sqlhr,bycalling,",","calling","and");
		
		sqlhr=sqlhr.replaceFirst("and", " ");
		 sqls=sql+" and hrID in("+sqlhr+")";
		}
		else 
		   sqls=sql;
		
		//sqls=sqls.replaceFirst("and", " ");
		
		sqls+=" order by puttime desc "; 
		logger.debug(sqls);
	
		   Long finditstart=System.currentTimeMillis();
	        logger.debug("start find job:"+finditstart);
	        
		try {

			stmt = conn.createStatement();
			sqls=this.genMySQLPagesql(pagenum, pagelen, sqls);
			
			 rs = stmt.executeQuery(sqls);
			while (rs.next()) {
				JobinfoTO to = new JobinfoTO();
			    to.setJobID(rs.getInt("jobID"));
			    to.setJobtitle(rs.getString("jobtitle"));
			    to.setHrID(rs.getString("hrID"));
				to.setPuttime(rs.getString("puttime"));
			    to.setPositiontype(rs.getString("positiontype"));
			    to.setCorporation(rs.getString("corporation"));
			    to.setNum(rs.getInt("num"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		 Long finditend=System.currentTimeMillis();
		   System.out.println("findITtiem:"+(finditend-finditstart));
	       logger.debug("findIT end:"+(finditend-finditstart));
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sqls));
		}
		logger.debug("end find job....");
		return page;
	}
	public Page  findJobinfoBysim(int pagenum, int pagelen,String byjob,String byaddress,String bycalling) {
			
		logger.debug("start find job....");
		   Page page = new Page();
			page.setPageNum(pagenum);
			page.setPageLength(pagelen);

			ArrayList list = new ArrayList();
			Statement stmt = null;
			ResultSet rs = null;
			String sql = "select job.jobID, job.hrID,job.jobtitle,job.num,job.positiontype,job.puttime,job.corporation from jobinfo job where  job.status=0 ";
			
			if(!byjob.equals("no"))
			sql=SqlUtil.toSql(sql,byjob,",","job.positiontype","and");
			if(!byaddress.equals("no"))
			sql=SqlUtil.toCitySql(sql,byaddress,",","job.city","and");
			
		
			
			if(!bycalling.equals("")){
			sql+=" and ( job.jobtitle like '%"+bycalling+"%' or job.explains  like '%"+bycalling+"%' )";
			}
			
			//sqls=sqls.replaceFirst("and", " ");
			sql+=" order by job.puttime desc "; 
			
			logger.debug(sql);
			   Long finditstart=System.currentTimeMillis();
		        logger.debug("start find job:"+finditstart);
			try {

				stmt = conn.createStatement();
				sql=this.genMySQLPagesql(pagenum, pagelen, sql);
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					JobinfoTO to = new JobinfoTO();
				    to.setJobID(rs.getInt("jobID"));
				    to.setJobtitle(rs.getString("jobtitle"));
				    to.setHrID(rs.getString("hrID"));
					to.setPuttime(rs.getString("puttime"));
				    to.setPositiontype(rs.getString("positiontype"));
				    to.setCorporation(rs.getString("corporation"));
				    to.setNum(rs.getInt("num"));
					list.add(to);
				}
			} catch (SQLException e) {
				logger.debug(e.toString());
			} finally {
				try {
					rs.close();
				} catch (SQLException e) {
					logger.error(e.toString());
				}
				try {
					stmt.close();
				} catch (SQLException e) {
					logger.error(e.toString());
				}
			}
			 Long finditend=System.currentTimeMillis();
			   System.out.println("find job time:"+(finditend-finditstart));
		       logger.debug("find job end:"+(finditend-finditstart));
			page.setData(list);

			if (list.size() < pagelen) {
				page.setRecordNum((pagenum - 1) * pagelen + list.size());
			} else {
				page.setRecordNum(this.countResultSizeSimple(sql));
			}
			logger.debug("end find job....");
			return page;
		}
	
	
	
	public int update(JobinfoTO to) {
		StringBuffer sb = new StringBuffer("update jobinfo set hrID='");

		sb.append(to.getHrID());
		sb.append("',specialityID='");
		sb.append(to.getSpecialityID());
		sb.append("',positiontype='");
		sb.append(to.getPositiontype());
		sb.append("',jobtitle='");
		sb.append(to.getJobtitle());
		sb.append("',degree='");
		sb.append(to.getDegree());
		sb.append("',request='");
		sb.append(to.getRequest());
		sb.append("',deal='");
		sb.append(to.getDeal());
		sb.append("',status='");
		sb.append(to.getStatus());
		sb.append("',num='");
		sb.append(to.getNum());
		sb.append("',puttime='");
		sb.append(to.getPuttime());
		sb.append("',starttime='");
		sb.append(to.getStarttime());
		sb.append("',endtime='");
		sb.append(to.getEndtime());
		sb.append("',wage='");
		sb.append(to.getWage());
		sb.append("',province='");
		sb.append(to.getProvince());
		sb.append("',city='");
		sb.append(to.getCity());
		sb.append("',kind='");
		sb.append(to.getKind());
		sb.append("',year='");
		sb.append(to.getYear());
		sb.append("',explains='");
		sb.append(to.getExplain());
		sb.append("' where jobID='" + to.getJobID() + "'");
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	public Page findJobByPage(int pagenum, int pagelen) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select job.jobID, job.hrID,job.jobtitle,job.num,job.positiontype,job.puttime,job.corporation from jobinfo job order by job.puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				JobinfoTO to = new JobinfoTO();
				to.setJobID(rs.getInt("jobID"));
				to.setHrID(rs.getString("hrID"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setJobtitle(rs.getString("jobtitle"));
				to.setPuttime(rs.getString("puttime"));
                to.setNum(rs.getInt("num"));
			    to.setCorporation(rs.getString("corporation"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
	
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		
		return page;
	}
	
	
	public Page findJobByhrID(int pagenum, int pagelen,String hrID) {
		Page page = new Page();
		page.setPageNum(pagenum);
		page.setPageLength(pagelen);

		ArrayList list = new ArrayList();
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select * from jobinfo where ( status=0 or status=1 ) and hrID='"+hrID+"' order by puttime desc";
		try {

			stmt = conn.createStatement();
			sql = this.genMySQLPagesql(pagenum, pagelen, sql);
			
			rs = stmt.executeQuery(sql);
			
			while (rs.next()) {
				
				JobinfoTO to = new JobinfoTO();
				to.setJobID(rs.getInt("jobID"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setJobtitle(rs.getString("jobtitle"));
				to.setStatus(rs.getInt("status"));
				to.setPuttime(rs.getString("puttime"));
				to.setNum(rs.getInt("num"));
				list.add(to);
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
	
		page.setData(list);

		if (list.size() < pagelen) {
			page.setRecordNum((pagenum - 1) * pagelen + list.size());
		} else {
			page.setRecordNum(this.countResultSizeSimple(sql));
		}
		
		return page;
	}
	

	public int delete(String jobID) {
		String sql = "delete from jobinfo where jobID='" + jobID
				+ "'";
		return this.executeUpdate(sql);
	}
	public int updateStatus(String jobID,int status) {
		StringBuffer sb = new StringBuffer(
				"update jobinfo set status=");
		 
		sb.append(status); 
		sb.append(" where jobID='"+jobID+"'"); 
		logger.debug(sb.toString());
		return this.executeUpdate(sb.toString());
	}
	
	
	public List findJobByputdate(int n) {
		Statement stmt = null;
		ResultSet rs = null;
	
		ArrayList list = new ArrayList();
		try {
           int i=0;
			stmt = conn.createStatement();
			String sql = "select * from jobinfo where status=0 and starttime<=now() and endtime>=now() order by puttime desc";
			rs = stmt.executeQuery(sql);
			while (rs.next()&&i<n) {
				JobinfoTO to = new JobinfoTO();
				to.setJobID(rs.getInt("jobID"));
				to.setHrID(rs.getString("hrID"));
				to.setPuttime(rs.getString("puttime"));
				to.setStarttime(rs.getString("starttime"));
				to.setPositiontype(rs.getString("positiontype"));
				to.setJobtitle(rs.getString("jobtitle"));;
				list.add(to);
				i++;
			}
		} catch (SQLException e) {
			logger.debug(e.toString());
		} finally {
			try {
				rs.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				logger.error(e.toString());
			}
		}
		return list;
	}
	
}
