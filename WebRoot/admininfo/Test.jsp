<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<%@ page import="com.hrclub.model.*"%>
<%


String adminID = request.getParameter("adminID");
AdmininfoTO to = AdmininfoManager.getInstance().findAdminByID(adminID);
if(to!=null){
  out.print("该用户已存在!");
}
else{
  out.print("该用户可以使用!");
}
%>