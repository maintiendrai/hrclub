<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="../js/encryption.js"></script>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<title>管理员登陆</title>
<head>
<script>
function log(){
  if(document.loginform.adminID.value==""){
    alert("请输入用户帐号");
    document.loginform.adminID.focus();
    return false;
  }
  if(document.loginform.password.value==""){
    alert("请输入密码");
    document.loginform.password.focus();
    return false;
  }
  
  document.loginform.password.value=hex_md5(document.loginform.password.value);
  document.loginform.submit();
}

$(document).ready(function (){
$('#checkuser').click(function (){
if($("#adminID").val()==""){
alert("用户名不能为空");
return false;
}
if($("#password").val()==""){
alert("密码不能为空");
return false;
}
$.post('FrontController.do?operation=adminlogin', 
{adminID: $("#adminID").val(),password: $("#password").val(),role: $("#loginform input[@name=role]:checked").val()}, 
function (data){
$("#result").html(data); 
}); 
}); 
}); 
</script>
</head>
<%
   String userid = (String)session.getAttribute("adminuserid");
   if(!(userid==null)){
       String reply = (String)request.getAttribute("reply"); 
       out.print("<SCRIPT Language = javascript> window.alert( '"+reply+"');</SCRIPT>");

   }
%>
<body>
<table>
<div id="result"></div>
<td><br><br><br><br><br><br></td>
</table>
<form name="loginform" action="adminlogin.do?operation=adminlogin" method=post target="_top">
<p align="center"><b>管理员登陆</b></p>
<table width="300" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#0066FF" bgcolor="#33CCFF">
<tr>
  <td width="100" align="center">管理帐号</td>
  <td><input type=text name="adminID" style="width:150px" id="adminID"></td>
</tr>
<tr>
  <td align="center">密&nbsp;&nbsp;&nbsp;码</td>
  <td><input type=password name="password" style="width:150px" id="password"></td>
</tr>
<tr>
  <td colspan=2 align=center><input type=radio name="role" value="0">超级管理员
      <input type=radio name="role" value="1" checked>管理员
  </td>
</tr>
<tr>
  <td colspan=2 align=center>
  <input type=button  value="登录" class="button" onclick="log()">&nbsp;
  <input type=reset value="清空" class="button">
  </td>
</tr>
</table>
</form>
</body>
</html>