<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<script src="../js/ParamUtil.js"></script>
<title>������߹���</title>
</head>

<body>
<%String starttime =(String) request.getAttribute("starttime");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=movementactoradd&method=add">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>����</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>����</td>
      <td><input type="text" name="moveID" style="width:130px"/></td>
    </tr>
    <tr>
      <td width="130">�����߱��</td>
      <td><input type="text" name="memberID" style="width:130px"/></td>
    </tr>
     <tr>
      <td width="130">����������</td>
      <td><input type="text" name="kind" style="width:130px"/></td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><input type="hidden" name="starttime" value="<%=starttime%>"/>
          <%=starttime%>
      </td>
    </tr>
    <tr>
      <td>״̬</td>
      <td><input type="hidden" name="status" value="0"/>
          <%out.print("�ѱ���");%>
  	  </td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="6">
        <input type="submit" name="Submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
