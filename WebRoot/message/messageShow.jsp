<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
<title>��Ϣ����</title>
</head>

<body>
<% Object useid=session.getAttribute("userid");
  Object hrID=session.getAttribute("hrID");
  %>
<%MessageTO to = (MessageTO)request.getAttribute("to");%>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
    <% if (null !=useid){ %><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
     <%}else if(null!=hrID){ %>	<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe><%} %>
   </td><td width="558" valign="top">
  
<form id="form" name="form" method="post" action="">

<table border=0 cellspacing=0 cellpadding=0  class="small">

	<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�鿴��Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top">
								<table   border="0" align="center">
			   
 
<table border=0 cellspacing=0 cellpadding=0  class="small">
    <tr>
      <td width="130">��Ϣ����</td>
      <td width="470"><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
      <td><%   switch (to.getKind())
               {
                     case 0:out.println("����");break;
                     case 1:out.println("����");break;
                     case 2:out.println("HR����");break;
                     case 3:out.println("IT�˲Ź���");break;
                }%>
      </td>
    </tr>
    <tr>
      <td>��Чʱ��</td>
      <td><%=to.getStarttime()%></td>
    </tr>
     <tr>
      <td>ʧЧʱ��</td>
      <td><%=to.getEndtime()%></td>
    </tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0  class="small">
    <tr>
      <td width="130">��Ϣ����</td>
      <td width="470"><%=to.getContext()%></td>
    </tr> 
    <tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0  class="small">
	 <tr>   
      <td colspan="2">
        <input type="reset" name="reset" value=" ���� " onclick="history.back();" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
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
</html>
