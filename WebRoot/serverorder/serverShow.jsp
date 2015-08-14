<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>服务订单管理</title>
</head>

<body>
<%ServerorderTO to = (ServerorderTO)request.getAttribute("to");%>
<form id="form" name="form" method="post">
<input type="hidden" name="oderID"  value="<%=to.getOderID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>订单查看</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td>订单名称</td>
      <td><%=to.getOrdertitle()%></td>
    </tr>
    <tr>
      <td width="130">购买者帐号</td>
      <td><%=to.getHrID()%></td>
    </tr>
    <tr>
      <td>订单类型</td>
      <td><%   switch(to.getKind())
               {
                     case 0:out.println("其他");break;
                     case 1:out.println("企业服务");break;
                     case 2:out.println("培训服务");break;
                     case 3:out.println("软件外包");break;
                     case 4:out.println("劳务派遣");break;
                     case 5:out.println("猎头");break;         
                }%>
      </td>
    </tr>
    <tr>
      <td>购买时间</td>
      <td><%=to.getBuytime()%></td>
    </tr>
    <tr>
      <td>定单状态</td>
      <td><%   switch(to.getStatus())
               {
                     case 0:out.println("未处理");break;
                     case 1:out.println("已处理");break;
                     case 2:out.println("已删除");break;
                     case 3:out.println("已作废");break; 
                }%>
      </td>
    </tr>
    <tr>
      <td>订单简介</td>
      <td><%=to.getOderinfo()%></td>
    </tr>
<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
