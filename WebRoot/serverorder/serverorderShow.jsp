<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>���񶩵�����</title>
</head>

<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
  <% Object hrID=session.getAttribute("hrID");
 %>
<%ServerorderTO to = (ServerorderTO)request.getAttribute("to");%>
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
				<%if(null!=hrID){ %>
					
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%} %>
				</td>
				<td width="600" valign="top">
				<table width="600"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�����鿴</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
<form id="form" name="form" method="post">
<input type="hidden" name="oderID"  value="<%=to.getOderID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="600" class="small">
    <tr>
      <td>��������</td>
      <td><%=to.getOrdertitle()%></td>
    </tr>
    <tr>
      <td width="80">�������ʺ�</td>
      <td width="131"><%=to.getHrID()%></td>
    </tr>
    <tr>
      <td>��������</td>
      <td><%   switch(to.getKind())
               {
                     case 0:out.println("����");break;
                     case 1:out.println("��ҵ����");break;
                     case 2:out.println("��ѵ����");break;
                     case 3:out.println("������");break;
                     case 4:out.println("������ǲ");break;
                     case 5:out.println("��ͷ");break;         
                }%>
      </td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><%=to.getBuytime()%></td>
    </tr>
    <tr>
      <td>����״̬</td>
      <td><%   switch(to.getStatus())
               {
                     case 0:out.println("δ����");break;
                     case 1:out.println("�Ѵ���");break;
                     case 2:out.println("��ɾ��");break;
                     case 3:out.println("������");break; 
                }%>
      </td>
    </tr>
    <tr>
      <td>�������</td>
      <td><%=to.getOderinfo()%></td>
    </tr>
 <tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" ���� " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="history.back();">
      </td>
    </tr>
    </table>
		<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
</table>
</td>
</tr>
</table>
</form>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>
