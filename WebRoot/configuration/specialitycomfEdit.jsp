<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.specialityname.value==""){
    alert("רҵ���Ʋ���Ϊ�գ�");
    document.myform.specialityname.focus();
    return false;
   }
}
</script>
<title>רҵ��������</title>
</head>

<body>
<%SpecialitycomfTO to = (SpecialitycomfTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=specialitycomfedit" onsubmit="return validator(this)">
<input type="hidden" name="specialityID" value="<%=to.getSpecialityID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸�רҵ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">

	
	<tr>
		<td width="120">רҵ����</td>
		<td><input type="text" name="specialityname" value="<%=to.getSpecialityname()%>" style="width:230px"/></td>	
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