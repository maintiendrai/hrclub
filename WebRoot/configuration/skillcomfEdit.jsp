<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.skillame.value==""){
    alert("技能名称不能为空！");
    document.myform.skillame.focus();
    return false;
   }
}
</script>
<title>技能类型配置</title>
</head>

<body>
<%ITskillcomfTO to = (ITskillcomfTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=itskillcomfedit" onsubmit="return validator(this)">
<input type="hidden" name="skilID" value="<%=to.getSkilID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>修改技能</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">

	
	<tr>
		<td width="120">技能名称</td>
		<td><input type="text" name="skillame" value="<%=to.getSkillame()%>" style="width:230px"/></td>	
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