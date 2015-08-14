<%@ page language="java" import="java.util.*,com.hrclub.to.JobletterTO" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />

<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <base href="<%=basePath%>">
  
    <title>显示求职信息</title>
    	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
    
	<%
	JobletterTO to=(JobletterTO)request.getAttribute("to");
	
	%>

  </head>
<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">	<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">显示求职信息</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
<form action="restoreletter.do" method=post>
  <table  align="center">
  
    <tr>  <input type="hidden" name="jobID" value="<%=request.getParameter("jobID") %>" />
      
    <tr><td>求职信内容</td>
    <td>
    <%=to.getContent() %>
    </td>
    
    </tr>
    
    <tr><td>回复内容</td>
    <td>
  <textarea rows="20" cols="50" name="restore"><%=to.getRestore() %></textarea>
    </td>
    
    </tr>
    <tr>
    <td>
    </td>
      <td >
         <input type="hidden" name="operation" value="restoreletter"> 
      <input type="hidden" name="letterID" value="<%=to.getLetterID() %>"> 
      <input type="reset" name="reset" value=" 返回 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  onclick="history.back();">
    <input type="submit"  class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value=" 复回 ">
    </tr>
  </table>
  </form>
  </td>
  </tr>
    <tr>
        <td><img src="<%=path%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
  </table>
 
      	</table>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>

</html>
