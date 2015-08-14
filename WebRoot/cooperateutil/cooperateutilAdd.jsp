<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.utilname.value==""){
    alert("单位名称不能为空！");
    document.myform.utilname.focus();
    return false;
   }
   
   if(document.myform.contactname.value==""){
    alert("联系人不能为空！");
    document.myform.contactname.focus();
    return false;
   }
   
   if(document.myform.email.value==""){
    alert("邮件不能为空！");
    document.myform.email.focus();
    return false;
   }
   
   if(!isEmail(document.myform.email.value)){
    alert("邮件格式错误");
    document.myform.email.focus();
    return false;
   }
   
   if(document.myform.telephone.value==""){
    alert("联系电话不能为空！");
    document.myform.telephone.focus();
    return false;
   }
   
   if(document.myform.address.value==""){
    alert("联系地址不能为空！");
    document.myform.address.focus();
    return false;
   }
   
   if(document.myform.utilinfo.value==""){
    alert("单位简介不能为空！");
    document.myform.utilinfo.focus();
    return false;
   }
   
}
</script>
<title>单位信息管理</title>
</head>

<body>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=cooperateutiladd&method=add" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>新增单位信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">单位名称</td>
      <td><input type="text" name="utilname" value="" style="width:180px"/></td>
    
      <td>单位类型</td>
      <td>
           <select name="utilkind">
    			<option value="0">企业</option>
    			<option value="1">个人</option>
  		   </select>
      </td>
    </tr>
    <tr>
      <td>联系人</td>
      <td><input type="text" name="contactname" value="" style="width:180px"/></td>
      
      <td>邮件</td>
      <td><input type="text" name="email" value="" style="width:180px"/></td>
      
    </tr>
    <tr>
      <td>联系电话</td>
      <td><input type="text" name="telephone" value="" style="width:180px"/></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr>
      <td width="129">联系地址</td>
      <td><input type="text" name="address" value="" style="width:330px"/></td>
    </tr>
    <tr><td><br></td></tr>
    <tr>
	  <td width="129">单位简介</td>
	  <td><textarea name="utilinfo" rows="7" cols="50" value="" /></textarea></td>
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
