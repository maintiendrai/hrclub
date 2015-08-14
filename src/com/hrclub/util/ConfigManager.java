package com.hrclub.util;

import java.util.*;
import java.io.*;

public class ConfigManager {
	private static Properties prop=new Properties();
	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
	.getLogger(com.hrclub.util.Logger.appender);
	public ConfigManager() {

	}
	
	public static Properties getProperties(){
		return prop;
	}
	
	public static String getPropValue(String key){
		return prop.getProperty(key);
	}

	public static Properties getServerConfig(String configFilePath) {
		 
		FileInputStream fin = null;
		try { 
			fin = new FileInputStream(configFilePath); 
			prop.load(fin); 
		} catch (Exception e) {
			//System.out.println("read config file failed: "+e.toString());
			Logger.error("read config file failed: "+e.toString());
		} finally {
			try {
				fin.close();
			} catch (Exception e) {
				System.out.println("close failed: "+e.toString());
			}
		}
		return prop;
	}
	
	public static Properties getServerConfig2(String configFileName) {
		 
		InputStream fin = null;
		try {
			fin =  Thread.currentThread().getContextClassLoader().
            getResourceAsStream(configFileName);
			prop.load(fin);
		} catch (Exception e) {
			System.out.println("read config file failed: "+e.toString());
			Logger.error("read config file failed: "+e.toString());
		} finally {
			try {
				fin.close();
			} catch (Exception e) {
				System.out.println("close failed: "+e.toString());
			}
		}
		return prop;
	}

}
