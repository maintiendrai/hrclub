<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>�ʼ�����</title>
<style type="text/css">
a      {
    color:#000000;
    text-decoration:none
}
a:visited{
    color:#000000;
}
a:hover{
    color:#FFFFFF;
    text-decoration:none;
    background-color:#33CCFF;
}
</style>
</head>

<body>
<%MailTO to = (MailTO)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�鿴�ʼ�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">������</td>
      <td><%=to.getSentID()%></td>
    </tr>
    <tr>
      <td>������</td>
      <td><%=to.getRevID()%></td>
    </tr>
    <tr>
      <td>����������</td>
      <td><% switch (to.getRevkind())
             {
                 case 1:out.println("HR");break;
                 case 2:out.println("IT�˲�");break;

              }%></td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><%=to.getTime()%></td>
    </tr>
    <tr>
      <td>�ʼ�����</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>�ʼ�����</td>
      <td><%=to.getContext()%></td>
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
</form>
</body>
</html>


