<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>HR�������</title>
</head>
<%
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
%>

<body>
<form name="form1" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>HR�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
		
			<tr>
				<td width="63">ѡ��</td>
				<td width="208">HR�˺�</td>
				<td width="152">HR״̬</td>
				<td width="275">�޸���Ϣ</td>
			</tr>
<%
	

Iterator it = data.iterator();

while(it.hasNext()){
	HRinfoTO u = (HRinfoTO)it.next();
%>
		
			<tr>			
				<td><input type="checkbox" name="hrid" value=<%=u.getHrID()%> ></td>
				<td><%=u.getHrID()%></td>
				<td>
					<%  
					    int status=u.getStatus();
					    if(status==0) out.println("δ���");
					    if(status==1) out.println("�����");
					    if(status==2) out.println("�Ѷ���");		   
					%>
		 		</td>

				<td><a href="hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getHrID()%>" >�鿴����</a></td>
			</tr><%}%>
			
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
	<a href='showhr.do?operation=showhr&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showhr.do?operation=showhr&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showhr.do?operation=showhr&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showhr.do?operation=showhr&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td><br></td></tr>
<tr>
<td colspan="4">
<input type=button value=" ���� " class="button" onClick="stopstatus()" />
<input type=button value=" ���� " class="button" onClick="startstatus()" />
<input type=button value=" ��� " class="button" onClick="passstatus()" />
</td>
</tr>
</table>
</form>
<script>

function stopstatus(){
		if(!isChecked(document.form1.hrid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=hrstatus&sign=stop";
	document.form1.submit();
}
function startstatus(){
	if(!isChecked(document.form1.hrid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=hrstatus&sign=open";
	document.form1.submit();
}
function passstatus(){
	if(!isChecked(document.form1.hrid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=hrstatus&sign=pass";
	document.form1.submit();
}

</script>
</body>


