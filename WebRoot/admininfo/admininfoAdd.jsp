<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script type="text/javascript" src="../js/encryption.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script>
function validator(){
   
   if(document.myform.doit.value=="0"){
    alert("����ȷ���˺ſ��ã�");
    document.myform.adminID.focus();
    return false;
   }
   
   if(document.myform.adminID.value==""){
    alert("�˺Ų���Ϊ�գ�");
    document.myform.adminID.focus();
    return false;
   }
   
   if(document.myform.password.value==""){
    alert("���������룡");
    document.myform.password.focus();
    return false;
   }
   
   if(document.myform.password.value.length<6){
    alert("���볤�ȱ������6");
    document.myform.password.focus();
    return false;
   }
   
   if(document.myform.password.value!=document.myform.rpassword.value){
    alert("�������õ����벻һ�£�");
    document.myform.rpassword.focus();
    return false;
   }
   
   document.myform.password.value=hex_md5(document.myform.password.value);
}

$(document).ready(function (){
$('#checkuser').click(function (){
if($("#adminID").val()==""){
alert("�û�������Ϊ��");
return false;
}
$("#result").html("������֤��......"); 
$.post('FrontController.do?operation=admininfoadd&method=check', 
{adminID: $("#adminID").val()}, 
function (data){ //�ش����� 
$("#result").html(data); 
}); 
$("#doit").val("1");
}); 
}); 


</script>
<title>����Ա����</title>
</head>

<body>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=admininfoadd&method=add" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>��ӹ���Ա</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    
    <tr>
		<td width="120">�˺�</td>
		<td><input type="text" name="adminID" value="" style="width:130px" id="adminID" />
		    <input type=button value='Ψһ����֤' class="btn3" id="checkuser"/>
		    <input type=hidden id="doit" value="0">
		    <span id="result"></span>
		</td>	
	</tr>
	<tr>
	    <td>����</td>
		<td><input type="password" name="password" value="" style="width:130px"/>&nbsp;<font color="red">* </font>������6λ������ĸ������</td>
	</tr>
	<tr>
	    <td>����ȷ��</td>
		<td><input type="password" name="rpassword" value="" style="width:130px"/></td>  
	</tr>
	<tr>
	    <td>����</td>
		<td><input type="text" name="adminname" value="" style="width:130px"/></td>  
	</tr>		
	<tr>
	    <td>��ɫ</td>
	    <td><input type="hidden" name="role" value="1"/>
  			<%out.print("����Ա");%>
	    </td>
	</tr>
<tr><td><br></td></tr>
</table>	
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">    
    <tr>
      <td colspan="2">
        <input type="submit" name="submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� " class="button" onclick="history.back();"/>
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
