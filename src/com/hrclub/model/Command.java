package com.hrclub.model;

import javax.servlet.*;
import javax.servlet.http.*;
import java.text.*;
import java.util.*;
import com.hrclub.util.*;

public abstract class Command {
	public static final int DEFAULT_PAGE_LENGTH = 10;

	protected boolean directly = false;

	static org.apache.log4j.Logger logger = org.apache.log4j.Logger
			.getLogger(com.hrclub.util.Logger.appender);

	public static final String USER_NAME = "user_name";

	public static final String USER_TYPE = "user_type";

	public static final String IS_SAFE = "safe";

	public static final int USER = 2;

	public static final int EXPERT = 1;

	public static final int ADMIN_ROOT = 3;

	public static final int ADMIN_MANAGER = 4;

	public ServletContext sc;

	public ServletContext getSc() {
		return sc;
	}

	public void setSc(ServletContext sc) {
		this.sc = sc;
	}

	public abstract Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception;

	public abstract String getName();

	public boolean isSafe(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session == null)
			return false;
		Boolean isSafe = (Boolean) session.getAttribute(IS_SAFE);
		if (isSafe == null)
			return false;
		if (isSafe.booleanValue()) {
			return true;
		} else {
			return false;
		}
	}

	public long getLongTime(String strtime) {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date d = null;
		try {
			d = formatter.parse(strtime);
		} catch (Exception e) {
			Logger.error(e.toString());
		}
		return d.getTime();
	}

	public void setAttribute(HttpServletRequest request, String attributeName,
			Object attributeValue) {
		HttpSession session = request.getSession();
		session.setAttribute(attributeName, attributeValue);
	}

	public Object getAttribute(HttpServletRequest request, String attributeName) {
		HttpSession session = request.getSession();
		return session.getAttribute(attributeName);
	}

	public String getStringLen(String src, int len) {
		if (src == null) {
			return src;
		}
		if (src.length() >= len) {
			return src;
		}
		for (int i = 0; i < len - src.length(); i++) {
			src = "0" + src;
		}
		return src;

	}

	protected void setSafe(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute(IS_SAFE, new Boolean(true));
	}

	protected String getRequestURL(String url, Properties prop) {
		url = url + "?";
		Enumeration enu = prop.propertyNames();
		while (enu.hasMoreElements()) {
			String key = (String) enu.nextElement();
			Object value = prop.get(key);
			if (value == null) {
				continue;
			} else if (value instanceof String) {
				url += key + "=" + (String) value;
			} else if (value instanceof String[]) {
				String[] temp = (String[]) value;
				for (int i = 0; i < temp.length; i++) {
					url += key + "=" + temp[i];
					if (i < temp.length - 1) {
						url += "&";
					}
				}
			} else if (value instanceof List) {
				Iterator it = ((List) value).iterator();
				while (it.hasNext()) {
					url += key + "=" + (String) it.next();
					if (it.hasNext()) {
						url += "&";
					}
				}
			} else {
				continue;
			}
			// url += key + "=" + prop.getProperty(key);
			if (enu.hasMoreElements()) {
				url += "&";
			}
		}
		return url;
	}

	public boolean isLogon(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute(USER_NAME);
		if (userName == null) {
			return false;
		} else if (userName.equals("")) {
			return false;
		}

		else {
			return true;
		}
	}

	public String getCurrentUserName(HttpServletRequest request)
			throws Exception {
		HttpSession session = request.getSession();
		String user = (String) session.getAttribute(USER_NAME);
		if (user == null) {
			throw new Exception("ÇëÖØÐÂµÇÂ¼");
		}
		return user;
	}

	public String buildString(String[] strarray) {
		String r = "";
		if (strarray == null) {
			return r;
		}
		for (int i = 0; i < strarray.length; i++) {
			r += strarray[i];
			if (i < strarray.length - 1) {
				r += ",";
			}
		}
		return r;
	}

	public String[] buildStringArray(String str) {
		if (str == null) {
			return null;
		}
		if (str.trim().equals("")) {
			return null;
		}
		StringTokenizer st = new StringTokenizer(str);
		ArrayList list = new ArrayList();
		while (st.hasMoreTokens()) {
			list.add(st.nextToken());
		}
		return (String[]) list.toArray(new String[0]);

	}

}
