<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<script src="<%=request.getContextPath()%>/js/ParamUtil.js"> </script>
<title>广告管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String adnames = (String) request.getAttribute("adnames");
String statuss = (String) request.getAttribute("statuss");
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
		<td colspan="2"  class="dvInnerHeader"><b>广告列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">广告名称</td>
        <td width="180"><input name="adnames" type="text"/></td>
		<td width="100">信息类型</td>
		<td width="130">
		  <select name="statuss">
		    <option value="">请选择</option>  	
    		<option value="0">正常</option>  			
    		<option value="1">停止</option>
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
	<td width="26%">广告名称</td>
	<td width="27%">广告链接</td>
	<td width="27%">网站链接</td>
	<td width="10%">状态</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	AdvertTO u = (AdvertTO)it.next();
%>
<tr>
	<td><input type=radio name="adID" value="<%=u.getAdID()%>"></td>
	<td><a href="FrontController.do?operation=advertquery&adID=<%=u.getAdID()%>"><%=u.getAdname()%></a></td>
	<td><%=u.getAdpurl()%></td>
    <td><%=u.getWeburl()%></td>
    <td><%
           if(u.getStatus()==0) out.print("正常");
           if(u.getStatus()==1) out.print("停止");
        %>
    </td>
</tr>
<%} %>
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
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
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
	document.form.action="FrontController.do?operation=advertadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.adID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=advertedit&method=editItem";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.adID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=advertquery";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.adID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=advertdelete";
	document.form.submit();
}
function search(){

	document.form.action="FrontController.do?operation=advertlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>