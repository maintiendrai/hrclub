<%@ page contentType="text/html;charset=gb2312"%>
<html>
<head>

<title>系统管理</title>

</head>
<%
   String userid = (String)session.getAttribute("adminuserid");
   if(!(userid==null)){
       
   
%>

<frameset rows="80,*" framespacing="0" border="0" frameborder="0"
	style="border:0px">
	<frame name="title" src="top.htm" marginwidth="1"
		marginheight="1" scrolling="no" frameborder="0" >
	<frameset name="content" cols="190,*" frameborder="yes"
		style="border-right:1px solid threedhighlight;border-left:1px solid threedshadow;border-bottom:1px solid threedhighlight;border-top:0px solid threedshadow">
		<frame name="menu" src="menu.jsp" marginwidth="1"
			marginheight="1" scrolling="no" frameborder="1" target="wndMain">
		<frame name="wndMain" src="introduce.htm" marginwidth="1"
			marginheight="1" scrolling="auto"  target="_self">
	</frameset>
</frameset>
<% } else {
		   response.sendRedirect("login.jsp");
   }
%>
</html>
