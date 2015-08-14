package com.hrclub.util;

import org.apache.log4j.PropertyConfigurator;

public class Logger {
	static org.apache.log4j.Logger logger = null;
	public static final String appender="hrclub";

	private static boolean inited = false;

//	public static void init(String log4jConfigFile) {
//		PropertyConfigurator.configure(log4jConfigFile);
//		logger = org.apache.log4j.Logger.getLogger(appender);
//		inited = true;
//	}

	public static void init(String log4jConfigFileName) {
		PropertyConfigurator.configure(Thread.currentThread()
				.getContextClassLoader().getResource(log4jConfigFileName));
		logger = org.apache.log4j.Logger.getLogger(appender);
		inited = true;
	}
	
	public static org.apache.log4j.Logger getLogger(){
		return logger;
	}

	public static void debug(Object message) {
		if (inited && logger != null)
			logger.debug(message);
		else
			System.out.println(message);
	}

	public static void info(Object message) {
		if (inited && logger != null)
			logger.info(message);
		else
			System.out.println(message);
	}

	public static void warn(Object message) {
		if (inited && logger != null)
			logger.warn(message);
		else
			System.out.println(message);
	}

	public static void error(Object message) {
		if (inited && logger != null)
			logger.error(message);
		else
			System.out.println(message);
	}

	public static void fatal(Object message) {
		if (inited && logger != null)
			logger.fatal(message);
		else
			System.out.println(message);
	}

}
