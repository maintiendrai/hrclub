<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>管理员管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>管理员信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">选择</td>
	<td width="20%">管理员账号</td>
	<td width="20%">姓名</td>
	<td width="60%">角色</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	AdmininfoTO u = (AdmininfoTO)it.next();
%>
<tr>
	<td><input type=radio name="adminID" value="<%=u.getAdminID()%>"></td>
	<td><a href="FrontController.do?operation=admininfoquery&method=show&adminID=<%=u.getAdminID()%>"><%=u.getAdminID()%></a></td>
	<td><%=u.getAdminname()%></td>
<%  if(u.getRole()==1){ %>	
	<td>管理员</td>
<%  }else {%>
    <td>超级管理员</td>
<%} %>
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
	<a href='admininfoList.do?operation=admininfolist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='admininfoList.do?operation=admininfolist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='admininfoList.do?operation=admininfolist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='admininfoList.do?operation=admininfolist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
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
	document.form.action="FrontController.do?operation=admininfoadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.adminID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=admininfoquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.adminID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=admininfoquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.adminID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=admininfodelete";
	document.form.submit();
}
</script>
</body>
</html>