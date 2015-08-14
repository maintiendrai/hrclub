<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<script src="../js/ParamUtil.js"></script>
<title>活动参与者管理</title>
</head>

<body>
<%String starttime =(String) request.getAttribute("starttime");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=movementactoradd&method=add">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>参与活动</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>活动编号</td>
      <td><input type="text" name="moveID" style="width:130px"/></td>
    </tr>
    <tr>
      <td width="130">参与者编号</td>
      <td><input type="text" name="memberID" style="width:130px"/></td>
    </tr>
     <tr>
      <td width="130">参与者类型</td>
      <td><input type="text" name="kind" style="width:130px"/></td>
    </tr>
    <tr>
      <td>报名时间</td>
      <td><input type="hidden" name="starttime" value="<%=starttime%>"/>
          <%=starttime%>
      </td>
    </tr>
    <tr>
      <td>状态</td>
      <td><input type="hidden" name="status" value="0"/>
          <%out.print("已报名");%>
  	  </td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="6">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
