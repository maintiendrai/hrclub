<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<title>�����߹���</title>
</head>
<body>
<%

Page movementpage = (Page) request.getAttribute("page");
String memberIDs = (String)request.getAttribute("memberIDs");
String kinds = (String)request.getAttribute("kinds");
String statuss = (String)request.getAttribute("statuss");
List data = movementpage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�������б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">�������˺�</td>
        <td width="150"><input type="text" name="memberIDs" style="width:130px"/></td>
		<td width="100">����������</td>
		<td width="120">
		  <select name="kinds">
		     <option value="">��ѡ��</option>
    		 <option value="1">HR</option>
    		 <option value="2">IT�˲�</option>
  		   </select>
    	</td>
    	<td width="100">������״̬</td>
		<td width="110">
		  <select name="statuss">
		        <option value="">��ѡ��</option>
    			<option value="0">�ѱ���</option>
    			<option value="1">����׼</option>
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
	<td width="25%">�����</td>
	<td width="15%">������</td>
	<td width="15%">����������</td>
	<td width="20%">����ʱ��</td>
	<td width="10%">������״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementactorTO u = (MovementactorTO)it.next();
%>
<tr>
	<td><input type=checkbox name="maID" value="<%=u.getMaID()%>"></td>
	<td><%=u.getTitle()%></td>
	<td><%if (u.getKind()==1) {%>
	     <a href="../hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getMemberID()%>" ><%=u.getMemberID()%></a>
	    <%} else { %>
	     <a href="../it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getMemberID()%>"><%=u.getMemberID()%></a>
	    <%} %>
	</td>
	<td><%   switch (u.getKind())
             {
                    case 1:out.println("HR");break;
                    case 2:out.println("IT�˲�");break;
              }%>
	</td>
	<td><%=u.getStarttime()%></td>
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("�ѱ���");break;
                    case 1:out.println("����׼");break;
              }%>
    </td> 
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(movementpage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=8 align="center">�� <%=movementpage.getPageNum() %>/<%=movementpage.getPageCount() %> ҳ  �� <%=movementpage.getRecordNum() %>����¼  
	<%if(movementpage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=1&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" ���� " class="button" onclick="change()">
<input type=button  value=" ɾ�� " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=movementactoradd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.maID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=movementactorquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.maID)){
		alert("��ѡ��Ҫ��ʾ����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=movementactorquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.maID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=movementactordelete";
	document.form.submit();
}
function change(){
	if(!isChecked(document.form.maID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=statuschange";
	document.form.submit();
}
function search(){

	document.form.action="movementactor.do?operation=movementactorlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>