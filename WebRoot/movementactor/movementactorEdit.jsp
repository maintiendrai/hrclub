<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>�����߹���</title>
</head>

<body>
<%MovementactorTO to = (MovementactorTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=movementactoredit">
<input type="hidden" name="maID"  value="<%=to.getMaID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸Ĳ�������Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>����</td>
      <td><input type="hidden" name="moveID" value="<%=to.getMoveID()%>"/>
          <%=to.getMoveID()%>
      </td>
    </tr>
    <tr>
      <td width="130">�����߱��</td>
      <td><input type="hidden" name="memberID" value="<%=to.getMemberID()%>"/>
          <%=to.getMemberID()%>
      </td>
    </tr>
     <tr>
      <td width="130">����������</td>
      <td><input type="hidden" name="kind" value="<%=to.getKind()%>"/>
          <%   switch (to.getKind())
               {
                    case 1:out.println("HR");break;
                    case 2:out.println("IT�˲�");break;
               }%>
      </td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><input type="hidden" name="starttime" value="<%=to.getStarttime()%>"/>
          <%=to.getStarttime()%>
      </td>
    </tr>
    <tr>
      <td>״̬</td>
      <td>
          <select name="status">
          <option value="0" <% if(to.getStatus()==0) out.print("selected");%>>�ѱ���</option>
    	  <option value="1" <% if(to.getStatus()==1) out.print("selected");%>>����׼</option>
  	  </td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>