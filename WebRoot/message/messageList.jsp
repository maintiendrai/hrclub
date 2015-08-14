<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<title>信息管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String puttimes = (String)request.getAttribute("puttimes");
String kinds = (String)request.getAttribute("kinds");
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
		<td colspan="2"  class="dvInnerHeader"><b>信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">发布时间</td>
        <td width="180"><input id="puttimes" name="puttimes" type="text" class="Wdate"
			onfocus="new WdatePicker(this)"/></td>
		<td width="100">信息类型</td>
		<td width="130">
		  <select name="kinds">
		    <option value="">请选择</option>  	
    		<option value="0">其他</option>  			
    		<option value="1">公告</option>
    		<option value="2">HR公告</option>
    		<option value="3">IT人才公告</option>
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
	<td>选择</td>
	<td>信息主题</td>
	<td>发布时间</td>
	<td>生效时间</td>
	<td>失效时间</td>
	<td>信息类型</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MessageTO u = (MessageTO)it.next();
%>
<tr>
	<td><input type=radio name="messageID" value="<%=u.getMessageID()%>"></td>
	<td><a href="FrontController.do?operation=messquery&method=show&messageID=<%=u.getMessageID()%>"><%=u.getSubject()%></a></td>
	<td><%=u.getPuttime()%></td>
	<td><%=u.getStarttime()%></td>
    <td><%=u.getEndtime()%></td>
    <td><%   switch (u.getKind())
                            {
                               case 0:out.println("其他");break;
                               case 1:out.println("公告");break;
                               case 2:out.println("HR公告");break;
                               case 3:out.println("IT人才公告");break;
                            }%>
    </td> 
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
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 发布 " class="button" onclick="add()">
<input type=button  value=" 修改 " class="button" onclick="edit()">
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=messageadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.messageID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=messagequery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.messageID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=messquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.messageID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=messagedelete";
	document.form.submit();
}
function search(){

	document.form.action="message.do?operation=messagelist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>