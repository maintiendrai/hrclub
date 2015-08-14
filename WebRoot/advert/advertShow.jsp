<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<title>广告管理</title>
</head>

<body>
<%AdvertTO to = (AdvertTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>查看广告</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="100">广告名称</td>
      <td><%=to.getAdname()%></td>
    </tr>
    <tr>
      <td>广告链接</td>
      <td><%=to.getAdpurl()%></td>
    </tr>
    <tr>
      <td>网站链接</td>
      <td><%=to.getWeburl()%></td>
    </tr>
    <tr>
      <td>状态</td>
      <td>
    	  <%if(to.getStatus()==0) out.print("正常");%>
    	  <%if(to.getStatus()==1) out.print("停止");%>
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
