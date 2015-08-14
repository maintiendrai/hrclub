<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'commendworktopro.jsp' starting page</title>
    	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

  </head>
  
  <body>
  	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
	<% Object hr=session.getAttribute("hrID"); %>
	<%if(null!=hr){ %>
	
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">


					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   	<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile"></td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
   <%} %>
        <a href="<%=path%>/hr/commenditwork.jsp" target="top"> 继续添加工作经历</a>
    <a href="<%=path%>/hr/commenditpro.jsp"  target="top">下一步添加项目</a>
    </td>
    </tr>
    </table>
    <tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
     <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
  </body>
</html>
