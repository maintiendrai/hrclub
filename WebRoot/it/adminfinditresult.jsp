<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<title>�˲��������</title>
</head>
<%
   
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
    Properties prop=(Properties)request.getAttribute("prop");
    String url= tb.getURL(prop) ;

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
		<td colspan="2"  class="dvInnerHeader"><b>IT�˲���Ϣ�б�</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
				
				<td >IT�˻�</td>
				<td >����ְλ</td>
				<td >����רҵ</td>
				<td >�鿴����</td>
			</tr>
<%
	String city=null;
Iterator it = data.iterator();

while(it.hasNext()){
	ITUserSpecialityTO u = (ITUserSpecialityTO)it.next();
	city=u.getCity();
	
%>
		
			<tr>
				<td><%=u.getUserid()%></td>
				<td>
					<%=helper.getMoreJobcomf(u.getPositiontype())   
					%>
				</td>
				<td>
					<%=helper.getSpecialitycomf(u.getSpecialityID())%>
				</td>
				<td><a href='<%=request.getContextPath()%>/it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getUserid()%>'>�鿴</a>
				</td>
			</tr>
			<%}%>	
		<tr><td><br></td></tr>
<tr>
    <%
    if(mypage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=6 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='<%=url %>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='<%=url %>&pageNum=<%=mypage.getPageNum()-1%>&pageLength=<%=mypage.getPageLength()%>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>

	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='<%=url %>&pageNum=<%=mypage.getPageNum()+1%>&pageLength=<%=mypage.getPageLength()%>'>��ҳ</a>&nbsp;&nbsp;
	<a href='<%=url %>&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
	
</tr>
<tr><td>

</td>
</tr>
</table>
</form>

</body>


