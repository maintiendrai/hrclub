<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>��Ϣ����</title>
</head>

<body>
<%DocumentTO to = (DocumentTO)request.getAttribute("to");%>
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
      <td width="130">��������</td>
      <td><%=to.getDocumentname()%></td>
    </tr>
    <tr>
      <td width="130">�ϴ���ID</td>
      <td><%=to.getNameID()%></td>
    </tr>
    <tr>
      <td>�ϴ�������</td>
      <td><%   switch (to.getKind())
               {
                  case 1:out.println("HR");break;
                  case 2:out.println("IT�˲�");break;
                  case 3:out.println("����Ա");break;
               }%></td>
    </tr>
    <tr>
    <td>����URL</td>
      <td><%=to.getUrl()%></td>
    </tr>
    <tr>
    <td>�����������</td>
      <td><%   switch (to.getIntegral())
               {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
               }%></td>
    </tr>
    <tr>
    <td>�ļ���С</td>
      <td><%=to.getSize()%></td>
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
