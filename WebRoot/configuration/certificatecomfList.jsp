<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>֤����������</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>֤�������б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">֤������</td>
		<td width="150"><input type="text" name="certificatename" value="" style="width:130px"/></td>	
		<td>
			<input type="button" value=" ��ѯ " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">ѡ��</td>
	<td width="20%">֤������</td>
	<td width="20%">֤������</td>
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
                    case 0:out.println("����");break;
                    case 1:out.println("�����");break;
                    case 2:out.println("����");break;
                    case 3:out.println("����");break;
                    case 4:out.println("ְ��");break;
              }%></td>
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
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='certificatecomflist.do?operation=certificatecomflist&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
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
	document.form.action="FrontController.do?operation=certificatecomfadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.certificateID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=certificatecomfquery&method=edit";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.certificateID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=certificatecomfdelete";
	document.form.submit();
}
function search(){
	if(document.form.certificatename.value==""){
		alert("������Ҫ��ѯ���ֶΣ�");
		return false;
	}
	document.form.action="certificatecomf.do?operation=certificatecomflist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>