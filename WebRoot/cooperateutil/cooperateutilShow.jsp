<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>��λ��Ϣ����</title>
</head>

<body>
<%CooperateutilTO to = (CooperateutilTO)request.getAttribute("to");%>
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>��λ��Ϣ��ϸ����</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">��λ����</td>
      <td width="230"><%=to.getUtilname()%></td>
    
      <td width="130">��λ����</td>
      <td>
<% if(to.getUtilkind()==0) {%>
    	  ��ҵ
<% }else{ %>
    	  ����
<% } %>			
      </td>
    </tr>
    <tr>
      <td>��ϵ��</td>
      <td><%=to.getContactname()%></td>
      
      <td>�ʼ�</td>
      <td><%=to.getEmail()%></td>
      
    </tr>
    <tr>
      <td>��ϵ�绰</td>
      <td><%=to.getTelephone()%></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr>
      <td width="129">��ϵ��ַ</td>
      <td><%=to.getAddress()%></td>
    </tr>
    <tr><td><br></td></tr>
    <tr>
	  <td width="129">��λ���</td>
	  <td><%=to.getUtilinfo()%></td>
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