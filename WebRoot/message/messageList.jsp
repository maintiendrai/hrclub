<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<title>��Ϣ����</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>��Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">����ʱ��</td>
        <td width="180"><input id="puttimes" name="puttimes" type="text" class="Wdate"
			onfocus="new WdatePicker(this)"/></td>
		<td width="100">��Ϣ����</td>
		<td width="130">
		  <select name="kinds">
		    <option value="">��ѡ��</option>  	
    		<option value="0">����</option>  			
    		<option value="1">����</option>
    		<option value="2">HR����</option>
    		<option value="3">IT�˲Ź���</option>
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
	<td>ѡ��</td>
	<td>��Ϣ����</td>
	<td>����ʱ��</td>
	<td>��Чʱ��</td>
	<td>ʧЧʱ��</td>
	<td>��Ϣ����</td>
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
                               case 0:out.println("����");break;
                               case 1:out.println("����");break;
                               case 2:out.println("HR����");break;
                               case 3:out.println("IT�˲Ź���");break;
                            }%>
    </td> 
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
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelist&puttimes=<%=puttimes%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" ���� " class="button" onclick="add()">
<input type=button  value=" �޸� " class="button" onclick="edit()">
<input type=button  value=" ɾ�� " class="button" onclick="del()">
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
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=messagequery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.messageID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=messquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.messageID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
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