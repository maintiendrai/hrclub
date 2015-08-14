<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>资料管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String nameIDs = (String)request.getAttribute("nameIDs");
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
		<td colspan="2"  class="dvInnerHeader"><b>资料列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">上传者ID</td>
        <td width="160"><input type="text" name="nameIDs" style="width:130px"/></td>
		<td width="100">上传者类型</td>
		<td width="100">
		  <select name="kinds">
		    <option value="">请选择</option>
    		<option value="1">HR</option>
    		<option value="3">管理员</option>
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
	<td width="30%">资料名称</td>
	<td width="15%">上传者ID</td>
	<td width="10%">上传者类型</td>
	<td width="10%">下载所需积分</td>
	<td width="15%">文件大小</td>
	<td width="10%">下载</td>
	
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	DocumentTO u = (DocumentTO)it.next();
%>
<tr>
	<td><input type=radio name="documentID" value="<%=u.getDocumentID()%>"></td>
	<td><%=u.getDocumentname()%></td>
	<td><%if (u.getKind()==1) {%>
	     <a href="../hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getNameID()%>" ><%=u.getNameID()%></a>
	    <%} else { %>
	     <a href="../admininfo/admininfo.do?operation=admininfoquery&method=show&adminID=<%=u.getNameID()%>"><%=u.getNameID()%></a>
	    <%} %>
	</td>
	<td><%   switch (u.getKind())
             {
                  case 1:out.println("HR");break;
                  case 2:out.println("IT人才");break;
                  case 3:out.println("管理员");break;
              }%></td>
    <td><%   switch (u.getIntegral())
             {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
              }%></td>
    <td><%=u.getSize()%>KB</td>
    <td><a href="FrontController.do?operation=documentdown&url=<%=u.getUrl()%>">下载</a></td>
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
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value="上传资料" class="button" onclick="add()">
<input type=button  value=" 查看 " class="button" onclick="show()">
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=documentadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=show";
	document.form.submit();
}
function showhr(){
	
	document.form.action="FrontController.do?operation=documentquery&method=showhr&pageNum=1";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentdelete&method=delall";
	document.form.submit();
}
function search(){

	document.form.action="document.do?operation=documentlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>