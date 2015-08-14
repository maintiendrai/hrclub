package com.hrclub.model;
import java.util.List;

import com.hrclub.model.DAOFactory;
import com.hrclub.model.dao.ServerorderDAO;
import com.hrclub.to.Page;
import com.hrclub.to.ServerorderTO;
import com.hrclub.util.Logger;

public class ServerorderMannager {
        
	    private static ServerorderMannager instance = null;
	    
		static org.apache.log4j.Logger logger = Logger.getLogger();
		
		private ServerorderMannager() {

		}

		public static ServerorderMannager getInstance() {
			if (instance == null) {
				instance = new ServerorderMannager();
			}
			return instance;
		}
		
		public boolean insert(ServerorderTO to) {
			ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
			int c = dao.insert(to);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean delete(Integer oderID){
			ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
			int c = dao.delete(oderID);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public boolean update(ServerorderTO to) {
			ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
			int c = dao.update(to);
			dao.destroy();
			dao = null;
			if (c == 1) {
				return true;
			} else {
				return false;
			}
		}
		
		public ServerorderTO findOderByID(Integer oderID) {
			ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
			ServerorderTO to = dao.findOderByID(oderID);
			dao.destroy();
			return to;
		}
		
		public Page findOderByPage(int pagenum, int pagelen) {
		    ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
		    Page page = dao.findOderByPage(pagenum, pagelen);
		    dao.destroy();
		    return page;
		}
		
		public Page findOderByPage(int pagenum, int pagelen, String hrID, String kind, String status) {
		    ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
		    Page page = dao.findOderByPage(pagenum, pagelen, hrID, kind, status);
		    dao.destroy();
		    return page;
		}
        
		public Page findOderByPage(int pagenum, int pagelen, String hrID) {
		    ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
		    Page page = dao.findOderByPage(pagenum, pagelen, hrID);
		    dao.destroy();
		    return page;
		}
		
		public List findServerByputdate(int n) {
			 ServerorderDAO dao = DAOFactory.getInstance().getServerorderDAO();
			 List list=dao.findServerByputdate(n);
			 dao.destroy();
			 return list;
		}
		
}
