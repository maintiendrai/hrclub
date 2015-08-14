<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="com.hrclub.sample.upload.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="<%=request.getContextPath()%>/css/fileUpload.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<title>文件上传结果</title>
</head>
<body>
<form name="form"  action="" method=post>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>上传结果</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<%
	
	FileUploadStatus fUploadStatus=BackGroundService.getStatusBean(request);

	for(int i=0;i<fUploadStatus.getUploadFileUrlList().size();i++){
		String fileName=(String)fUploadStatus.getUploadFileUrlList().get(i);
		int kind = fUploadStatus.getKind();
		String nameID = fUploadStatus.getNameID();
//		String url=fUploadStatus.getBaseDir()+"/"+fileName;
      
	%>
		<div><%=fileName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;上传成功!</div>
		<input type=hidden name="kind" value="<%=kind%>" />
	<%
	}

	%>
        <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>   
      <td colspan="2">
        <input type="reset" name="reset" value="继续上传" class="button" onclick="add()">
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="show()">
      </td>
    </tr>
</table>
</form>
</body>
<script>
function add(){
    if(document.form.kind.value=="3"){
	   document.form.action="FrontController.do?operation=documentadd&method=addItem";
	} 
    if(document.form.kind.value=="1"){
	   document.form.action="FrontController.do?operation=documentadd&method=addItemHr";
	}
	document.form.submit();
}
function show(){
	if(document.form.kind.value=="3"){
	   document.form.action="FrontController.do?operation=documentlist&pageNum=1";
	} 
    if(document.form.kind.value=="1"){
	   document.form.action="FrontController.do?operation=documentquery&method=showhr&pageNum=1";
	}
	document.form.submit();
}

</script>
</html>