<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<html>
<head>
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/country/change_region.js"></script>
<title>HR管理</title>
</head>
<%
	HashMap listcall = helper.getCallingcomf();
	HRinfoTO ituser = new HRinfoTO();
	ituser = (HRinfoTO)request.getAttribute("to");
%>
<body>
	
<form name="form1" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>HR个人信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>  
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
   <tr>
     <td width="130">真实姓名</td>
	 <td><%=ituser.getName()%></td>
   </tr>
   <tr>
        <td>性别</td>
        <td><%
			   if (ituser.getSex() == 0)
				  out.print("男士");
		       if (ituser.getSex() == 1)
			      out.print("女士");
	    	%>
    	</td>
	</tr>
	<tr>
		<td>出生日期</td>
		<td><%=ituser.getBorn()%></td>
	</tr>
	<tr>
		<td>所在省份</td>
		<td><%=helper.getProvince(ituser.getProvince())%></td>
	</tr>
	<tr>
		<td>所在城市</td>
		<td><%=helper.getCity(ituser.getProvince(),ituser.getCity())%></td>
	</tr>
	<tr>
		<td>行业</td>
		<td><%=listcall.get(ituser.getCalling())%></td>
	</tr>
	<tr>
        <td>联系地址</td>
		<td><%=ituser.getAddress()%></td>
	</tr>
	<tr>
		<td>固定电话</td>
		<td><%=ituser.getTelephone()%></td>
	</tr>
	<tr>
		<td>移动电话</td>
		<td><%=ituser.getMobilephone()%></td>
	</tr>
	<tr><td>公司性质</td>
		<td><%
				int kind = ituser.getCorpkind();
					if (kind == 1)
						out.print("国有企业");
					if (kind == 2)
						out.print("私营企业");
					if (kind == 3)
						out.print("外资独资企业");
					if (kind == 4)
						out.print("中外合资企业");
					if (kind == 0)
						out.print("其他");
			%>
		</td>
	</tr>
	<tr><td>公司名称</td>
		<td><%=ituser.getCorporation()%></td>
	</tr>
	<tr>
		<td>公司简介</td>
		<td><%=ituser.getCorinfo()%></td>
	</tr>
	<tr>
		<td>公司网站</td>
		<td><%=ituser.getWebsite()%></td>
	</tr>
<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
