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
		<td colspan="2"  class="dvInnerHeader"><b>招聘信息列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
				<td width="49">选择</td>
				<td width="143">职位标题</td>
				<td width="109">职位状态</td>
				<td width="109">职位类型</td>
				<td width="152">显示职位信息</td>
				<td width="152">修改信息</td>
			    <td width="152">求职情况</td>
			    
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
					    if(status==0) out.println("招聘中");
					    if(status==1) out.println("已招满");
					    if(status==2) out.println("已删除");   
					%>
				</td>
				<td>
					<%=helper.getJobcomf(u.getPositiontype())%>
				</td>
				<td><a href='<%=request.getContextPath()%>/job/queryjob.do?operation=queryjob&sign=adminquery&jobID=<%=u.getJobID()%>'>职位信息</a>
				<td><a href='<%=request.getContextPath()%>/job/queryjob.do?operation=queryjob&sign=adminupquery&jobID=<%=u.getJobID()%>'>修改</a>
				</td>
				<td><a href='showjobleter.do?operation=showjobleter&pageNum=1&sign=admin&jobID=<%=u.getJobID()%>'>求职情况</a>
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
	<a href='showjob.do?operation=adminshowjob&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=adminshowjob&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjob.do?operation=adminshowjob&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=adminshowjob&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr>
<td colspan="4">
	<input type=button value=" 重发 " class="button" onClick="startstatus()" />	
	<input type=button value=" 停止 " class="button" onClick="stopstatus()" />			
	<input type=button value=" 删除 " class="button" onClick="delstatus()" />
</td>
</tr>
</table>
 </form>

<script>

function delstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("请选择要IT人才！");
		return false;
	}
	document.form1.action="FrontController.do?operation=adminjob&sign=del";
	document.form1.submit();
}
function stopstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("请选择要IT人才！");
		return false;
	}
	document.form1.action="FrontController.do?operation=adminjob&sign=stop";
	document.form1.submit();
}
function startstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("请选择要IT人才！");
		return false;
	}
	document.form1.action="FrontController.do?operation=adminjob&sign=start";
	document.form1.submit();
}
</script>
</body>


