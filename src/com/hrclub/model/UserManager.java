package com.hrclub.model;

import com.hrclub.util.*;
import com.hrclub.to.*;
import com.hrclub.model.dao.*;
import java.util.List;

public class UserManager {
	public static final int USER_TYPE_SYSTEM = 0;

	public static final int USER_TYPE_EXPERT = 1;

	public static final int USER_TYPE_USER = 2;

	public static final int EXPERT_STATUS_UNCHECKED = 0;

	public static final int EXPERT_STATUS_AVAILABLE = 1;

	public static final int EXPERT_STATUS_FROZEN = 2;

	public static final int USER_STATUS_UNAVAILABLE = 0;

	public static final int USER_STATUS_AVAILABLE = 1;

	private static UserManager instance = null;

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public static final float DEFAULT_VALUE_RATE = 10f;

	public static final String DEFAULT_USER_IMG = "~notou.gif";

	private UserManager() {

	}

	public static UserManager getInstance() {
		if (instance == null) {
			instance = new UserManager();
		}
		return instance;
	}

	public static String getTypeName(int type) {
		String temp = "未知";
		switch (type) {
		case USER_TYPE_SYSTEM:
			temp = "系统";
			break;
		case USER_TYPE_EXPERT:
			temp = "专家";
			break;
		case USER_TYPE_USER:
			temp = "普通用户";
			break;
		}
		return temp;
	}

	public ExpertTO expertLogin(String id, String pw) throws Exception {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		ExpertTO to = dao.findExpertByID(id);

		try {
			if (to != null) {
				if (to.getStatus() != 1) {
					//throw new Exception("帐号暂时不可用，请耐心等待管理员审核。");
				}
				if (pw.equals(to.getPassword())) {
					dao.updateUserLoginIncrease(id);
					return to;
				} else {
					throw new Exception("密码错误");
				}
			} else {
				throw new Exception("帐号不存在");
			}
		} finally {
			dao.destroy();
			dao = null;
		}
	}

	 

	public boolean expertBasicModify(ExpertTO expert) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.updateSimple(expert);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean expertFlexibleModify(ExpertTO expert) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.updateFlexible(expert);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean insertExpertModify(ExpertTO expert) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		dao.deleteExpertModify(expert.getExpertid());
		int c = dao.insertExpertModify(expert);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean expertRegister(ExpertTO expert) {
		logger.debug("expertRegister...");
		UserDAO userdao = DAOFactory.getInstance().getUserDAO();
		boolean flag=userdao.isUserExist(expert.getExpertid());
		if(flag) {
			return false;
		}
		
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.insert(expert);

		try {
			if (c == 1) {
				ExpertLevelTO el = new ExpertLevelTO();
				el.setCredit(0);
				el.setExpertID(expert.getExpertid());
				el.setIsvip(0);
				el.setLevel(1);
				el.setPoint(100);
				el.setValueRate(DEFAULT_VALUE_RATE);
				dao.insertExpertLevel(el);
				logger.debug("insertExpertLevel...");
				 
				return true;
			} else {
				logger.debug("expertRegister failed.");
				return false;
			}
		} finally {
			dao.destroy();
			dao = null;
		}
	}

	public boolean userRegister(UserTO user) {
		logger.debug("userRegister...");
		ExpertDAO expertdao = DAOFactory.getInstance().getExpertDAO();
		boolean flag=expertdao.isExpertExist(user.getUserid());
		if(flag) {
			return false;
		}
		
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		int c = dao.insert(user);

		try {
			if (c == 1) {
				UserLevelTO ul = new UserLevelTO();
				ul.setCredit(0);
				ul.setUserID(user.getUserid());
				ul.setIsvip(0);
				ul.setPoint(100);
				ul.setValueRate(DEFAULT_VALUE_RATE);
				dao.insertUserLevel(ul);
				logger.debug("insertUserLevel over...");
				
				 
				return true;
			} else {
				logger.debug("userRegister failed...");
				return false;
			}
		} finally {
			dao.destroy();
			dao = null;
		}
	}
 
 
 

	public boolean updateUser(UserTO user) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		int c = dao.update(user);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateUserStatus(UserTO user) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		int c = dao.updateStatus(user.getUserid(), user.getStatus());
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateExpertStatus(ExpertTO expert) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.updateStatus(expert.getExpertid(), expert.getStatus());
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	public boolean updateExpertFace(String expertID,String face) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.updateFace(expertID, face);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteUser(String userID) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		int c = dao.delete(userID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteExpert(String expertID) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.delete(expertID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteExpertMod(String expertID) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.deleteExpertModify(expertID);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	

	public String getExpertImage(String expertID) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		String face = dao.getExpertImage(expertID);
		dao.destroy();
		dao = null;
		return face;
	}

	public boolean resetPassword(String id, int type, String newpw) {
		if (type == Command.EXPERT) {
			ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();

			int c = dao.updatePassword(id, newpw);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}

		} else if (type == Command.USER) {
			UserDAO dao = DAOFactory.getInstance().getUserDAO();

			int c = dao.updatePassword(id, newpw);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}

		} else {
			return false;
		}
	}

	public boolean changePassword(String id, String oldpw, String newpw,
			int type) throws Exception {
		String real_oldpw = null;
		if (type == Command.EXPERT) {
			ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
			real_oldpw = dao.getExpertPassword(id);

			if (real_oldpw.equals(oldpw)) {
				int c = dao.updatePassword(id, newpw);
				dao.destroy();
				dao = null;
				 
				
				if (c == 1) {
					return true;
				} else {
					return false;
				}

			} else {
				dao.destroy();
				dao = null;
				throw new Exception("旧密码不正确！");
			}
		} else if (type == Command.USER) {
			UserDAO dao = DAOFactory.getInstance().getUserDAO();
			real_oldpw = dao.getUserPassword(id);

			if (real_oldpw.equals(oldpw)) {
				int c = dao.updatePassword(id, newpw);
				dao.destroy();
				dao = null;
				
				 
				
				if (c == 1) {
					return true;
				} else {
					return false;
				}
			} else {
				dao.destroy();
				dao = null;
				throw new Exception("旧密码不正确！");
			}
		} else {
			return false;
		}
	}
 

	public UserTO userLogin(String id, String pw) throws Exception {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		UserTO to = dao.findUserByID(id);

		try {
			if (to != null) {
				if (to.getStatus() != 1) {
					throw new Exception("帐号已停用");
				}
				if (pw.equals(to.getPassword())) {
					dao.updateUserLoginIncrease(id);
					return to;
				} else {
					throw new Exception("密码错误");
				}
			} else {
				throw new Exception("帐号不存在");
			}
		} finally {
			dao.destroy();
			dao = null;
		}
	}

	public UserTO findUserByID(String userID) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		UserTO user = dao.findUserByID(userID);
		dao.destroy();
		dao = null;
		return user;
	}
	public boolean isExist(String id) {
		if(isUserExist(id)) {
			return true;
		}else {
			return isExpertExist(id);
		}
	}

	public boolean isUserExist(String userID) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		boolean f = dao.isUserExist(userID);
		dao.destroy();
		dao = null;
		return f;
		 
	}
	public boolean isExpertExist(String expertID) {
		logger.debug("isExpertExist "+expertID);
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		boolean f = dao.isExpertExist(expertID);
		dao.destroy();
		dao = null;
		return f;
	}

	public float getExpertValueRate(String expertid) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		float rate = dao.getValueRate(expertid);
		dao.destroy();
		dao = null;
		return rate;
	}
 
	
	public List getAllExpertEmails() {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		List emails = dao.getAllExpertEmail();
		dao.destroy();
		dao = null;

		return emails;
	}
	public List getAllUserEmails() {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		List emails = dao.getAllUserEmail();
		dao.destroy();
		dao = null;

		return emails;
	}
	public String getExpertEmail(String expertid) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		String email = dao.getExpertEmail(expertid);
		dao.destroy();
		dao = null;

		return email;
	}
	public String getUserEmail(String userID) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		String email = dao.getUserEmail(userID);
		dao.destroy();
		dao = null;

		return email;
	}
	 

	public ExpertTO findExpertInfoByID(String expertid) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		ExpertTO to = dao.findExpertDetailByID(expertid);
		dao.destroy();
		dao = null;

		return to;
	}

	public ExpertTO findExpertModByID(String expertid) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		ExpertTO to = dao.findExpertModifyByID(expertid);
		dao.destroy();
		dao = null;

		return to;
	}

	public ExpertLevelTO findExpertLevelByID(String expertid) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		ExpertLevelTO to = dao.findExpertLevelByID(expertid);
		dao.destroy();
		dao = null;

		return to;
	}

	public boolean updateExpertLevelByID(ExpertLevelTO expertLevel) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.updateExpertLevel(expertLevel);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean increaseExpertPoint(String expertID,int addpoint) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int c = dao.increaseExpertPoint(expertID, addpoint) ;
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public UserLevelTO findUserLevelByID(String userID) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		UserLevelTO to = dao.findUserLevelByID(userID);
		dao.destroy();
		dao = null;

		return to;
	}

	public boolean updateUserLevelByID(UserLevelTO userLevel) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		int c = dao.updateUserLevel(userLevel);
		dao.destroy();
		dao = null;
		if (c == 1) {
			return true;
		} else {
			return false;
		}
	}

	public void expertVisitIncrease(String expertID) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();

		int c = dao.updateExpertVisitIncrease(expertID);
		if (c == 0) {
			ExpertVisitTO to = new ExpertVisitTO();
			to.setExpertID(expertID);
			to.setTimes(1);
			dao.insertExpertVisit(to);
		}

		dao.destroy();
		dao = null;
	}

	public int getExpertVisitTimes(String expertID) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		int times = dao.getExpertVisitTimes(expertID);
		dao.destroy();
		dao = null;
		return times;
	}

	public Page findUserByPage(int pagenum, int pagelen, String userID,
			String userName, int status) {
		UserDAO dao = DAOFactory.getInstance().getUserDAO();
		Page page = dao.findUserByPage(pagenum, pagelen, userID, userName,
				status);
		dao.destroy();
		dao = null;
		return page;
	}
 

	public Page findExpertByPage(int pagenum, int pagelen, String prov,
			String city, int industryID, String expertID, String expertName,
			int status) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		Page page = dao.findExpertByPage(pagenum, pagelen, prov, city,
				industryID, expertID, expertName, status);
		dao.destroy();
		dao = null;
		return page;
	}

	public Page findExpertModByPage(int pagenum, int pagelen) {
		ExpertDAO dao = DAOFactory.getInstance().getExpertDAO();
		Page page = dao.findExpertModifyByPage(pagenum, pagelen);
		dao.destroy();
		dao = null;
		return page;
	}
	  
}
