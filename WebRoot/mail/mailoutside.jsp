<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<title>�ʼ�����</title>
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
    alert("��ѡ�����ˣ�");
    document.myform.subject.focus();
    return false;
   }
  
   
   if(document.myform.subject.value==""){
    alert("�ʼ����ⲻ��Ϊ�գ�");
    document.myform.subject.focus();
    return false;
   }
   
   if(document.myform.context.value==""){
    alert("�ʼ����ݲ���Ϊ�գ�");
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
	    <td colspan="2"  class="dvInnerHeader"><b>վ���ʼ�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">������</td>
      <td>����Ա</td>
    </tr>
    <tr>
      <td width="80">������</td>
      <td>HR<input type="checkbox" name="revID" value="1"> IT�˲�<input type="checkbox" name="revID" value="2"></td>
    </tr>
    <tr>
      <td>�ʼ�����</td>
      <td><input type="text" name="subject" style="width:230px"/>
      </td>
    </tr>
    <tr>
      <td>�ʼ�����</td>
      <td><textarea name="context" rows="7" cols="50" value="" /></textarea></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>

