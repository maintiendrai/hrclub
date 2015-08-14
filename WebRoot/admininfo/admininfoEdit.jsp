<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script type="text/javascript" src="../js/encryption.js"></script>
<script>
function validator(){
   
   if(document.myform.adminID.value==""){
    alert("账号不能为空！");
    document.myform.adminID.focus();
    return false;
   }
   
   if(document.myform.password.value==""){
    alert("请设置密码！");
    document.myform.password.focus();
    return false;
   }
   
   if(document.myform.password.value.length<6){
    alert("密码长度必须大于6");
    document.myform.password.focus();
    return false;
   }
   
   if(document.myform.password.value!=document.myform.rpassword.value){
    alert("两次设置的密码不一致！");
    document.myform.rpassword.focus();
    return false;
   }
   
   document.myform.password.value=hex_md5(document.myform.password.value);
}
</script>
<title>管理员管理</title>
</head>

<body>
<%AdmininfoTO to = (AdmininfoTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=admininfoedit&method=update" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>修改管理员</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    
    <tr>
		<td width="120">账号</td>
		<td><input type="hidden" name="adminID" value="<%=to.getAdminID()%>" style="width:130px"/><%=to.getAdminID()%></td>	
	</tr>
	<tr>
	    <td>新密码</td>
		<td><input type="password" name="password" value="" style="width:130px"/>&nbsp;<font color="red">* </font>请输入6位以上字母或数字</td> 
	</tr>
	<tr>
	    <td>密码确认</td>
		<td><input type="password" name="rpassword" style="width:130px"/></td>  
	</tr>
	<tr>
	    <td>姓名</td>
		<td><input type="text" name="adminname" value="<%=to.getAdminname()%>" style="width:130px"/></td>  
	</tr>	
	<tr>
	    <td>角色</td>
		<td><input type="hidden" name="role" value="<%=to.getRole()%>"/>
  			<%out.print("管理员");%>
	    </td>   
	</tr>
<tr><td><br></td></tr>
</table>	
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">    
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>