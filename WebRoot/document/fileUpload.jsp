<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script type="text/javascript" src="./javascript/prototype.js"></script>
<script type="text/javascript" src="./javascript/AjaxWrapper.js"></script>
<link href="./css/fileUpload.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>�ļ��ϴ�</title>

</head>
<body>
<div  id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<div id="readme">�ϴ���֪:&nbsp;&nbsp;����ϴ���:100M�������ļ���󳤶�:100M</div>
	<div id="uploadFileUrl"></div>
	
	<form id="fileUploadForm" name="fileUploadForm" action="./BackGroundService.action" 
		enctype="multipart/form-data" method="post">
	
	
	<tr>
      <td width="130">ѡ���ļ�</td>
      <td><input type="file" name="file" id="file" style="width:230px" class="btn3"/><br></td>
    </tr>
	
	<tr>
      <td width="130">��������</td>
      <td><input type="text" name="documentname" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
      <td width="130">�ϴ���ID</td>
      <td><input type="text" name="nameID" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
    <td>�ϴ�������</td>
      <td><input type="text" name="kind" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
    <td>�����������</td>
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
        <input type="submit" name="uploadButton" id="uploadButton" class="button" value="��ʼ�ϴ�"/>
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" class="button" value="ȡ���ϴ�"/>
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

//ˢ���ϴ�״̬
function refreshUploadStatus(){
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'uploadStatus=',
		function(responseText){
				eval("uploadInfo = " + responseText);
				var progressPercent = Math.ceil(
					(uploadInfo.ReadTotalSize) / uploadInfo.UploadTotalSize * 100);
	
				$('progressBarText').innerHTML = ' �ϴ��������: '+progressPercent+'% '+
					' ���ڴ����'+uploadInfo.CurrentUploadFileNum+'���ļ�';
				$('progressStatusText').innerHTML='';
				$('totalProgressBarBoxContent').style.width = parseInt(progressPercent * 3.5) + 'px';
		}
	);
}
//�ϴ�����
function startProgress(){
	Element.show('progressBar');
    $('progressBarText').innerHTML = '�ϴ��������: 0%';
    $('progressStatusText').innerHTML='';
    $('uploadButton').disabled = true;
    var periodicalExe=new PeriodicalExecuter(refreshUploadStatus,0.5);
    return true;
}
//ȡ���ϴ�����
function cancelProgress(){
	$('cancelUploadButton').disabled = true;
	var ajaxW = new AjaxWrapper(false);
	ajaxW.putRequest(
		'./BackGroundService.action',
		'cancelUpload=true',
		//��Ϊform���ύ������ܲ���ִ��
		function(responseText){
			eval("uploadInfo = " + responseText);
			$('progressStatusText').innerHTML='����״̬:  '+uploadInfo.status;
			if (msgInfo.cancel=='true'){
				alert('ɾ���ɹ�!');
				window.location.reload();
			};
		}
	);
}
</script>
</body>
</html>