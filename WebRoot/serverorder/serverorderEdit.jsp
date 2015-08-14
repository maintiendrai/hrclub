<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.ordertitle.value==""){
    alert("订单名称不能为空！");
    document.myform.ordertitle.focus();
    return false;
   }
   
   if(document.myform.hrID.value==""){
    alert("购买者帐号不能为空！");
    document.myform.hrID.focus();
    return false;
   }
   
   if(document.myform.oderinfo.value==""){
    alert("订单简介不能为空！");
    document.myform.oderinfo.focus();
    return false;
   }
   
}
</script>
<title>服务订单管理</title>
</head>

<body>
<%ServerorderTO to = (ServerorderTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=serverorderedit&method=edit" onsubmit="return validator(this)">
<input type="hidden" name="oderID"  value="<%=to.getOderID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>修改订单</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">订单名称</td>
      <td><input type="text" name="ordertitle" value="<%=to.getOrdertitle()%>" style="width:230px"/></td>
    </tr>
    <tr>
      <td width="80">购买者帐号</td>
      <td><input type="hidden" name="hrID" value="<%=to.getHrID()%>" /><%=to.getHrID()%></td>
    </tr>
    <tr>
      <td>订单类型</td>
      <td>
          <select name="kind">
    			<option value="0" <% if(to.getKind()==0) out.print("selected");%>>其他</option>
    			<option value="1" <% if(to.getKind()==1) out.print("selected");%>>企业服务</option>
    			<option value="2" <% if(to.getKind()==2) out.print("selected");%>>培训服务</option>
    			<option value="3" <% if(to.getKind()==3) out.print("selected");%>>软件外包</option>
    			<option value="4" <% if(to.getKind()==4) out.print("selected");%>>劳务派遣</option>
    			<option value="5" <% if(to.getKind()==5) out.print("selected");%>>猎头</option>
  		   </select>
      </td>   
    </tr>
    <tr>
      <td>购买时间</td>
      <td><input type="hidden" name="buytime" value="<%=to.getBuytime()%>"/>
          <%=to.getBuytime()%>
      </td>
    </tr>
     <tr>
      <td>定单状态</td>
      <td>   
          <select name="status">
    			<option value="0" <% if(to.getStatus()==0) out.print("selected");%>>未处理</option>
    			<option value="1" <% if(to.getStatus()==1) out.print("selected");%>>已处理</option>
    			<option value="2" <% if(to.getStatus()==2) out.print("selected");%>>已删除</option>
    			<option value="3" <% if(to.getStatus()==3) out.print("selected");%>>已作废</option>
  	      </select>
  	  </td>
    </tr>
    <tr>
      <td>订单简介</td>
      <td><textarea name="oderinfo" rows="7" cols="50"><%=to.getOderinfo()%></textarea></td>
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