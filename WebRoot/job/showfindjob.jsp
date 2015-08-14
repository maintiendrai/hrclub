<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>招聘信息管理</title>
</head>
<%
   Object useid=session.getAttribute("userid");
     Object hrID=session.getAttribute("hrID");
   String path = request.getContextPath();
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
%>

<body>
<form name="form1" method="post" action="itmanger.do">
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

<table align="center" width="700">
   <tr>
   <td width="100" valign="top">
    <% if (null !=useid){ %><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

     <%}else if(null!=hrID){ %>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%} %>
   </td><td width="558" valign="top">
<table align="center">
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">主要城市列表</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table  border="0" align="center">
    <tr><td><jsp:include page="../job/maincity.jsp" flush="true" /></td></tr>
    	</table>
    	</tr>
	
<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif"  height="36" alt="" /></td>
      </tr>
 	
     
      
      	 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">招聘信息</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table width="520"  border="0" align="center">
								<tr><td>
<table border=0 cellspacing=0 cellpadding=0  class="small" align="center">
			<tr class="title" height="70">
					<td width="25%" >职位标题</td>

				<td width="20%" >职位类型</td>
				<td width="20%" >公司名称</td>
				<td width="15%" >发布时间</td>
				<td width="15%" >查看详情</td>
			</tr>
<%
	String city=null;
Iterator it = data.iterator();

while(it.hasNext()){
	JobinfoTO u = (JobinfoTO)it.next();
	city=u.getCity();
	
%>
		
			<tr>
				<td class="small"><a href='<%=request.getContextPath()%>/queryjob.do?operation=queryjob&jobID=<%=u.getJobID()%>'><%=u.getJobtitle()%></a></td>
		
				<td class="small">
					<%=helper.getJobcomf(u.getPositiontype())%>
				</td>
					<td class="small">
		   <% String s=u.getCorporation();
			      if(!s.equals("hrclub")) { 
			      %>
				<a href="hrinfo.do?operation=qeueyhr&sign=it&hrID=<%=u.getHrID()%>"><%=u.getCorporation()%>
				</a>	
				<%} else{ %>系统提供	<%} %>			</td>
				<td>
					<%=u.getPuttime()%>
				</td>
				<td class="small"><a href='<%=request.getContextPath()%>/queryjob.do?operation=queryjob&jobID=<%=u.getJobID()%>'>查看</a>
				</td>
			</tr>
			<tr>
			<td colspan="5"><hr></td>
			</tr>
			<%}%>	
		<tr><td><br></td></tr>
<tr>
    <%

    
    if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='byaddress.do?operation=byaddress&pageNum=1&pageLength=<%=mypage.getPageLength() %>&city=<%=city%>'>首页</a>&nbsp;&nbsp;
	<a href='byaddress.do?operation=byaddress&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>&city=<%=city%>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='byaddress.do?operation=byaddress&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>&city=<%=city%>'>下页</a>&nbsp;&nbsp;
	<a href='byaddress.do?operation=byaddress&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>&city=<%=city%>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
 	</table>
	

</table>
<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
   
</table>
</td>
</tr>
</table>


 	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
 </form>

</body>


