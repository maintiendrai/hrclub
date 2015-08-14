<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>技能类型配置</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>技能类型列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">技能名称</td>
		<td width="150"><input type="text" name="skillame" value="" style="width:130px"/></td>	
		<td>
			<input type="button" value=" 查询 " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">选择</td>
	<td width="20%">技能名称</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	ITskillcomfTO u = (ITskillcomfTO)it.next();
%>
<tr>
	<td><input type=radio name="skilID" value="<%=u.getSkilID()%>"></td>
	<td><%=u.getSkillame()%></td>
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
	<a href='itskillcomflist.do?operation=itskillcomflist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='itskillcomflist.do?operation=itskillcomflist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
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
	document.form.action="FrontController.do?operation=itskillcomfadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.skilID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=itskillcomfquery&method=edit";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.skilID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=itskillcomfdelete";
	document.form.submit();
}
function search(){
	if(document.form.skillame.value==""){
		alert("请输入要查询的字段！");
		return false;
	}
	document.form.action="skillcomf.do?operation=itskillcomflist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>