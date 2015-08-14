<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>活动管理</title>
</head>

<body>
<%MovementactorTO to = (MovementactorTO)request.getAttribute("to");%>
<form id="form" name="form" method="post">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>活动查看</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>活动编号</td>
      <td><%=to.getMoveID()%></td>
    </tr>
    <tr>
      <td width="130">参与者编号</td>
      <td><%=to.getMemberID()%></td>
    </tr>
     <tr>
      <td width="130">参与者类型</td>
      <td><%   switch (to.getKind())
             {
                    case 1:out.println("HR");break;
                    case 2:out.println("IT人才");break;
              }%></td>
    </tr>
    <tr>
      <td>报名时间</td>
      <td><%=to.getStarttime()%>
      </td>
    </tr>
    <tr>
      <td>状态</td>
      <td>
          <%  switch (to.getStatus())
              {
                    case 0:out.println("已报名");break;
                    case 1:out.println("已批准");break;
              }%>
  	  </td>
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
