<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>�ʼ�����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>�ʼ��б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="70">������</td>
		<td width="150"><input type="text" name="revIDs" style="width:130px"/></td>	
		<td width="100">����������</td>
		<td width="150">
		  <select name="revkinds">
		  <option value="">��ѡ��</option>
    	  <option value="1">HR</option>
    	  <option value="2">IT�˲�</option>
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
	<td width="25%">�ʼ�����</td>
	<td width="10%">������</td>
	<td width="10%">����������</td>
	<td width="10%">������</td>
	<td width="10%">����������</td>
	<td width="15%">����ʱ��</td>
	<td width="10%">�ʼ�״̬</td>
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
                 case 2:out.println("IT�˲�");break;

              }%></td>
    <td><a href="../admininfo/admininfo.do?operation=admininfoquery&method=show&adminID=<%=u.getSentID()%>"><%=u.getSentID()%></a></td>
    <td>����Ա</td>
    <td><%=u.getTime()%></td>
    <td><%   switch (u.getStatus())
             {
                 case 0:out.println("δ��");break;
                 case 1:out.println("�Ѷ�");break;
                 case 2:out.println("��ɾ��");break;
                             
              }%></td> 
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
	<%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>  
	<td colspan=8 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='mail.do?operation=maillist&revIDs=<%=revIDs%>&revkinds=<%=revkinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value="�����ʼ�" class="button" onclick="add()">
<input type=button  value=" ɾ�� " class="button" onclick="del()">
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
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=mailquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.mailID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
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
		alert("��ѡ��Ҫɾ������Ϣ��");
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