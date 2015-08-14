package com.hrclub.model.command;
import com.hrclub.model.*;

import javax.servlet.http.*;
import com.hrclub.model.upload.*;
import com.hrclub.ApplicationResources;
import com.hrclub.util.*;
import com.hrclub.to.*;
public class UploadImageCommand  extends Command{
	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.UPLOAD_EXPERT_IMAGE;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();

		String resultPage = null;
		
		HttpSession session = request.getSession();
		String username=(String)session.getAttribute( USER_NAME);
		String usertype=(String)session.getAttribute( USER_TYPE);
		if(username==null||usertype==null){
			throw new Exception("ÇëÏÈµÇÂ¼£¡");
		}
		int intUsertype=Integer.parseInt(usertype);
		 
		boolean f=false;
		if(intUsertype== EXPERT ){
			SmartUpload mySmartUpload = new SmartUpload();
		      mySmartUpload.initialize( this.getSc(), request, response);
		      mySmartUpload.setAllowedFilesList("jpg");
		      mySmartUpload.setAllowedFilesList("JPG");
		      mySmartUpload.setAllowedFilesList("GIF");
		      mySmartUpload.setAllowedFilesList("gif");
		      mySmartUpload.setMaxFileSize(1000*300);
		      mySmartUpload.upload();
		      File file=mySmartUpload.getFiles().getFile(0);
		      String filename =file.getFileName();
		      String sub= filename.substring(filename.lastIndexOf('.')); 
		      String newfilename=username+sub;
		      //System.out.println(newfilename);
		      //file.saveAs(newfilename,File.SAVEAS_VIRTUAL); 
		      
		      //String filepath =ConfigManager.getPropValue("upload_expert_img");
		      String filepath =session.getServletContext().getRealPath("/");
		      filepath+= "image"+java.io.File.separator+"expert";
		      //
		      
		      file.saveAs(filepath+java.io.File.separator+newfilename);
		      f=UserManager.getInstance().updateExpertFace(username, newfilename);
		      
//		      int filecount = mySmartUpload.save(filepath);
//		      
//		      if(filecount==1){
//		    	  f=UserManager.getInstance().updateExpertFace(username, newfilename);
//		      }
		}   
		if (f) {
			resultPage = ApplicationResources.UPLOAD_IMAGE;
		} else {
			throw new Exception("ÉÏ´«Í¼Æ¬Ê§°Ü£¡");
		} 
		
		result.setResultPage(resultPage);

		logger
				.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

		return result;

	}
}
