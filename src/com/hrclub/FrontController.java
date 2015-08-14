package com.hrclub;

import java.util.*;
import com.hrclub.util.*;
import com.hrclub.model.*;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class for Servlet: FrontController
 * 
 */
public class FrontController extends javax.servlet.http.HttpServlet implements
		javax.servlet.Servlet {
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(Logger.appender);

	public static final String CONTENT_TYPE = "text/html; charset=GBK";

	public static String targetEncoding = "GBK";
	
	private java.util.Timer timer;

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.Servlet#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
		super.destroy();
		try {
			ConnectionFactory.getFactory().destroy();
			timer.cancel();
		} catch (Exception e) {
			Logger.error(e.toString());
		}
		
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType(CONTENT_TYPE);
		// PrintWriter out = response.getWriter();  
		processRequest(request, response);     
	}

	/*
	 * (non-Java-doc)
	 * 
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request,
	 *      HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType(CONTENT_TYPE);
		// PrintWriter out = response.getWriter();
		processRequest(request, response);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see javax.servlet.GenericServlet#init()
	 */
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("FrontController init...");
		ServletContext sct = getServletContext();
		String prefix = sct.getRealPath("/");
		System.out.println("real path: " + prefix);
		String workdir = System.getProperty("user.dir");
		System.out.println("work dir: " + workdir);

		String logfile = getInitParameter("log4j-init-file");
		// if the log4j-init-file is not set, then no point in trying
		if (logfile != null) {
			Logger.init(logfile);
			System.out.println("Info: Found log4j config file!");
		} else {
			System.out.println("Warn: Cann't find log4j config file!");
		}

		Logger.info("[ " + prefix + " ] FrontController init...");
		Logger.info("Config file loading...");

		String conffile = getInitParameter("config-file");
		// Logger.info("config file path: " + prefix + conffile);

		Properties prop = null;

		if (conffile != null) {
			// prop = ConfigManager.getServerConfig(prefix + conffile);
			prop = ConfigManager.getServerConfig2(conffile);
			if (prop != null) {
				Logger.info("初始化数据库连接池......");
				ConnectionFactory.getFactory();
			}

		} else {
			System.out.println("Warn: Cann't find my config file!");
			Logger.warn("Cann't find my config file!");
		}
		logger.debug(prop);
		initCommon(prop);

		System.out.println("FrontController init end.");
		Logger.info("FrontController init end.");
	}

	private void initCommon(Properties prop) {
		CommandFactory.getInstance();
		DAOFactory.getInstance();
 
		
		
		timer = new Timer();      
		long timer_initdealy=Long.parseLong(prop.getProperty("timer_initdealy"));
		long timer_subsequent=Long.parseLong(prop.getProperty("timer_subsequent"));
		logger.debug(timer_initdealy);
		logger.debug(timer_subsequent);
		
		timer.schedule(new RemindTask(),	      
				timer_initdealy,
				//1000*60*60,     
				//initial delay	    
				timer_subsequent);
				//1000*60*60*3);  //subsequent rate
	}

	protected void processRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException,
			java.io.IOException {
		logger.debug("front controllor process...");
		request.setCharacterEncoding(targetEncoding);
		// String resultPage = null;
		CommandResult result = new CommandResult();
		Command command = null;

		try {

			RequestProcessor processor = new RequestProcessor(request);

			command = processor.getCommand();

			if (command == null) {
				Logger.debug("未知操作...");
				throw new Exception("操作错误");
			} else {

				// Logger.debug("Command: " + command.getName());
			}
			
			
			logger.debug(command.getName() + " command execute begin...");
			long begin = System.currentTimeMillis();
			command.setSc(this.getServletContext());
			ConnectionFactory.getFactory().showStatus();
			
			result = (CommandResult) command.execute(request, response);
			
			ConnectionFactory.getFactory().showStatus();
			long usedtime = System.currentTimeMillis() - begin;
			logger.debug(command.getName() + " command execute end. Cost "
					+ usedtime + " ms");
			
			result.setUsedtime(usedtime);
			request.setAttribute("usedtime", new Long(usedtime));
			CommandFactory.commandUsedTime(command.getName(), usedtime);
			ConnectionFactory.getFactory().showStatus();
			
		} catch (Exception e) {
			logger.debug(e.toString());
			result.setResultPage(ApplicationResources.getInstance()
					.getErrorPage(e));
			result.setIsDirectly(false);
		}
		// response.setContentType("text/html;charset=GBK");
		if (result.isIsDirectly()) {
			Logger.debug("send redirect: " + result.getResultPage());
			response.sendRedirect(result.getResultPage());
		} else {
			Logger.debug("dispatch: " + result.getResultPage());
			dispatch(request, response, result.getResultPage());
		}
		Logger.debug("front controllor process end.");

	}

	protected void dispatch(HttpServletRequest request,
			HttpServletResponse response, String page)
			throws javax.servlet.ServletException, java.io.IOException {

		RequestDispatcher dispatcher = this.getServletContext()
				.getRequestDispatcher(page);
		logger.debug("dispath forward " + page);
		dispatcher.forward(request, response);
		logger.debug("dispath forward " + page + " end.");
	}
	
	
	class RemindTask extends TimerTask {
		public void run() {	  
			logger.info("Timer task running...");
			long begin=System.currentTimeMillis();
			 
			 
			
			CommandFactory.showCommandHistory();
			ConnectionFactory.getFactory().showStatus();
			
			logger.info("Timer task run over. Cost "+(System.currentTimeMillis()-begin)+" ms");
		}  
	}
}