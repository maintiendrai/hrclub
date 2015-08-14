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
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css">
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />


   <% List movelist = helper.getMovement(10);
		Object userid = session.getAttribute("userid"); %>
</head>

<body leftmargin="0" topmargin="0" >
<table width="218" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="81" height="56" background="<%=url %>/images/login-top-01.gif"></td>
    <td width="137" height="56" background="<%=url %>/images/login-top-02.gif"></td>
  </tr>
  <tr>
    <td height="11" colspan="2" background="<%=url %>/images/login-bg-01.gif"></td>
  </tr>
  <tr>
    <td colspan="2" valign="top" background="<%=url %>/images/login-bg-02.gif"><table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="50%" height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="itbaseinfo.do?operation=itbaseinfo&sign=itsign" target="_top" class="L1">预览简历</a>
                <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/itlanguage.jsp" target="_top" class="L1">外语信息</a>

      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="itinfo.do?operation=upitinfo" target="_top" class="L1">基础信息</a>
        <td width="50%" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="movactorList.do?operation=movactorlist&memberID=<%=userid.toString()%>&kind=2&pageNum=1" target="_top" class="L1">活动参与</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="itinfoedu.do?operation=itinfoedu" target="_top" class="L1">专业信息</a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="FrontController.do?operation=mailquery&method=showone&pageNum=1&revkind=2&revID=<%=session.getAttribute("userid").toString() %>" target="_top" class="L1">邮件管理</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/workexperience.jsp" target="_top" class="L1">工作经历</a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/showletter.do?operation=showletter&pageNum=1" target="_top" class="L1">求职历史</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/itproject.jsp"  target="_top" class="L1">项目经验</a>
        <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/uppassword.jsp"  target="_top" class="L1">修改密码</a>
      </tr>
      <tr>
        <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/itcertificate.jsp" target="_top"  class="L1">证书信息</a>
         <td height="22" class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/logout.do?operation=logout" target="_top" class="L1">退出系统</a></td>

      </tr>
      <tr>
               <td class="px12"><img src="<%=url %>/images/icon-3.gif" width="11" height="11"> <a href="<%=url %>/it/itskill.jsp" target="_top"" class="L1">IT技能</a></td>
        <td class="px12">&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
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
    <td colspan="2" background="<%=url %>/images/login1-bg-01.gif">
   <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr class="h22">
        <td background="<%=url %>/images/d02.gif"  class="h22">
           <%
											for (int i = 0; i < movelist.size(); i++) {
							%>
	       · <A href="FrontController.do?operation=movementquery&method=show&moveID=<%=((MovementTO) movelist.get(i)).getMoveID()%>" target="_top" > 
	      <%=((MovementTO) movelist.get(i)).getSubject()%></A><br >
	      <%} %>
          
		  </td>
      </tr>
        <tr class="h22"> <td align="right"><a href="FrontController.do?operation=movementlistlimt&pageNum=1" target="_top"> 更多>></a> </td>
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
