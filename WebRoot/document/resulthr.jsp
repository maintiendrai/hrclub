<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="com.hrclub.sample.upload.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="<%=request.getContextPath()%>/css/fileUpload.css" type="text/css" rel="stylesheet"/>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>�ļ��ϴ����</title>
</head>
<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
<table align="center" width="700">
 <tr>
   <td width="100"  valign="top">	<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="600" valign="top">
   
			<table width="600"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">������Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">

<form name="form"  action="" method=post>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�ϴ����</b></td>
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
		<div><%=fileName%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�ϴ��ɹ�!</div>
		<input type=hidden name="kind" value="<%=kind%>" />
	<%
	}

	%>
        <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>   
      <td colspan="2">
        <input type="reset" name="reset" value="�����ϴ�"  class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  onclick="add()">
        <input type="reset" name="reset" value=" ���� " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  onclick="show()">
      </td>
    </tr>
</table>
</form>
	<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
			</td>
			</tr>
			</table>
			</td>
			</tr>
			</table>
			
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
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