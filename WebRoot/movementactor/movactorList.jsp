<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
<title>活动参与</title>
</head>
<body>
<%
	Object useid = session.getAttribute("userid");
			Object hrID = session.getAttribute("hrID");

Page movementpage = (Page) request.getAttribute("mypage");
String memberID = (String)request.getAttribute("memberID");
String kind = (String)request.getAttribute("kind");
List data = movementpage.getData();
 %>
  <%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
 	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

 <table align="center" width="700">
			<tr>
				<td width="100" valign="top">
					<%
					if (null != useid) {
					%>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
					<%
					} else if (null != hrID) {
					%>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					
					<%
					}
					%>
				</td>
				<td width="558" valign="top">
					<table align="center">
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">已参与的活动</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
                                      
<form name="form"  action="" method=post>

<table border=0 cellspacing=0 cellpadding=0 width="90%" class="small">
<tr class="titlename">
	<td width="25%">活动主题</td>
	<td width="20%">报名时间</td>
	<td width="10%">状态</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementactorTO u = (MovementactorTO)it.next();
%>
<tr>
    <td><li><a href= "FrontController.do?operation=movementquery&method=show&moveID=<%=u.getMoveID()%>"><%=u.getTitle()%></a></td>
	<td><%=u.getStarttime()%></td>
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("已报名");break;
                    case 1:out.println("已批准");break;
              }%>
    </td> 
</tr>
<tr> <td colspan="3"><hr></td>
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(movementpage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=8 align="center">第 <%=movementpage.getPageNum() %>/<%=movementpage.getPageCount() %> 页  共 <%=movementpage.getRecordNum() %>条记录  
	<%if(movementpage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=1&pageLength=<%=movementpage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 返回 "class=btn1_mouseout onMouseOver="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="search()">
</td></tr>
</table> 
</form>
				  <tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
				</table></td>
				</tr>
				</table>
				

<script>
function search(){

	document.form.action="movementactor.do?operation=movementlistlimt&pageNum=1";                     
	document.form.submit();
}
</script>


	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>

</body>
</html>