<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>��Ϣ����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>�鿴��Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">��Ϣ����</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
      <td><%   switch (to.getKind())
               {
                     case 0:out.println("����");break;
                     case 1:out.println("����");break;
                     case 2:out.println("HR����");break;
                     case 3:out.println("IT�˲Ź���");break;
                }%>
      </td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><%=to.getPuttime()%></td>
    </tr>
    <tr>
      <td>��Чʱ��</td>
      <td><%=to.getStarttime()%></td>
    </tr>
     <tr>
      <td>ʧЧʱ��</td>
      <td><%=to.getEndtime()%></td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
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
