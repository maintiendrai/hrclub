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

Page integralpage = (Page) request.getAttribute("integralpage");
String hrIDs = (String)request.getAttribute("hrIDs");
List data = integralpage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>HR�����б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="70">HR�ʺ�</td>
		<td width="150"><input type="text" name="hrIDs" style="width:130px"/></td>	
		<td>
			<input type="button" value=" ��ѯ " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">ѡ��</td>
	<td width="20%">HR�˺�</td>
	<td width="20%">HR����</td>
	<td width="60%">����</td>
	
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	IntegralTO u = (IntegralTO)it.next();
%>
<tr>
	<td><input type=radio name="hrID" value="<%=u.getHrID()%>"></td>
	<td><a href="hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getHrID()%>" ><%=u.getHrID()%></a></td>
	<td><%=u.getName()%></td>
	<td><%=u.getNum()%></td>
	
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(integralpage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=6 align="center">�� <%=integralpage.getPageNum() %>/<%=integralpage.getPageCount() %> ҳ  �� <%=integralpage.getRecordNum() %>����¼  
	<%if(integralpage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='integralList.do?operation=integrallist&hrIDs=<%=hrIDs%>&pageNum=1&pageLength=<%=integralpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='integralList.do?operation=integrallist&hrIDs=<%=hrIDs%>&pageNum=<%=integralpage.getPageNum()-1 %>&pageLength=<%=integralpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(integralpage.getPageNum()==integralpage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='integralList.do?operation=integrallist&hrIDs=<%=hrIDs%>&pageNum=<%=integralpage.getPageNum()+1 %>&pageLength=<%=integralpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='integralList.do?operation=integrallist&hrIDs=<%=hrIDs%>&pageNum=<%=integralpage.getPageCount() %>&pageLength=<%=integralpage.getPageLength() %>'>ĩҳ</a>
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
function add(){
	document.form.action="integralAdd.jsp";
	document.form.submit();
}
function edit(){

    var hrID;
	if(!isChecked(document.form.hrID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	for(var i=0;i<document.form.hrID.length;i++)
    {
   	   
         if(document.form.hrID[i].checked==true)
         {  	
            	hrID=document.form.hrID[i].value;
         }	
    }
	document.form.action="FrontController.do?operation=integraledit&method=editItem&hrID="+hrID;
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.hrID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=integralquery";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.hrID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=integraldelete";
	document.form.submit();
}
function search(){

	document.form.action="integral.do?operation=integrallist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>