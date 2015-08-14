<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script type="text/javascript" src="<%=request.getContextPath()%>/document/javascript/prototype.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/document/javascript/AjaxWrapper.js"></script>
<link href="<%=request.getContextPath()%>/document/css/fileUpload.css" type="text/css" rel="stylesheet"/>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

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
  String nameID =(String) session.getAttribute("hrID");
%>


	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
			
			<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
				
				</td>
				<td width="600"  valign="top">
					<table width="600"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">上传资料</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
<div  id="contentborder" align="center">
<form id="fileUploadForm" name="fileUploadForm" action="./BackGroundService.action" 
		enctype="multipart/form-data" method="post" onsubmit="return validator(this)"> 

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
      <td><input type="hidden" name="kind" value="1" style="width:230px"/>HR<br></td>
    </tr>
    <tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="uploadButton" id="uploadButton" value="开始上传" onclick="return validator(this)" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" value="取消上传" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
	    <input type="reset" name="reset" value=" 返回 " onclick="history.back();" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
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
	<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
</form>
</div>
</td>
</tr>
</table>


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
  <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>
