<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<script type="text/javascript" src="../js/encryption.js"></script>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/jquery.js"></script>
<title>����Ա��½</title>
<head>
<script>
function log(){
  if(document.loginform.adminID.value==""){
    alert("�������û��ʺ�");
    document.loginform.adminID.focus();
    return false;
  }
  if(document.loginform.password.value==""){
    alert("����������");
    document.loginform.password.focus();
    return false;
  }
  
  document.loginform.password.value=hex_md5(document.loginform.password.value);
  document.loginform.submit();
}

$(document).ready(function (){
$('#checkuser').click(function (){
if($("#adminID").val()==""){
alert("�û�������Ϊ��");
return false;
}
if($("#password").val()==""){
alert("���벻��Ϊ��");
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
<p align="center"><b>����Ա��½</b></p>
<table width="300" border="1" align="center" cellpadding="1" cellspacing="1" bordercolor="#0066FF" bgcolor="#33CCFF">
<tr>
  <td width="100" align="center">�����ʺ�</td>
  <td><input type=text name="adminID" style="width:150px" id="adminID"></td>
</tr>
<tr>
  <td align="center">��&nbsp;&nbsp;&nbsp;��</td>
  <td><input type=password name="password" style="width:150px" id="password"></td>
</tr>
<tr>
  <td colspan=2 align=center><input type=radio name="role" value="0">��������Ա
      <input type=radio name="role" value="1" checked>����Ա
  </td>
</tr>
<tr>
  <td colspan=2 align=center>
  <input type=button  value="��¼" class="button" onclick="log()">&nbsp;
  <input type=reset value="���" class="button">
  </td>
</tr>
</table>
</form>
</body>
</html>