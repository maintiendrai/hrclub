<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<script src="<%=request.getContextPath()%>/js/ParamUtil.js"> </script>
<script>
function validator(){
   
   if(document.myform.adname.value==""){
    alert("广告名不能为空！");
    document.myform.adname.focus();
    return false;
   }
   if(document.myform.adpurl.value==""){
    alert("广告链接不能为空！");
    document.myform.adpurl.focus();
    return false;
   }
   if(document.myform.weburl.value==""){
    alert("网站链接不能为空！");
    document.myform.weburl.focus();
    return false;
   }
 
}
</script>
<title>广告管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>添加广告</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="100">广告名称</td>
      <td><input type="text" name="adname" style="width=200"/></td>
    </tr>
    <tr>
      <td>广告链接</td>
      <td><input type="text" name="adpurl" style="width=200"/></td>
    </tr>
    <tr>
      <td>网站链接</td>
      <td><input type="text" name="weburl" style="width=200"/></td>
    </tr>
    <tr>
      <td>状态</td>
      <td><select name="status">
    	  <option value="0">正常</option>
    	  <option value="1">停止</option>
  	  </select></td>
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
</form>
</div>
</body>
</html>
