<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.certificatename.value==""){
    alert("֤�����Ʋ���Ϊ�գ�");
    document.myform.certificatename.focus();
    return false;
   }
}
</script>
<title>֤����������</title>
</head>

<body>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=certificatecomfadd&method=add" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>���֤��</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    
    <tr>
		<td width="120">֤������</td>
		<td><input type="text" name="certificatename" value="" style="width:230px"/></td>	
	</tr>
	<tr>
		<td width="120">֤������</td>
		<td>
		  <select name="kind">
    	  <option value="0">����</option>
    	  <option value="1">�����</option>
    	  <option value="2">����</option>
    	  <option value="3">����</option>
    	  <option value="4">ְ��</option>
  	      </select>
  	    </td>	
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
