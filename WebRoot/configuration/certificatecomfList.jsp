<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>证书类型配置</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
List data = mypage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>证书类型列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">证书名称</td>
		<td width="150"><input type="text" name="certificatename" value="" style="width:130px"/></td>	
		<td>
			<input type="button" value=" 查询 " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">选择</td>
	<td width="20%">证书名称</td>
	<td width="20%">证书类型</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	CertificateComfTO u = (CertificateComfTO)it.next();
%>
<tr>
	<td><input type=radio name="certificateID" value="<%=u.getCertificateID()%>"></td>
	<td><%=u.getCertificatename()%></td>
	<td><%   switch (u.getKind())
             {
                    case 0:out.println("其他");break;
                    case 1:out.println("计算机");break;
                    case 2:out.println("外语");break;
                    case 3:out.println("管理");break;
                    case 4:out.println("职称");break;
              }%></td>
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=5 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 增加 " onclick="add()" class="button">
<input type=button  value=" 修改 " onclick="edit()" class="button">
<input type=button  value=" 删除 " onclick="del()" class="button">
</td></tr>
</table>
</div>
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=certificatecomfadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.certificateID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=certificatecomfquery&method=edit";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.certificateID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=certificatecomfdelete";
	document.form.submit();
}
function search(){
	if(document.form.certificatename.value==""){
		alert("请输入要查询的字段！");
		return false;
	}
	document.form.action="certificatecomf.do?operation=certificatecomflist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>