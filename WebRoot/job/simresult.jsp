<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" /> 

<title>招聘信息显示界面</title>
			<%
String path = request.getContextPath();
%>
</head>
<%
    Object useid=session.getAttribute("userid");
     Object hrID=session.getAttribute("hrID");
   
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
    Properties prop=(Properties)request.getAttribute("prop");
    String url= tb.getURL(prop) ;

%>

<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

<form name="form1" method="post" action="find.do">
 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
    <% if (null !=useid){ %><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
     <%}else if(null!=hrID){ %>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
     
     <%} %>
   </td><td width="558" valign="top">
    
<table align="center" >
   <tr><td width="550"><jsp:include page="../job/findjobtop.jsp" flush="true" />
   </td>
   </tr>
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">招聘信息列表</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">


<div id="contentborder" align="center">

<table border=0 cellspacing=0 cellpadding=0 width=500 class="small">
			<tr class="title" height="70">
				
			
					<td width="25%" >职位标题</td>

				<td width="15%" >职位类型</td>
				<td width="15%" >公司名称</td>
				<td width="10%" >人数</td>
				<td width="15%" >发布时间</td>
				<td width="15%" >查看详情</td>
			</tr>
				<tr><td><br></td></tr>
			
<%
	 
Iterator it = data.iterator();
while(it.hasNext()){
	JobinfoTO u = (JobinfoTO)it.next();
	
	
%>
		
			<tr>
				<td class="small"><a href='<%=request.getContextPath()%>/queryjob.do?operation=queryjob&jobID=<%=u.getJobID()%>'><%=u.getJobtitle()%></a></td>
		
				<td class="small">
					<%=helper.getJobcomf(u.getPositiontype())%>				</td>
						<td class="small">
			   <% String s=u.getCorporation();
			      if(!s.equals("hrclub")) { 
			      %>
				<a href="hrinfo.do?operation=qeueyhr&sign=it&hrID=<%=u.getHrID()%>"><%=u.getCorporation()%>
				</a>	
				<%} else{ %>系统提供	<%} %>
				</td>
					<td class="small">
					<%=u.getNum()%>				</td>
			</td>
					<td class="small">
					<%=u.getPuttime()%>				</td>
				<td class="small"><a href='<%=request.getContextPath()%>/queryjob.do?operation=queryjob&jobID=<%=u.getJobID()%>'>查看</a>				</td>
			</tr>
			<tr>
			<td colspan="6"><hr></td>
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
	<a href='<%=url %>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='<%=url %>&pageNum=<%=mypage.getPageNum()-1%>&pageLength=<%=mypage.getPageLength()%>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
		下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='<%=url %>&pageNum=<%=mypage.getPageNum()+1%>&pageLength=<%=mypage.getPageLength()%>'>下页</a>&nbsp;&nbsp;
	<a href='<%=url %>&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>末页</a>
	<%
	}
	}%>	</td>
</tr>
<tr><td>

</td>
</tr>
</table>






   <tr>
        <td><img src="<%=path%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
 </table>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
 </form>
</body>


