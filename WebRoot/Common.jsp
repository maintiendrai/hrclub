<%@page import="com.hrclub.model.Command" %>
<%
String username = (String) session.getAttribute(Command.USER_NAME);
String usertype = (String) session.getAttribute(Command.USER_TYPE);
 
int intUsertype = -1;
if(usertype!=null) intUsertype =Integer.parseInt(usertype); 
%>
 
 