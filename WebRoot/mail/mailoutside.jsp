<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<title>邮件管理</title>
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
<script>
function validator(){
   
   var d =0;
   
   for(var i=0;i<document.myform.revID.length;i++)
   {
   	     if(document.myform.revID[i].checked==true)
   	     	d = d+1;
    }
   
   if(d==0){
    alert("请选择发送人！");
    document.myform.subject.focus();
    return false;
   }
  
   
   if(document.myform.subject.value==""){
    alert("邮件主题不能为空！");
    document.myform.subject.focus();
    return false;
   }
   
   if(document.myform.context.value==""){
    alert("邮件内容不能为空！");
    document.myform.context.focus();
    return false;
   }
   
}
</script>
<%
String adminID = (String)session.getAttribute("adminuserid");
if(null==adminID) {

	response.sendRedirect("../adminindex/login.jsp");

}	
%>
<body>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=mailout" onsubmit="return validator(this)">
<input type="hidden" name="operation"  value="serverorderadd"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr>
	    <td colspan="2"  class="dvInnerHeader"><b>站外邮件</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">发送人</td>
      <td>管理员</td>
    </tr>
    <tr>
      <td width="80">接受人</td>
      <td>HR<input type="checkbox" name="revID" value="1"> IT人才<input type="checkbox" name="revID" value="2"></td>
    </tr>
    <tr>
      <td>邮件主题</td>
      <td><input type="text" name="subject" style="width:230px"/>
      </td>
    </tr>
    <tr>
      <td>邮件内容</td>
      <td><textarea name="context" rows="7" cols="50" value="" /></textarea></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 发送 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>

