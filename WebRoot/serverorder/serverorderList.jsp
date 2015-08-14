<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script src="../js/datepicker/WdatePicker.js"></script>
<title>服务订单管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
String hrIDs = (String)request.getAttribute("hrIDs");
String kinds = (String)request.getAttribute("kinds");
String statuss = (String)request.getAttribute("statuss");
List data = mypage.getData();
 %>
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>服务订单列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>    
        <td width="100">购买者账号</td>
        <td width="150"><input type="text" name="hrIDs" style="width:130px"/></td>
		<td width="100">订单类型</td>
		<td width="120">
		  <select name="kinds">
		     <option value="">请选择</option>
    		 <option value="0">其他</option>
    		 <option value="1">企业服务</option>
    		 <option value="2">培训服务</option>
    		 <option value="3">软件外包</option>
    		 <option value="4">劳务派遣</option>
    		 <option value="5">猎头</option>
  		   </select>
    	</td>
    	<td width="100">定单状态</td>
		<td width="110">
		  <select name="statuss">
		        <option value="">请选择</option>
    			<option value="0">未处理</option>
    			<option value="1">已处理</option>
    			<option value="2">已删除</option>
    			<option value="3">已作废</option>
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
	<td width="25%">订单名称</td>
	<td width="10%">购买者账号</td>
	<td width="10%">购买者姓名</td>
	<td width="15%">购买时间</td>	
	<td width="10%">订单类型</td>
	<td width="10%">订单状态</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	ServerorderTO u = (ServerorderTO)it.next();
%>
<tr>
	<td><input type=radio name="orderID" value="<%=u.getOderID()%>"></td>
	<td><a href="FrontController.do?operation=serverquery&orderID=<%=u.getOderID()%>"><%=u.getOrdertitle()%></a></td>
	<td><a href="hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getHrID()%>" ><%=u.getHrID()%></a></td>
	<td><%=u.getName()%></td>
	<td><%=u.getBuytime()%></td>
    <td><%   switch(u.getKind())
             {
                     case 0:out.println("其他");break;
                     case 1:out.println("企业服务");break;
                     case 2:out.println("培训服务");break;
                     case 3:out.println("软件外包");break;
                     case 4:out.println("劳务派遣");break;
                     case 5:out.println("猎头");break;         
             }%></td>
    <td><%   switch(u.getStatus())
             {
                     case 0:out.println("未处理");break;
                     case 1:out.println("已处理");break;
                     case 2:out.println("已删除");break;
                     case 3:out.println("已作废");break; 
              }%></td>
</tr>
<%
}
%>
<tr><td><br></td></tr>
<tr>
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>
	<td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='serverorderList.do?operation=serverorderlist&hrIDs=<%=hrIDs %>&kinds=<%=kinds %>&statuss=<%=statuss %>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 修改 " class="button" onclick="edit()">
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=serverorderadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.orderID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderedit&method=editItem";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.orderID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=serverquery";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.orderID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderdelete&method=delall";
	document.form.submit();
}
function search(){

	document.form.action="serverorder.do?operation=serverorderlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>