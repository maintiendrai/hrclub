<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>����Ա����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>����Ա��Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">ѡ��</td>
	<td width="20%">����Ա�˺�</td>
	<td width="20%">����</td>
	<td width="60%">��ɫ</td>
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
	<td>����Ա</td>
<%  }else {%>
    <td>��������Ա</td>
<%} %>
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=5 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='admininfoList.do?operation=admininfolist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='admininfoList.do?operation=admininfolist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='admininfoList.do?operation=admininfolist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='admininfoList.do?operation=admininfolist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" ���� " onclick="add()" class="button">
<input type=button  value=" �޸� " onclick="edit()" class="button">
<input type=button  value=" ɾ�� " onclick="del()" class="button">
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
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=admininfoquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.adminID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=admininfoquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.adminID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=admininfodelete";
	document.form.submit();
}
</script>
</body>
</html>