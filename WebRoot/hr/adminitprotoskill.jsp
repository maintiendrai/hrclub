<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>�����Ŀ����</title>
      <link rel="stylesheet" type="text/css" href="../adminindex/table.css">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>


	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
   </td><td width="600">

    <a href="<%=path%>/hr/adminitpro.jsp"> ���������Ŀ����</a>
    <a href="<%=path%>/hr/adminitskill.jsp">��һ�����IT����</a>
    </td>
    </tr></table>
  </body>
</html>
