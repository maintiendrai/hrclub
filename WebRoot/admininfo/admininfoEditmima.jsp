<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script type="text/javascript" src="../js/encryption.js"></script>
<script>
function validator(){
   
   if(document.myform.adminID.value==""){
    alert("�˺Ų���Ϊ�գ�");
    document.myform.adminID.focus();
    return false;
   }
   
   if(document.myform.oldpassword.value==""){
    alert("����������룡");
    document.myform.oldpassword.focus();
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
   document.myform.oldpassword.value=hex_md5(document.myform.oldpassword.value);
}
</script>
<title>����Ա����</title>
</head>

<body>
<%AdmininfoTO to = (AdmininfoTO)request.getAttribute("to");%>
 <%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=admininfoedit&method=updateone" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸ĸ�����Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    
    <tr>
		<td width="120">�˺�</td>
		<td><input type="hidden" name="adminID" value="<%=to.getAdminID()%>" style="width:130px"/><%=to.getAdminID()%></td>	
	</tr>
	<tr>
	    <td>������</td>
		<td><input type="password" name="oldpassword" value="" style="width:130px"/>&nbsp;<font color="red"></td> 
	</tr>
	<tr>
	    <td>������</td>
		<td><input type="password" name="password" value="" style="width:130px"/>&nbsp;<font color="red">* </font>������6λ������ĸ������</td> 
	</tr>
	<tr>
	    <td>����ȷ��</td>
		<td><input type="password" name="rpassword" style="width:130px"/></td>  
	</tr>
	<tr>
	    <td>����</td>
		<td><input type="text" name="adminname" value="<%=to.getAdminname()%>" style="width:130px"/></td>  
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
</div>
</form>
</body>
</html>