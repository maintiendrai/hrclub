<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	  <script src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>
<script>
function validator(){
   
   if(document.myform.num.value==""){
    alert("���ֲ���Ϊ�գ�");
    document.myform.num.focus();
    return false;
   }
   if(!isNum(document.myform.num.value)){
    alert("���ֱ���Ϊ������");
   document.myform.num.focus();
    return false;
  } 
   
}
</script>
<title>���ֹ���</title>
</head>

<body>
<%IntegralTO to = (IntegralTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=integraledit&method=edit" onsubmit="return validator(this)">
<input type="hidden" name="hrID"  value="<%=to.getHrID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸Ļ���</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="80">HR�ʺ�</td>
      <td><input type="hidden" name="hrID" value="<%=to.getHrID()%>"/>
          <%=to.getHrID()%>
      </td>
    </tr>
    <tr>
      <td>������</td>
      <td><input type="text" name="num" value="<%=to.getNum()%>"/></td>
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
