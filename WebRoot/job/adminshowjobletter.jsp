<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<title>��Ƹ��Ϣ����</title>
</head>
<%
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
%>

<body>

<form name="form1" method="post" action="itmanger.do">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>��ְ��Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
			
				<td>��ְ��Ա</td>
			
				<td >�鿴ӦƸ����Ϣ</td>
			</tr>
<%
	
Iterator it = data.iterator();
String jobID=null;
while(it.hasNext()){
	JobletterTO u = (JobletterTO)it.next();
	jobID=u.getJobID();
%>
		
			<tr>
			    
			   
				<td>
					<%=u.getUserID() %>
				</td>
				
				<td>
			<a href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getUserID()%>">�鿴ӦƸ����Ϣ</a>
			</td>
			</tr>
			<%}%>	
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
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td>     <input type="reset" name="reset" value=" ���� " class="button"   onclick="history.back();"></td>
</tr>
</table>
 </form>

<script>

function delleter(){
	if(!isChecked(document.form1.letterID)){
		alert("��ѡ��Ҫɾ������ְ�ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=delleter";
	document.form1.submit();
}
</script>
</body>


