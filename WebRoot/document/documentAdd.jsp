<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script type="text/javascript" src="../document/javascript/prototype.js"></script>
<script type="text/javascript" src="../document/javascript/AjaxWrapper.js"></script>
<link href="../document/css/fileUpload.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>文件上传</title>
<SCRIPT>
   
   function validator(){
       
       if(document.fileUploadForm.file.value==""){
         alert("请选择上传文件！");
         document.fileUploadForm.file.focus();
         return false;
       }
       
       if(document.fileUploadForm.documentname.value==""){
         alert("请输入资料名称！");
         document.fileUploadForm.documentname.focus();
         return false;
       }
       
       var documentname = fileUploadForm.documentname.value;
       var nameID = fileUploadForm.nameID.value;
       var kind = fileUploadForm.kind.value;
       var integral = fileUploadForm.integral.value;

       fileUploadForm.action="./BackGroundService.action?documentname="+documentname+"&nameID="+nameID+"&kind="+kind+"&integral="+integral;
       
   }
</SCRIPT>

</head>
<body>
<%
  String nameID =(String) session.getAttribute("adminuserid");
%>
<div  id="contentborder" align="center">
<form id="fileUploadForm" name="fileUploadForm" action="./BackGroundService.action" 
		enctype="multipart/form-data" method="post" onsubmit="return validator(this)"> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>上传资料</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<div id="readme">上传需知:&nbsp;&nbsp;文件最大长度:10M</div>
	<div id="uploadFileUrl"></div>
	
	<tr><td><br></td></tr>
	<tr>
      <td width="130">选择文件</td>
      <td><input type="file" name="file" id="file" style="width:230px" class="btn3"/><br></td>
    </tr>
	
	<tr>
      <td width="130">资料名称</td>
      <td><input type="text" name="documentname" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
    <td>下载所需积分</td>
    <td><select name="integral" style="width:50px">
    	  <option value="5">5</option>
    	  <option value="10">10</option>
    	  <option value="15">15</option>
    	  <option value="20">20</option>
    	  <option value="25">25</option>
    	  <option value="30">30</option>
  	  </select></td>
    </tr>
    <tr>
      <td width="130">上传者ID</td>
      <td><input type="hidden" name="nameID" value="<%=nameID%>"/><%=nameID%><br></td>
    </tr>
    <tr>
    <td>上传者类型</td>
      <td><input type="hidden" name="kind" value="3" style="width:230px"/>管理员<br></td>
    </tr>
    <tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="uploadButton" id="uploadButton" class="button" value="开始上传" onclick="return validator(this)"/>
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" class="button" value="取消上传"/>
	    <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
      </td>
    </tr>
    <div id="progressBar">
	<div id="theMeter">
    	<div id="progressBarText"></div>
	        <div id="totalProgressBarBox">
	        	<div id="totalProgressBarBoxContent"></div>
	        </div>
        </div>
        <div id="progressStatusText"></div>
   </div>
</table>
</form>
</div>



<script>
Element.hide('progressBar');
Event.observe('fileUploadForm','submit',startProgress,false);
Event.observe('cancelUploadButton','click',cancelProgress,false);

//刷新上传状态
function refreshUploadStatus(){
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'uploadStatus=',
		function(responseText){
				eval("uploadInfo = " + responseText);
				var progressPercent = Math.ceil(
					(uploadInfo.ReadTotalSize) / uploadInfo.UploadTotalSize * 100);
	
				$('progressBarText').innerHTML = ' 上传处理进度: '+progressPercent+'% '+
					' 正在处理第'+uploadInfo.CurrentUploadFileNum+'个文件';
				$('progressStatusText').innerHTML='';
				$('totalProgressBarBoxContent').style.width = parseInt(progressPercent * 3.5) + 'px';
		}
	);
}
//上传处理
function startProgress(){
	Element.show('progressBar');
    $('progressBarText').innerHTML = '上传处理进度: 0%';
    $('progressStatusText').innerHTML='';
    $('uploadButton').disabled = true;
    var periodicalExe=new PeriodicalExecuter(refreshUploadStatus,0.5);
    return true;
}
//取消上传处理
function cancelProgress(){
	$('cancelUploadButton').disabled = true;
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'cancelUpload=true',
		//因为form的提交，这可能不会执行
		function(responseText){
			eval("uploadInfo = " + responseText);
			$('progressStatusText').innerHTML='反馈状态:  '+uploadInfo.status;
			if (msgInfo.cancel=='true'){
				alert('删除成功!');
				window.location.reload();
			};
		}
	);
}
</script>
</body>
</html>
