<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
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
<%AdvertTO to = (AdvertTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=advertedit&method=edit" onsubmit="return validator(this)">
<input type="hidden" name="adID"  value="<%=to.getAdID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸Ĺ��</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
   <tr>
      <td width="100">�������</td>
      <td><input type="text" name="adname" value="<%=to.getAdname()%>" style="width=200"/></td>
    </tr>
    <tr>
      <td>�������</td>
      <td><input type="text" name="adpurl" value="<%=to.getAdpurl()%>" style="width=200"/></td>
    </tr>
    <tr>
      <td>��վ����</td>
      <td><input type="text" name="weburl" value="<%=to.getWeburl()%>" style="width=200"/></td>
    </tr>
    <tr>
      <td>״̬</td>
      <td><select name="status">
    	  <option value="0" <%if(to.getStatus()==0) out.print("selected");%>>����</option>
    	  <option value="1" <%if(to.getStatus()==0) out.print("selected");%>>ֹͣ</option>
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
</body>
</html>
