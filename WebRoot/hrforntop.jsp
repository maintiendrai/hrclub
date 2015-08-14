<%@ page language="java" import="java.util.*,com.hrclub.to.MovementTO" pageEncoding="GBK"%>
<%
String url = request.getContextPath();

%>

        <jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
   <title>无标题文档</title>
     <link href="<%=url %>/css/index.css" rel="stylesheet" type="text/css" />
  <link href="<%=url %>/css/css.css" rel="stylesheet" type="text/css" />

</head>
<%
		 List movelist = helper.getMovement(10);
String hrID = (String)session.getAttribute("hrID");

if(null==hrID) {

	response.sendRedirect("hr/hrlogin.jsp");

   }	else{
%> 
<%   Object HRstatus = session.getAttribute("HRstatus"); %>
<body leftmargin="0" topmargin="0" >
<table width="218" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="81" height="56" background="<%=url %>/images/login-top-01.gif"></td>
    <td width="137" height="56" background="<%=url %>/images/HR-LOGO.gif"></td>
  </tr>
  <tr>
    <td height="11" colspan="2" background="<%=url %>/images/login-bg-01.gif"></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="<%=url %>/images/login-bg-02.gif"><table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
       <% if(((Integer)HRstatus).intValue()==1){ %>
      <tr>
        <td width="50%" height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/findit.jsp" target="_top" class="L1"> 搜索人才 </a>
        </td>
         <%} %>
          <td width="50%" height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="document.do?operation=documentlisthrall&pageNum=1" target="_top" class="L1"> 资料下载 </a>
      </td>
      </tr>
    
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="movactorList.do?operation=movactorlist&memberID=<%=hrID%>&kind=1&pageNum=1" target="_top" class="L1">活动参与</a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/job/putjob.jsp" target="_top" class="L1">职位发布</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/job/putjob.do?operation=showjob&pageNum=1" target="_top" class="L1"> 职位管理</a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/hr/commendit.jsp" target="_top" class="L1">人才推荐</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="FrontController.do?operation=serverorderedit&method=list&pageNum=1" target="_top" class="L1"> 服务订购 </a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/hr/hrinfo.do?operation=qeueyhr"  target="_top" class="L1"> 浏览信息  </a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/uphrinfo.do?operation=uphrinfo" target="_top" class="L1">信息编辑</a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="FrontController.do?operation=mailquery&method=showone&pageNum=1&revkind=1&revID=<%=session.getAttribute("hrID").toString() %>"  target="_top" class="L1"> 邮件管理</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="FrontController.do?operation=documentquery&method=showhr&pageNum=1" target="_top" class="L1"> 文件管理 </a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/hr/uppassword.jsp" target="_top" class="L1">修改密码 </a></td>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/logout.do?operation=hrlogout" target="_top" class="L1">退出系统</a></td>
        <td class="px12">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  	<%} %>
  <tr>
    <td height="14" colspan="2" background="<%=url %>/images/login-bg-03.gif"></td>
  </tr>
</table>
<table width="218" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="64" height="61" background="<%=url %>/images/login1-top-01.gif"></td>
    <td width="154" height="61" background="<%=url %>/images/login1-top-02.gif"></td>
  </tr>
  <tr>
    <td colspan="2" background="<%=url %>/images/login1-bg-01.gif"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr class="h22">
        <td background="<%=url %>/images/d02.gif" class="h22">
	    <%
											for (int i = 0; i < movelist.size(); i++) {
							%>
	    <A href="FrontController.do?operation=movementquery&method=show&moveID=<%=((MovementTO) movelist.get(i)).getMoveID()%>" target="_top" > 
	    ·    <%=((MovementTO) movelist.get(i)).getSubject()%></A>
	      <br>
	      <%} %>
	      </td>
      </tr>
        <tr><td class="px12" align="right"><a  href="FrontController.do?operation=messagelistlimt&pageNum=1" target="_top" >更多>> </a></td>
          </tr>
    </table>
      <table width="90%" border="0" align="right" cellpadding="0" cellspacing="0">
        
    </table></td>
  </tr>
  <tr>
    <td height="31" colspan="2" background="<%=url %>/images/login1-bg-02.gif"></td>
  </tr>
  <tr>
    <td height="33" colspan="2" background="<%=url %>/images/login1-bg-03.jpg"></td>
  </tr>
</table>
</body>
</html>
