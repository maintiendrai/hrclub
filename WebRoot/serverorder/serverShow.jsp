<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>���񶩵�����</title>
</head>

<body>
<%ServerorderTO to = (ServerorderTO)request.getAttribute("to");%>
<form id="form" name="form" method="post">
<input type="hidden" name="oderID"  value="<%=to.getOderID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�����鿴</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>��������</td>
      <td><%=to.getOrdertitle()%></td>
    </tr>
    <tr>
      <td width="130">�������ʺ�</td>
      <td><%=to.getHrID()%></td>
    </tr>
    <tr>
      <td>��������</td>
      <td><%   switch(to.getKind())
               {
                     case 0:out.println("����");break;
                     case 1:out.println("��ҵ����");break;
                     case 2:out.println("��ѵ����");break;
                     case 3:out.println("������");break;
                     case 4:out.println("������ǲ");break;
                     case 5:out.println("��ͷ");break;         
                }%>
      </td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><%=to.getBuytime()%></td>
    </tr>
    <tr>
      <td>����״̬</td>
      <td><%   switch(to.getStatus())
               {
                     case 0:out.println("δ����");break;
                     case 1:out.println("�Ѵ���");break;
                     case 2:out.println("��ɾ��");break;
                     case 3:out.println("������");break; 
                }%>
      </td>
    </tr>
    <tr>
      <td>�������</td>
      <td><%=to.getOderinfo()%></td>
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
