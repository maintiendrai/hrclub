<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>�˲��������</title>
</head>
<%
   
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
    Properties prop=(Properties)request.getAttribute("prop");
    String url= tb.getURL(prop) ;

%>

<body>

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

	<table align="center" width="700">
	<tr>
   <td width="100" valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�˲��������</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
<form name="form1" method="post" action="">


<table border=0 cellspacing=0 cellpadding=0 width="500" class="small">
			<tr>
				
				<td >����</td>
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
				<td class="small"><a href='<%=request.getContextPath()%>/it/itbaseinfo.do?operation=itbaseinfo&sign=findit&userid=<%=u.getUserid()%>'><%=u.getName()%></a></td>
				<td class="small">
					<%=helper.getMoreJobcomf(u.getPositiontype())   
					%>
				</td>
				<td class="small">
					<%=helper.getSpecialitycomf(u.getSpecialityID())%>
				</td>
				<td class="small"><a href='<%=request.getContextPath()%>/it/itbaseinfo.do?operation=itbaseinfo&sign=findit&userid=<%=u.getUserid()%>'>�鿴</a>
				</td>
			</tr>
			<tr>
			<td colspan="4">
			<hr>
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
		<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
</table>
 </form>
 </td>
 </tr>
 </table>
  <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
 
</body>


