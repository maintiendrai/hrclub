<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<script type="text/javascript" src="<%=request.getContextPath()%>/document/javascript/prototype.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/document/javascript/AjaxWrapper.js"></script>
<link href="<%=request.getContextPath()%>/document/css/fileUpload.css" type="text/css" rel="stylesheet"/>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<title>�ļ��ϴ�</title>
<SCRIPT>
   
   function validator(){
       
       if(document.fileUploadForm.file.value==""){
         alert("��ѡ���ϴ��ļ���");
         document.fileUploadForm.file.focus();
         return false;
       }
       
       if(document.fileUploadForm.documentname.value==""){
         alert("�������������ƣ�");
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
            <td height="36" valign="top" class="titile">�ϴ�����</td>
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
	<div id="readme">�ϴ���֪:&nbsp;&nbsp;�ļ���󳤶�:10M</div>
	<div id="uploadFileUrl"></div>
	
	<tr><td><br></td></tr>
	<tr>
      <td width="130">ѡ���ļ�</td>
      <td><input type="file" name="file" id="file" style="width:230px" class="btn3"/><br></td>
    </tr>
	
	<tr>
      <td width="130">��������</td>
      <td><input type="text" name="documentname" value="" style="width:230px"/><br></td>
    </tr>
    <tr>
    <td>�����������</td>
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
      <td width="130">�ϴ���ID</td>
      <td><input type="hidden" name="nameID" value="<%=nameID%>"/><%=nameID%><br></td>
    </tr>
    <tr>
    <td>�ϴ�������</td>
      <td><input type="hidden" name="kind" value="1" style="width:230px"/>HR<br></td>
    </tr>
    <tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="uploadButton" id="uploadButton" value="��ʼ�ϴ�" onclick="return validator(this)" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
	    <input type="button" name="cancelUploadButton" id="cancelUploadButton" value="ȡ���ϴ�" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
	    <input type="reset" name="reset" value=" ���� " onclick="history.back();" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
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
  <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>
