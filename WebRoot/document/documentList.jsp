<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>���Ϲ���</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>�����б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">�ϴ���ID</td>
        <td width="160"><input type="text" name="nameIDs" style="width:130px"/></td>
		<td width="100">�ϴ�������</td>
		<td width="100">
		  <select name="kinds">
		    <option value="">��ѡ��</option>
    		<option value="1">HR</option>
    		<option value="3">����Ա</option>
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
	<td width="30%">��������</td>
	<td width="15%">�ϴ���ID</td>
	<td width="10%">�ϴ�������</td>
	<td width="10%">�����������</td>
	<td width="15%">�ļ���С</td>
	<td width="10%">����</td>
	
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
                  case 2:out.println("IT�˲�");break;
                  case 3:out.println("����Ա");break;
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
    <td><a href="FrontController.do?operation=documentdown&url=<%=u.getUrl()%>">����</a></td>
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
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentlist&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value="�ϴ�����" class="button" onclick="add()">
<input type=button  value=" �鿴 " class="button" onclick="show()">
<input type=button  value=" ɾ�� " class="button" onclick="del()">
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
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.documentID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
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
		alert("��ѡ��Ҫɾ������Ϣ��");
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