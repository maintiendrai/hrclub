<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script type="text/javascript" src="./javascript/prototype.js"></script>
<script type="text/javascript" src="./javascript/AjaxWrapper.js"></script>
<link href="./css/fileUpload.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>文件上传</title>

</head>
<body>
<div  id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<div id="readme">上传需知:&nbsp;&nbsp;最大上传量:100M，单个文件最大长度:100M</div>
	<div id="uploadFileUrl"></div>
	
	<form id="fileUploadForm" name="fileUploadForm" action="./BackGroundService.action" 
		enctype="multipart/form-data" method="post">
	
	
	<tr>
      <td width="130">选择文件</td>
      <td><input type="file" name="file" id="file" style="width:230px" class="btn3"/><br></td>
    </tr>
	
	<tr>
      <td width="130">资料名称</td>
      <td><input type="text" name="documentname" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
      <td width="130">上传者ID</td>
      <td><input type="text" name="nameID" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
    <td>上传者类型</td>
      <td><input type="text" name="kind" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
    <td>下载所需积分</td>
      <td><select name="integral" style="width:230px">
    	  <option value="0">5</option>
    	  <option value="1">10</option>
    	  <option value="2">15</option>
    	  <option value="3">20</option>
    	  <option value="4">25</option>
    	  <option value="5">30</option>
  	  </select></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="uploadButton" id="uploadButton" class="button" value="开始上传"/>
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" class="button" value="取消上传"/>
      </td>
    </tr>
</table>

	
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
</div>

</form>

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