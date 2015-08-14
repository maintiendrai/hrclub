<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>HR管理界面</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>HR列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
		
			<tr>
				<td width="63">选择</td>
				<td width="208">HR账号</td>
				<td width="152">HR状态</td>
				<td width="275">修改信息</td>
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
					    if(status==0) out.println("未审核");
					    if(status==1) out.println("已审核");
					    if(status==2) out.println("已冻结");		   
					%>
		 		</td>

				<td><a href="hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getHrID()%>" >查看详情</a></td>
			</tr><%}%>
			
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
	<a href='showhr.do?operation=showhr&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='showhr.do?operation=showhr&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showhr.do?operation=showhr&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='showhr.do?operation=showhr&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td><br></td></tr>
<tr>
<td colspan="4">
<input type=button value=" 冻结 " class="button" onClick="stopstatus()" />
<input type=button value=" 启用 " class="button" onClick="startstatus()" />
<input type=button value=" 审核 " class="button" onClick="passstatus()" />
</td>
</tr>
</table>
</form>
<script>

function stopstatus(){
		if(!isChecked(document.form1.hrid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=hrstatus&sign=stop";
	document.form1.submit();
}
function startstatus(){
	if(!isChecked(document.form1.hrid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=hrstatus&sign=open";
	document.form1.submit();
}
function passstatus(){
	if(!isChecked(document.form1.hrid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=hrstatus&sign=pass";
	document.form1.submit();
}

</script>
</body>


