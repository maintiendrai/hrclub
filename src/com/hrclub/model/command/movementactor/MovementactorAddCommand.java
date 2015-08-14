package com.hrclub.model.command.movementactor;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrclub.ApplicationResources;
import com.hrclub.model.Command;
import com.hrclub.model.CommandFactory;
import com.hrclub.model.CommandResult;
import com.hrclub.model.MovementactorManager;
import com.hrclub.to.MovementactorTO;
import com.hrclub.to.Page;
import com.hrclub.util.Logger;

public class MovementactorAddCommand extends Command {

	static org.apache.log4j.Logger logger = Logger.getLogger();

	public String getName() {
		return CommandFactory.MOVEMENTACTOR_ADD;
	}

	public Object execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		CommandResult result = new CommandResult();
		String resultPage = null;
		if (request.getParameter("method").equals("addItem")) {
			String starttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(Calendar.getInstance().getTime());

			request.setAttribute("starttime", starttime);

			resultPage = ApplicationResources.MOVEMENTACTOR_ADD;

			result.setResultPage(resultPage);

			logger.debug(this.getName() + "'s result will be sent to "
					+ resultPage);

			return result;
		}

		if (request.getParameter("method").equals("add")) {

			int moveID = Integer.parseInt(request.getParameter("moveID"));
			int moveStatus = Integer.parseInt(request.getParameter("status"));
			if (moveStatus == 0) {
				HttpSession session = request.getSession();
				Object userid = session.getAttribute("userid");
				Object hrID = session.getAttribute("hrID");
				String memberID = null;
				int kind = 0;
				if (null == userid && null == hrID) {
					resultPage = ApplicationResources.INDEX;

					result.setResultPage(resultPage);
					return result;
				}
				if (null != userid) {
					memberID = session.getAttribute("userid").toString();
					kind = 2;
				}
				if (null != hrID) {
					memberID = session.getAttribute("hrID").toString();
					kind = 1;
				}
				int status = 0;

				String starttime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
						.format(Calendar.getInstance().getTime());

				MovementactorTO to = new MovementactorTO();

				to.setMoveID(moveID);
				to.setKind(kind);
				to.setStatus(status);
				to.setMemberID(memberID);
				to.setStarttime(starttime);

				String moveIDs = String.valueOf(moveID);
				String kinds = String.valueOf(kind);
				MovementactorTO actor = MovementactorManager.getInstance()
						.findActorByID(moveIDs, memberID, kinds);

				request.setAttribute("memberID", memberID);
				request.setAttribute("kind", "" + kind);
				if (null != actor) {
					request.setAttribute("msgerror", "您已报名!");
					Page mypage = MovementactorManager.getInstance()
							.findMovByUserID(1, 10, memberID, "" + kind);
					request.setAttribute("mypage", mypage);
					resultPage = ApplicationResources.MOVACTOR_LIST;
					result.setResultPage(resultPage);
					return result;
				}
				boolean flag = MovementactorManager.getInstance().insert(to);
				Page mypage = MovementactorManager.getInstance()
						.findMovByUserID(1, 10, memberID, "" + kind);
				request.setAttribute("mypage", mypage);

				if (flag == true) {
					request.setAttribute("msgerror", "报名成功!");
					resultPage = ApplicationResources.MOVACTOR_LIST;
				} else {
					throw new Exception("添加失败！");
				}

				result.setResultPage(resultPage);

				logger.debug(this.getName() + "'s result will be sent to "
						+ resultPage);

				return result;
			}
			request.setAttribute("msgerror", "活动已停止!");
			resultPage = ApplicationResources.ACTOR_RETURNLIMT;
			result.setResultPage(resultPage);
			return result;
		}
		return null;

	}
}
