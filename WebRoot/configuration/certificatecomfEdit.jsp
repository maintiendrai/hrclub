<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.certificatename.value==""){
    alert("证书名称不能为空！");
    document.myform.certificatename.focus();
    return false;
   }
}
</script>
<title>证书类型配置</title>
</head>

<body>
<%CertificateComfTO to = (CertificateComfTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=certificatecomfedit" onsubmit="return validator(this)">
<input type="hidden" name="certificateID" value="<%=to.getCertificateID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>添加证书</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">

	
	<tr>
		<td width="120">证书名称</td>
		<td><input type="text" name="certificatename" value="<%=to.getCertificatename()%>" style="width:230px"/></td>	
	</tr>
	
	<tr>
		<td width="120">证书类型</td>
		<td><select name="kind">
            <option value="0" <% if(to.getKind()==0) out.print("selected");%>>其他</option>
    	    <option value="1" <% if(to.getKind()==1) out.print("selected");%>>计算机</option>
    	    <option value="2" <% if(to.getKind()==2) out.print("selected");%>>外语</option>
    	    <option value="3" <% if(to.getKind()==3) out.print("selected");%>>管理</option>
    	    <option value="4" <% if(to.getKind()==4) out.print("selected");%>>职称</option>
  	        </select>
		</td>	
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