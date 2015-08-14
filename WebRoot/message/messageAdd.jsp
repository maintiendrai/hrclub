<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<script type="text/javascript"  src="../js/fckeditor.js"></script>
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.subject.value==""){
    alert("主题不能为空！");
    document.myform.subject.focus();
    return false;
   }
   
   if(document.myform.starttime.value==""){
    alert("生效时间不能为空！");
    document.myform.starttime.focus();
    return false;
   }
   
   if(document.myform.endtime.value==""){
    alert("失效时间不能为空！");
    document.myform.endtime.focus();
    return false;
   }
   
   if(document.myform.context.value==""){
    alert("请输入内容！");
    document.myform.context.focus();
    return false;
   }
}
</script>
<title>信息管理</title>
</head>

<body>
<%String puttime =(String) request.getAttribute("puttime");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=messageadd&method=add" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>发布信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">信息主题</td>
      <td><input type="text" name="subject" value="" style="width:230px"/></td>
    </tr>
    <tr>
      <td>信息类型</td>
      <td>   
          <select name="kind">
    			<option value="0">其他</option>  			
    			<option value="1">公告</option>
    			<option value="2">HR公告</option>
    			<option value="3">IT人才公告</option>
  	      </select>
  	  </td>
    </tr>
    <tr>
      <td>发布时间</td>
      <td><input type="hidden" name="puttime" value="<%=puttime%>"/>
          <%=puttime%>
      </td>
    </tr>
    <tr>
      <td>生效时间</td>
      <td><input id="starttime" name="starttime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MAXDATE="$endtime" /></td>
    </tr>
     <tr>
      <td>失效时间</td>
      <td><input id="endtime" name="endtime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MINDATE="$starttime"/></td>
    </tr>
    <tr>
      <td>信息内容</td>
      <td><textarea id="context" name="context" rows=20 cols=60></textarea>
												<script type="text/javascript">
	 var oFCKeditor = new FCKeditor('context') ;
	 oFCKeditor.BasePath = "/hrclub/" ;
	 oFCKeditor.Width = 550;
	 oFCKeditor.Height = 250;
	 oFCKeditor.ToolbarSet = "qunyingnet" ; 
	 oFCKeditor.ReplaceTextarea();
	</script></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 "class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
