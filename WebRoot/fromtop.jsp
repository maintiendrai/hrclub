
<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>

<html>
<head>
<%
	String url = request.getContextPath();
	%>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<link href="/hrclub/css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
<table width="1024" height="47" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="47"><img src="/hrclub/images/index_1.gif" width="115" height="47" alt="" /></td>
    <td class="top"><div align="right">市场介绍 | 初入导读(个人)(单位) | 服务声明 | 联系我们 |</div></td>
    <td><img src="/hrclub/images/index_3.gif" width="130" height="47" alt="" /></td>
  </tr>
</table>
<table width="1024" height="190" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="190"><img src="/hrclub/images/index_4.gif" width="115" height="190" alt="" /></td>
    <td><table width="779" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td><img src="/hrclub/images/index_5_1.gif" width="126" height="95" alt="" /></td>
        <td><img src="/hrclub/images/index_5_2.gif" width="123" height="95" alt="" /></td>
        <td><img src="/hrclub/images/index_5_3.gif" width="116" height="95" alt="" /></td>
        <td><img src="/hrclub/images/index_5_4.gif" width="114" height="95" alt="" /></td>
        <td><img src="/hrclub/images/index_5_5.gif" width="114" height="95" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_6.gif" width="84" height="95" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_7.gif" width="102" height="95" alt="" /></td>
      </tr>
      <tr>
        <td><a href="<%=url%>/index.jsp"><img src="<%=url %>/images/index_5_8.gif" alt="" width="126" height="53" border="0" /></a></td>
        <td><a href="<%=url%>/job/findjob.jsp"><img src="<%=url %>/images/index_5_9.gif" alt="" width="123" height="53" border="0" /></a></td>
        <td><a href="simresult.do?operation=showalljob&pageNum=1"><img src="<%=url %>/images/index_5_10.gif" alt="" width="116" height="53" border="0" /></a></td>
        <td><a href="FrontController.do?operation=movementlistlimt&pageNum=1"><img src="<%=url %>/images/index_5_11.gif" alt="" width="114" height="53" border="0" /></a></td>
        <td><a href="FrontController.do?operation=messagelistlimt&pageNum=1"><img src="<%=url %>/images/index_5_12.gif" alt="" width="114" height="53" border="0" /></a></td>
        <td><a href="http://www.qunyingnet.com/blogMain.jsp"><img src="<%=url %>/images/index_5_13.gif" alt="" width="84" height="53" border="0" /></a></td>
        <td><a href="http://www.qunyingnet.com/bbs/forums/list.page"><img src="<%=url %>/images/index_5_14.gif" alt="" width="102" height="53" border="0" /></a></td>
      </tr>
      <tr>
        <td><img src="<%=url %>/images/index_5_15.gif" width="126" height="42" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_161.gif" width="123" height="42" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_171.gif" width="116" height="42" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_18.gif" width="114" height="42" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_19.gif" width="114" height="42" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_20.gif" width="84" height="42" alt="" /></td>
        <td><img src="<%=url %>/images/index_5_21.gif" width="102" height="42" alt="" /></td>
      </tr>
    </table></td>
    <td><img src="<%=url %>/images/index_6.gif" width="130" height="190" alt="" /></td>
  </tr>
</table>
</body>
</html>
