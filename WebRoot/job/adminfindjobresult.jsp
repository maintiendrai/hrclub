<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
<title>招聘信息显示界面</title>
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
<table border=0 cellspacing=0 cellpadding=0 width=98% class="small">
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
<table border=0 cellspacing=0 cellpadding=0 width=98% class="small">
			<tr>
				
				<td width="20%">职位标题</td>
				<td width="20%">职位状态</td>
				<td width="25%">职位类型</td>
				<td width="15%">查看详情</td>
			</tr>
<%
	 
Iterator it = data.iterator();
while(it.hasNext()){
	JobinfoTO u = (JobinfoTO)it.next();
	
	
%>
		
			<tr>
				<td><%=u.getJobtitle()%></td>
				<td>
					<%  
					    int status=u.getStatus();
					    if(status==0) out.println("招聘中");
					    if(status==1) out.println("已招满");
					     
					%>
				</td>
				<td>
					<%=helper.getJobcomf(u.getPositiontype())%>
				</td>
				<td><a href='<%=request.getContextPath()%>/queryjob.do?operation=queryjob&sign=adminquery&jobID=<%=u.getJobID()%>'>查看</a>
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
	<a href='<%=url %>&sign=adminhighfind&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='<%=url %>&sign=adminhighfind&pageNum=<%=mypage.getPageNum()-1%>&pageLength=<%=mypage.getPageLength()%>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='<%=url %>&sign=adminhighfind&pageNum=<%=mypage.getPageNum()+1%>&pageLength=<%=mypage.getPageLength()%>'>下页</a>&nbsp;&nbsp;
	<a href='<%=url %>&sign=adminhighfind&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>末页</a>
	<%
	}
	}%> 
	
	</td>
	
</tr>
<tr><td>

</td>
</tr>
</table>

 </form>

</body>


