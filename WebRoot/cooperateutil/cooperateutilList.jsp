<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>��λ��Ϣ����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>��λ��Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">��λ����</td>
        <td width="210"><input type="text" name="utilnames" style="width:180px"/></td>
		<td width="100">��λ����</td>
		<td width="80">
		  <select name="utilkinds">
		      <option value="">��ѡ��</option>
    		  <option value="0">��ҵ</option>
    		  <option value="1">����</option>
  		   </select>
    	</td>	
		<td>
			<input type="button" value=" ��ѯ " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">ѡ��</td>
	<td width="25%">��λ����</td>
	<td width="28%">��ϵ��ַ</td>
	<td width="10%">��ϵ��</td>
	<td width="17%">��ϵ�绰</td>
	<td width="10%">��λ����</td>
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
	<td>��ҵ</td>
<%  }else {%>
    <td>����</td>
<%} %>
</tr>
<%
}
%>
<tr><td><br></td></tr>
<tr>
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=6 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='cooperateutilList.do?operation=cooperateutillist&utilnames=<%=utilnames%>&utilkinds=<%=utilkinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
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
	document.form.action="FrontController.do?operation=cooperateutiladd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.utilID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=cooperateutilquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.utilID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=cooperateutilquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.utilID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
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