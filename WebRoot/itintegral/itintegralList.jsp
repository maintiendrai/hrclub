<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>���ֹ���</title>
</head>
<body>
<%

Page itintegralpage = (Page) request.getAttribute("itintegralpage");
String itIDs = (String)request.getAttribute("itIDs");
List data = itintegralpage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>IT�˲Ż����б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="90">IT�˲��ʺ�</td>
		<td width="150"><input type="text" name="itIDs" style="width:130px"/></td>	
		<td>
			<input type="button" value=" ��ѯ " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">ѡ��</td>
	<td width="20%">IT�˲��˺�</td>
	<td width="20%">IT�˲�����</td>
	<td width="60%">����</td>
	
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	ItintegralTO u = (ItintegralTO)it.next();
%>
<tr>
	<td><input type=radio name="itID" value="<%=u.getItID()%>"></td>
	<td><a href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getItID()%>"><%=u.getItID()%></a></td>
	<td><%=u.getName()%></td>
	<td><%=u.getNum()%></td>
	
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(itintegralpage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=6 align="center">�� <%=itintegralpage.getPageNum() %>/<%=itintegralpage.getPageCount() %> ҳ  �� <%=itintegralpage.getRecordNum() %>����¼  
	<%if(itintegralpage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='integralList.do?operation=itintegrallist&itIDs=<%=itIDs%>&pageNum=1&pageLength=<%=itintegralpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='integralList.do?operation=itintegrallist&itIDs=<%=itIDs%>&pageNum=<%=itintegralpage.getPageNum()-1 %>&pageLength=<%=itintegralpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(itintegralpage.getPageNum()==itintegralpage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='integralList.do?operation=itintegrallist&itIDs=<%=itIDs%>&pageNum=<%=itintegralpage.getPageNum()+1 %>&pageLength=<%=itintegralpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='integralList.do?operation=itintegrallist&itIDs=<%=itIDs%>&pageNum=<%=itintegralpage.getPageCount() %>&pageLength=<%=itintegralpage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" �޸� " class="button" onclick="edit()">
</td></tr>
</table> 
</form>
<script>
function edit(){

    var itID;
	if(!isChecked(document.form.itID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	for(var i=0;i<document.form.itID.length;i++)
    {
   	   
         if(document.form.itID[i].checked==true)
         {  	
            	itID=document.form.itID[i].value;
         }	
    }
	document.form.action="FrontController.do?operation=itintegraledit&method=editItem&itID="+itID;
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.itID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=itintegralquery";
	document.form.submit();
}
function search(){

	document.form.action="itintegral.do?operation=itintegrallist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>