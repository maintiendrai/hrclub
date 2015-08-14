<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<title>招聘信息管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>求职信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
			
				<td>求职人员</td>
			
				<td >查看应聘人信息</td>
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
			<a href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getUserID()%>">查看应聘人信息</a>
			</td>
			</tr>
			<%}%>	
		<tr><td><br></td></tr>
<tr>
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	上页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&sign=admin&jobID=<%=jobID%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td>     <input type="reset" name="reset" value=" 返回 " class="button"   onclick="history.back();"></td>
</tr>
</table>
 </form>

<script>

function delleter(){
	if(!isChecked(document.form1.letterID)){
		alert("请选择要删除的求职信！");
		return false;
	}
	document.form1.action="FrontController.do?operation=delleter";
	document.form1.submit();
}
</script>
</body>


