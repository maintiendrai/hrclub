<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script src="../js/datepicker/WdatePicker.js"></script>
<title>���񶩵�����</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String hrIDs = (String)request.getAttribute("hrIDs");
String kinds = (String)request.getAttribute("kinds");
String statuss = (String)request.getAttribute("statuss");
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
		<td colspan="2"  class="dvInnerHeader"><b>���񶩵��б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>    
        <td width="100">�������˺�</td>
        <td width="150"><input type="text" name="hrIDs" style="width:130px"/></td>
		<td width="100">��������</td>
		<td width="120">
		  <select name="kinds">
		     <option value="">��ѡ��</option>
    		 <option value="0">����</option>
    		 <option value="1">��ҵ����</option>
    		 <option value="2">��ѵ����</option>
    		 <option value="3">������</option>
    		 <option value="4">������ǲ</option>
    		 <option value="5">��ͷ</option>
  		   </select>
    	</td>
    	<td width="100">����״̬</td>
		<td width="110">
		  <select name="statuss">
		        <option value="">��ѡ��</option>
    			<option value="0">δ����</option>
    			<option value="1">�Ѵ���</option>
    			<option value="2">��ɾ��</option>
    			<option value="3">������</option>
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
	<td width="25%">��������</td>
	<td width="10%">�������˺�</td>
	<td width="10%">����������</td>
	<td width="15%">����ʱ��</td>	
	<td width="10%">��������</td>
	<td width="10%">����״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	ServerorderTO u = (ServerorderTO)it.next();
%>
<tr>
	<td><input type=radio name="orderID" value="<%=u.getOderID()%>"></td>
	<td><a href="FrontController.do?operation=serverquery&orderID=<%=u.getOderID()%>"><%=u.getOrdertitle()%></a></td>
	<td><a href="hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getHrID()%>" ><%=u.getHrID()%></a></td>
	<td><%=u.getName()%></td>
	<td><%=u.getBuytime()%></td>
    <td><%   switch(u.getKind())
             {
                     case 0:out.println("����");break;
                     case 1:out.println("��ҵ����");break;
                     case 2:out.println("��ѵ����");break;
                     case 3:out.println("������");break;
                     case 4:out.println("������ǲ");break;
                     case 5:out.println("��ͷ");break;         
             }%></td>
    <td><%   switch(u.getStatus())
             {
                     case 0:out.println("δ����");break;
                     case 1:out.println("�Ѵ���");break;
                     case 2:out.println("��ɾ��");break;
                     case 3:out.println("������");break; 
              }%></td>
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
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" �޸� " class="button" onclick="edit()">
<input type=button  value=" ɾ�� " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=serverorderadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.orderID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderedit&method=editItem";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.orderID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=serverquery";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.orderID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderdelete&method=delall";
	document.form.submit();
}
function search(){

	document.form.action="serverorder.do?operation=serverorderlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>