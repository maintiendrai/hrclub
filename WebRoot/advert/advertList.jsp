<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<script src="<%=request.getContextPath()%>/js/ParamUtil.js"> </script>
<title>������</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String adnames = (String) request.getAttribute("adnames");
String statuss = (String) request.getAttribute("statuss");
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
		<td colspan="2"  class="dvInnerHeader"><b>����б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">�������</td>
        <td width="180"><input name="adnames" type="text"/></td>
		<td width="100">��Ϣ����</td>
		<td width="130">
		  <select name="statuss">
		    <option value="">��ѡ��</option>  	
    		<option value="0">����</option>  			
    		<option value="1">ֹͣ</option>
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
	<td width="26%">�������</td>
	<td width="27%">�������</td>
	<td width="27%">��վ����</td>
	<td width="10%">״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	AdvertTO u = (AdvertTO)it.next();
%>
<tr>
	<td><input type=radio name="adID" value="<%=u.getAdID()%>"></td>
	<td><a href="FrontController.do?operation=advertquery&adID=<%=u.getAdID()%>"><%=u.getAdname()%></a></td>
	<td><%=u.getAdpurl()%></td>
    <td><%=u.getWeburl()%></td>
    <td><%
           if(u.getStatus()==0) out.print("����");
           if(u.getStatus()==1) out.print("ֹͣ");
        %>
    </td>
</tr>
<%} %>
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
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='advertList.do?operation=advertlist&adnames=<%=adnames%>&statuss=<%=statuss%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
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
	document.form.action="FrontController.do?operation=advertadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.adID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=advertedit&method=editItem";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.adID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=advertquery";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.adID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=advertdelete";
	document.form.submit();
}
function search(){

	document.form.action="FrontController.do?operation=advertlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>