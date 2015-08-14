<%@ page language="java"   contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>HR控制界面</title>

</head>


<frameset  rows="72,*" framespacing="0" frameborder="no">
    <frame name="title" src="title.htm" frameborder="no" >
    <frameset   name="content" cols="255,*"  frameborder="no" >
    	<frame name="menu" src="hrmune.jsp">
	<frame name="main" src="hr/hrinfo.do?operation=qeueyhr" >
    </frameset>
</frameset>
</html>