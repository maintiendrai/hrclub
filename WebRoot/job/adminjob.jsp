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
		<td colspan="2"  class="dvInnerHeader"><b>��Ƹ��Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
				<td width="49">ѡ��</td>
				<td width="143">ְλ����</td>
				<td width="109">ְλ״̬</td>
				<td width="109">ְλ����</td>
				<td width="152">��ʾְλ��Ϣ</td>
				<td width="152">�޸���Ϣ</td>
			    <td width="152">��ְ���</td>
			    
			</tr>
<%
	
Iterator it = data.iterator();

while(it.hasNext()){
	JobinfoTO u = (JobinfoTO)it.next();
%>
		
			<tr>
			    <td><input type="checkbox" name="jobID" value=<%=u.getJobID()%>></td>
				<td><%=u.getJobtitle()%></td>
				<td>
					<%  
					    int status=u.getStatus();
					    if(status==0) out.println("��Ƹ��");
					    if(status==1) out.println("������");
					    if(status==2) out.println("��ɾ��");   
					%>
				</td>
				<td>
					<%=helper.getJobcomf(u.getPositiontype())%>
				</td>
				<td><a href='<%=request.getContextPath()%>/job/queryjob.do?operation=queryjob&sign=adminquery&jobID=<%=u.getJobID()%>'>ְλ��Ϣ</a>
				<td><a href='<%=request.getContextPath()%>/job/queryjob.do?operation=queryjob&sign=adminupquery&jobID=<%=u.getJobID()%>'>�޸�</a>
				</td>
				<td><a href='showjobleter.do?operation=showjobleter&pageNum=1&sign=admin&jobID=<%=u.getJobID()%>'>��ְ���</a>
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
	<a href='showjob.do?operation=adminshowjob&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=adminshowjob&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjob.do?operation=adminshowjob&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=adminshowjob&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr>
<td colspan="4">
	<input type=button value=" �ط� " class="button" onClick="startstatus()" />	
	<input type=button value=" ֹͣ " class="button" onClick="stopstatus()" />			
	<input type=button value=" ɾ�� " class="button" onClick="delstatus()" />
</td>
</tr>
</table>
 </form>

<script>

function delstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("��ѡ��ҪIT�˲ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=adminjob&sign=del";
	document.form1.submit();
}
function stopstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("��ѡ��ҪIT�˲ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=adminjob&sign=stop";
	document.form1.submit();
}
function startstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("��ѡ��ҪIT�˲ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=adminjob&sign=start";
	document.form1.submit();
}
</script>
</body>


