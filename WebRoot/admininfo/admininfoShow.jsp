<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>����Ա����</title>
</head>

<body>
<%AdmininfoTO to = (AdmininfoTO)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>����Ա��ϸ����</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    
    <tr>
		<td width="120">�˺�</td>
		<td><%=to.getAdminID()%></td>	
	</tr>
	    <td>����</td>
	    <td><%=to.getAdminname()%></td>
	<tr>
	</tr>
	<tr>
	    <td>��ɫ</td>
<%  if(to.getRole()==1){ %>	
	    <td>����Ա</td>
<%  }else {%>
        <td>��������Ա</td>
<%} %>   
	</tr>
<tr><td><br></td></tr>
</table>	
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">    
    <tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" ���� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>