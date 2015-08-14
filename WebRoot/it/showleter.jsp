<%@ page language="java" import="java.util.*,com.hrclub.to.JobletterTO" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
  	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

    <title>显示求职信息</title>
    
	<%
	JobletterTO to=(JobletterTO)request.getAttribute("to");
	
	%>

  </head>
<body>

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

<table width="776" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="218" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td>
        <iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td> </tr>
      
    </table>
      <table width="558" border="0" align="right" cellpadding="0" cellspacing="0">
        <tr>
          <td><table width="558" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="60" align="left" valign="top" background="<%=request.getContextPath()%>/images/main_1.gif"><img src="<%=request.getContextPath()%>/images/ba-ckqzx.jpg" width="181" height="49"></td>
            </tr>
            <tr>
              <td background="<%=request.getContextPath()%>/images/main_2.gif"><table width="500"  border="0" align="center" cellpadding="4" cellspacing="0">
 
   <tr><td valign="top">求职信内容</td>
    <td>
    <%=to.getContent() %>
    </td>
    </tr>
    <tr><td valign="top">回复内容</td>
    <td>
    <%=to.getRestore().equals("")?"没有回复内容":to.getRestore() %>
    </td>
    </tr>
    
  </table>
  </td>
  </tr>
    <tr>
        <td><img src="<%=path %>/images/main_3.gif" width="558" height="36" alt="" /></td>
       </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="785" border="0" align="center" cellpadding="0" cellspacing="0">
</table>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>

</body>
</html>
