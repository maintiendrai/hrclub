<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>信息管理</title>
</head>

<body>
<%MessageTO to = (MessageTO)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>查看信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">信息主题</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>信息类型</td>
      <td><%   switch (to.getKind())
               {
                     case 0:out.println("其他");break;
                     case 1:out.println("公告");break;
                     case 2:out.println("HR公告");break;
                     case 3:out.println("IT人才公告");break;
                }%>
      </td>
    </tr>
    <tr>
      <td>发布时间</td>
      <td><%=to.getPuttime()%></td>
    </tr>
    <tr>
      <td>生效时间</td>
      <td><%=to.getStarttime()%></td>
    </tr>
     <tr>
      <td>失效时间</td>
      <td><%=to.getEndtime()%></td>
    </tr>
    <tr>
      <td>信息内容</td>
      <td><%=to.getContext()%></td>
    </tr> 
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>   
      <td colspan="2">
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
