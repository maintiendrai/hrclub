<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script src="../js/datepicker/WdatePicker.js"></script>
<title>�����</title>
</head>
<body>
<%

Page movementpage = (Page) request.getAttribute("movementpage");
String puttimes = (String)request.getAttribute("puttimes");
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
		<td colspan="2"  class="dvInnerHeader"><b>��б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">����ʱ��</td>
        <td width="180"><input id="puttimes" name="puttimes" type="text" class="Wdate"
			onfocus="new WdatePicker(this)"/></td>
		<td width="100">�״̬</td>
		<td width="100">
		  <select name="statuss">
		  <option value="">��ѡ��</option>
    	  <option value="0">������</option>
    	  <option value="1">��ֹͣ</option>
    	  <option value="2">��ɾ��</option>	
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
	<td width="15%">�����ʱ��</td>
	<td width="15%">���ʼʱ��</td>
	<td width="15%">�����ʱ��</td>
	<td width="12%">�����Ļ���</td>
	<td width="8%">�״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementTO u = (MovementTO)it.next();
%>
<tr>
	<td><input type=radio name="moveID" value="<%=u.getMoveID()%>"></td>
	<td><a href="FrontController.do?operation=movequery&method=show&pageNum=1&moveID=<%=u.getMoveID()%>"><%=u.getSubject()%></a></td>
	<td><%=u.getPuttime()%></td>
	<td><%=u.getStarttime()%></td>
	<td><%=u.getEndtime()%></td>
	<td><%   switch (u.getIntegral())
             {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
              }%>
    </td> 
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("������");break;
                    case 1:out.println("��ֹͣ");break;
                    case 2:out.println("��ɾ��");break;
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
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=1&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" ���� " class="button" onclick="add()">
<input type=button  value=" �޸� " class="button" onclick="edit()">
<input type=button  value=" �鿴 " class="button" onclick="show()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=movementadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.moveID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=movementquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.moveID)){
		alert("��ѡ��Ҫ��ʾ����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=movequery&method=show&pageNum=1";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.moveID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=movementdelete";
	document.form.submit();
}
function search(){

	document.form.action="movement.do?operation=movementlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>