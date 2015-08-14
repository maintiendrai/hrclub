<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>邮件管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String revIDs = (String)request.getAttribute("revIDs");
String revkinds = (String)request.getAttribute("revkinds");
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
		<td colspan="2"  class="dvInnerHeader"><b>邮件列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="70">接收人</td>
		<td width="150"><input type="text" name="revIDs" style="width:130px"/></td>	
		<td width="100">接收人类型</td>
		<td width="150">
		  <select name="revkinds">
		  <option value="">请选择</option>
    	  <option value="1">HR</option>
    	  <option value="2">IT人才</option>
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
	<td width="25%">邮件主题</td>
	<td width="10%">接收人</td>
	<td width="10%">接收人类型</td>
	<td width="10%">发送人</td>
	<td width="10%">发送人类型</td>
	<td width="15%">发送时间</td>
	<td width="10%">邮件状态</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MailTO u = (MailTO)it.next();
%>
<tr>
	<td><input type=radio name="mailID" value="<%=u.getMailID()%>"></td>
	<td><a href="FrontController.do?operation=mailquery&method=show&mailID=<%=u.getMailID()%>"><%=u.getSubject()%></a></td>
	<td><%if (u.getRevkind()==1) {%>
	     <a href="../hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getRevID()%>" ><%=u.getRevID()%></a>
	    <%} else { %>
	     <a href="../it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getRevID()%>"><%=u.getRevID()%></a>
	    <%} %>
	</td>
	<td><%   switch (u.getRevkind())
             {
                 case 1:out.println("HR");break;
                 case 2:out.println("IT人才");break;

              }%></td>
    <td><a href="../admininfo/admininfo.do?operation=admininfoquery&method=show&adminID=<%=u.getSentID()%>"><%=u.getSentID()%></a></td>
    <td>管理员</td>
    <td><%=u.getTime()%></td>
    <td><%   switch (u.getStatus())
             {
                 case 0:out.println("未读");break;
                 case 1:out.println("已读");break;
                 case 2:out.println("已删除");break;
                             
              }%></td> 
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
	<%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>  
	<td colspan=8 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value="发送邮件" class="button" onclick="add()">
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=mailadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.mailID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=mailquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.mailID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=mailquery&method=show";
	document.form.submit();
}
function showone(){
	
	document.form.action="FrontController.do?operation=mailquery&method=showone&pageNum=1&revkind=1&revID=2008001";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.mailID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=maildelete";
	document.form.submit();
}
function search(){
	
	document.form.action="mail.do?operation=maillist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>