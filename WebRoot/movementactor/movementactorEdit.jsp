<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>参与者管理</title>
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
		<td colspan="2"  class="dvInnerHeader"><b>修改参与者信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>活动编号</td>
      <td><input type="hidden" name="moveID" value="<%=to.getMoveID()%>"/>
          <%=to.getMoveID()%>
      </td>
    </tr>
    <tr>
      <td width="130">参与者编号</td>
      <td><input type="hidden" name="memberID" value="<%=to.getMemberID()%>"/>
          <%=to.getMemberID()%>
      </td>
    </tr>
     <tr>
      <td width="130">参与者类型</td>
      <td><input type="hidden" name="kind" value="<%=to.getKind()%>"/>
          <%   switch (to.getKind())
               {
                    case 1:out.println("HR");break;
                    case 2:out.println("IT人才");break;
               }%>
      </td>
    </tr>
    <tr>
      <td>报名时间</td>
      <td><input type="hidden" name="starttime" value="<%=to.getStarttime()%>"/>
          <%=to.getStarttime()%>
      </td>
    </tr>
    <tr>
      <td>状态</td>
      <td>
          <select name="status">
          <option value="0" <% if(to.getStatus()==0) out.print("selected");%>>已报名</option>
    	  <option value="1" <% if(to.getStatus()==1) out.print("selected");%>>已批准</option>
  	  </td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 保存 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>