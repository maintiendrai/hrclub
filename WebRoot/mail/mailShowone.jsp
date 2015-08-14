<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
			<%
String url = request.getContextPath();
%>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>邮件管理</title>

</head>

<body>
<%MailTO to = (MailTO)request.getAttribute("to");%>
<% Object hrID=session.getAttribute("hrID");
 Object userid=session.getAttribute("userid"); %>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
				<%if(null!=hrID){ %>
					
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%}else if(null!=userid) { %>

<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
					<%} %>
				</td>
				<td width="558" valign="top">
				<table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">查看邮件</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table  border="0" align="center">
								<tr>
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
 
<table border=0 cellspacing=0 cellpadding=0 class="small">
    <tr>
      <td width="130">发送人</td>
      <td><%=to.getSentID()%></td>
    </tr>
    <tr>
      <td>接收人</td>
      <td><%=to.getRevID()%></td>
    </tr>
    <tr>
      <td>接收人类型</td>
      <td><% switch (to.getRevkind())
             {
                 case 1:out.println("HR");break;
                 case 2:out.println("IT人才");break;

              }%></td>
    </tr>
    <tr>
      <td>发送时间</td>
      <td><%=to.getTime()%></td>
    </tr>
    <tr>
      <td>邮件主题</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>邮件内容</td>
      <td><%=to.getContext()%></td>
    </tr>
    <tr><td><br></td></tr>

<table border=0 cellspacing=0 cellpadding=0  class="small">
    <tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" 返回 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="history.back();">
      </td>
    </tr>
</table>

				  <tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
      	   	</table>
      	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</form>
</body>
</html>


