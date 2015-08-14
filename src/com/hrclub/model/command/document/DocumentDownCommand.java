package com.hrclub.model.command.document;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.IntegralManager;
import com.hrclub.util.Logger;

public class DocumentDownCommand extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.DOCUMENT_DOWN;
	}
	
	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		int totlenum =0;
		int num=0;
		String url = request.getParameter("url");
        HttpSession session = request.getSession();
		
		String hrID = (String)session.getAttribute("hrID");
		if(null!=hrID) {
		
	    	totlenum = Integer.parseInt(request.getParameter("totlenum"));
	     	num = Integer.parseInt(request.getParameter("num"));
	    	if(totlenum<num)
		    {   
			   request.setAttribute("msgerror", "»ý·Ö²»×ã!");
		       resultPage = ApplicationResources.DOCUMENTHR_RETURN;
			   result.setResultPage(resultPage);
			   return result;
		    }
		
		}
		
		url=new String(url.getBytes("iso-8859-1"));
		File file = new File(url);
		InputStream in = new FileInputStream(file);
		OutputStream os = response.getOutputStream();
		response.addHeader("Content-Disposition", "attachment;filename="
				+ new String(file.getName().getBytes("gbk"),"iso-8859-1"));
		response.addHeader("Content-Length", file.length() + "");
		response.setCharacterEncoding("GBK");
		response.setContentType("application/octet-stream");
		int data = 0;
		while ((data = in.read()) != -1) {
			os.write(data);
		}
		os.close();
		in.close();
		
		if(null!=hrID) {
			boolean flags=IntegralManager.getInstance().reduce(hrID, 1, num);
		}
		
		boolean flag = true;
		
		if(flag==true){
			resultPage = ApplicationResources.DOCUMENTHR_RETURN;
		}else{
			throw new Exception("É¾³ýÊ§°Ü£¡");
		}
 
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
