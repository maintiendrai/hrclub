package com.hrclub.model;

import javax.servlet.*;
import javax.servlet.http.*;

import com.hrclub.util.Logger;

import java.io.*;
import java.util.*;

public class RequestProcessor {
	static org.apache.log4j.Logger logger = Logger.getLogger();

	private HttpServletRequest request;

	public static final String op = "operation";

	CommandFactory cmdFactory = CommandFactory.getInstance();

	public RequestProcessor(HttpServletRequest request) {
		this.request = request;
	}

	public Command getCommand() {
		// logger.debug(request.getPathInfo());
		// logger.debug(request.getQueryString());
		// logger.debug(request.getRequestURI());
		// logger.debug(request.getServerName());
		
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute(Command.USER_NAME);
		String usertype = (String)session.getAttribute(Command.USER_TYPE);
		
		String opname = request.getParameter(op);
		if (opname == null)
			return null;

		if (new SecurityManager().isAccessable(opname,username,usertype)) {

			Command command = cmdFactory.create(opname);
			return command;
		} else {
			return null;
		}
	}

}
