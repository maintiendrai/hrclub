<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script src="../js/datepicker/WdatePicker.js"></script>
<title>活动管理</title>
</head>
<body>
<%

Page movementpage = (Page) request.getAttribute("movementpage");
String puttimes = (String)request.getAttribute("puttimes");
String statuss = (String)request.getAttribute("statuss");
List data = movementpage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>活动列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">发布时间</td>
        <td width="180"><input id="puttimes" name="puttimes" type="text" class="Wdate"
			onfocus="new WdatePicker(this)"/></td>
		<td width="100">活动状态</td>
		<td width="100">
		  <select name="statuss">
		  <option value="">请选择</option>
    	  <option value="0">报名中</option>
    	  <option value="1">已停止</option>
    	  <option value="2">已删除</option>	
  	      </select>
    	</td>	
		<td>
			<input type="button" value=" 查询 " class="button" onclick="search()">
		</td>
		<tr><td><br></td></tr>
</tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
	<td width="10%">选择</td>
	<td width="25%">活动主题</td>
	<td width="15%">活动发布时间</td>
	<td width="15%">活动开始时间</td>
	<td width="15%">活动结束时间</td>
	<td width="12%">活动所需的积分</td>
	<td width="8%">活动状态</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementTO u = (MovementTO)it.next();
%>
<tr>
	<td><input type=radio name="moveID" value="<%=u.getMoveID()%>"></td>
	<td><a href="FrontController.do?operation=movequery&method=show&pageNum=1&moveID=<%=u.getMoveID()%>"><%=u.getSubject()%></a></td>
	<td><%=u.getPuttime()%></td>
	<td><%=u.getStarttime()%></td>
	<td><%=u.getEndtime()%></td>
	<td><%   switch (u.getIntegral())
             {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
              }%>
    </td> 
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("报名中");break;
                    case 1:out.println("已停止");break;
                    case 2:out.println("已删除");break;
              }%>
    </td> 
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(movementpage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=8 align="center">第 <%=movementpage.getPageNum() %>/<%=movementpage.getPageCount() %> 页  共 <%=movementpage.getRecordNum() %>条记录  
	<%if(movementpage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=1&pageLength=<%=movementpage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='movementList.do?operation=movementList&puttimes=<%=puttimes%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 发起 " class="button" onclick="add()">
<input type=button  value=" 修改 " class="button" onclick="edit()">
<input type=button  value=" 查看 " class="button" onclick="show()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=movementadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.moveID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=movementquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.moveID)){
		alert("请选择要显示的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=movequery&method=show&pageNum=1";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.moveID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=movementdelete";
	document.form.submit();
}
function search(){

	document.form.action="movement.do?operation=movementlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>