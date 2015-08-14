package com.hrclub.model.command.integral;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.IntegralManager;
import com.hrclub.to.IntegralTO;
import com.hrclub.util.Logger;

public class IntegralAddCommand extends Command{
	
		
			static org.apache.log4j.Logger logger = Logger.getLogger();

			public String getName() {
				return CommandFactory.INTEGRAL_ADD;
			}

			public Object execute(HttpServletRequest request,
					HttpServletResponse response) throws Exception {
				CommandResult result = new CommandResult();
				String resultPage = null;
				String hrID = request.getParameter("hrID");
				int num = Integer.parseInt(request.getParameter("num"));
				
				
				IntegralTO to = new IntegralTO();
				to.setHrID(hrID);
				to.setNum(num);
				
				boolean flag=IntegralManager.getInstance().insert(to);
				
				if(flag==true){
					resultPage = ApplicationResources.INTEGRAL_RETURN;
				}else{
					throw new Exception("»ý·ÖÌí¼ÓÊ§°Ü£¡");
				}
		 
				result.setResultPage(resultPage);

				logger
						.debug(this.getName() + "'s result will be sent to "
								+ resultPage);

				return result;

			}
	}



