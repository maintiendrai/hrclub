<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<script src="<%=request.getContextPath()%>/js/ParamUtil.js"> </script>
<script>
function validator(){
   
   if(document.myform.adname.value==""){
    alert("���������Ϊ�գ�");
    document.myform.adname.focus();
    return false;
   }
   if(document.myform.adpurl.value==""){
    alert("������Ӳ���Ϊ�գ�");
    document.myform.adpurl.focus();
    return false;
   }
   if(document.myform.weburl.value==""){
    alert("��վ���Ӳ���Ϊ�գ�");
    document.myform.weburl.focus();
    return false;
   }
 
}
</script>
<title>������</title>
</head>

<body>
<div id="contentborder" align="center">
<form id="myform" name="myform" method="post" action="FrontController.do?operation=advertadd&method=add" onsubmit="return validator(this)">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>��ӹ��</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="100">�������</td>
      <td><input type="text" name="adname" style="width=200"/></td>
    </tr>
    <tr>
      <td>�������</td>
      <td><input type="text" name="adpurl" style="width=200"/></td>
    </tr>
    <tr>
      <td>��վ����</td>
      <td><input type="text" name="weburl" style="width=200"/></td>
    </tr>
    <tr>
      <td>״̬</td>
      <td><select name="status">
    	  <option value="0">����</option>
    	  <option value="1">ֹͣ</option>
  	  </select></td>
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
</div>
</body>
</html>
