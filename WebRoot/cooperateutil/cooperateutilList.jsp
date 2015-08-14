<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>单位信息管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String utilnames = (String)request.getAttribute("utilnames");
String utilkinds = (String)request.getAttribute("utilkinds");
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
		<td colspan="2"  class="dvInnerHeader"><b>单位信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">单位名称</td>
        <td width="210"><input type="text" name="utilnames" style="width:180px"/></td>
		<td width="100">单位类型</td>
		<td width="80">
		  <select name="utilkinds">
		      <option value="">请选择</option>
    		  <option value="0">企业</option>
    		  <option value="1">个人</option>
  		   </select>
    	</td>	
		<td>
			<input type="button" value=" 查询 " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">选择</td>
	<td width="25%">单位名称</td>
	<td width="28%">联系地址</td>
	<td width="10%">联系人</td>
	<td width="17%">联系电话</td>
	<td width="10%">单位类型</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	CooperateutilTO u = (CooperateutilTO)it.next();

%>
<tr>
	<td><input type=radio name="utilID" value="<%=u.getUtilID()%>"></td>
	<td><a href="FrontController.do?operation=cooperateutilquery&method=show&utilID=<%=u.getUtilID()%>"><%=u.getUtilname()%></a></td>
	<td><%=u.getAddress()%></td> 
	<td><%=u.getContactname()%></td>
	<td><%=u.getTelephone()%></td> 
<%  if(u.getUtilkind()==0){ %>	
	<td>企业</td>
<%  }else {%>
    <td>个人</td>
<%} %>
</tr>
<%
}
%>
<tr><td><br></td></tr>
<tr>
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
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
	document.form.action="FrontController.do?operation=cooperateutiladd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.utilID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=cooperateutilquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.utilID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=cooperateutilquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.utilID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=cooperateutildelete";
	document.form.submit();
}
function search(){

	document.form.action="cooperateutil.do?operation=cooperateutillist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>