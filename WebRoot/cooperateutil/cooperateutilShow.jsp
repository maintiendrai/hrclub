<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>单位信息管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>单位信息详细资料</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">单位名称</td>
      <td width="230"><%=to.getUtilname()%></td>
    
      <td width="130">单位类型</td>
      <td>
<% if(to.getUtilkind()==0) {%>
    	  企业
<% }else{ %>
    	  个人
<% } %>			
      </td>
    </tr>
    <tr>
      <td>联系人</td>
      <td><%=to.getContactname()%></td>
      
      <td>邮件</td>
      <td><%=to.getEmail()%></td>
      
    </tr>
    <tr>
      <td>联系电话</td>
      <td><%=to.getTelephone()%></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr>
      <td width="129">联系地址</td>
      <td><%=to.getAddress()%></td>
    </tr>
    <tr><td><br></td></tr>
    <tr>
	  <td width="129">单位简介</td>
	  <td><%=to.getUtilinfo()%></td>
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
</div>
</form>
</body>
</html> 