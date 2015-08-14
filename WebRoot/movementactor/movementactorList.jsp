<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<title>参与者管理</title>
</head>
<body>
<%

Page movementpage = (Page) request.getAttribute("page");
String memberIDs = (String)request.getAttribute("memberIDs");
String kinds = (String)request.getAttribute("kinds");
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
		<td colspan="2"  class="dvInnerHeader"><b>参与者列表</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<tr>
		<td width="100">参与者账号</td>
        <td width="150"><input type="text" name="memberIDs" style="width:130px"/></td>
		<td width="100">参与者类型</td>
		<td width="120">
		  <select name="kinds">
		     <option value="">请选择</option>
    		 <option value="1">HR</option>
    		 <option value="2">IT人才</option>
  		   </select>
    	</td>
    	<td width="100">参与者状态</td>
		<td width="110">
		  <select name="statuss">
		        <option value="">请选择</option>
    			<option value="0">已报名</option>
    			<option value="1">已批准</option>
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
	<td width="15%">参与者</td>
	<td width="15%">参与者类型</td>
	<td width="20%">报名时间</td>
	<td width="10%">参与者状态</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementactorTO u = (MovementactorTO)it.next();
%>
<tr>
	<td><input type=checkbox name="maID" value="<%=u.getMaID()%>"></td>
	<td><%=u.getTitle()%></td>
	<td><%if (u.getKind()==1) {%>
	     <a href="../hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getMemberID()%>" ><%=u.getMemberID()%></a>
	    <%} else { %>
	     <a href="../it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getMemberID()%>"><%=u.getMemberID()%></a>
	    <%} %>
	</td>
	<td><%   switch (u.getKind())
             {
                    case 1:out.println("HR");break;
                    case 2:out.println("IT人才");break;
              }%>
	</td>
	<td><%=u.getStarttime()%></td>
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("已报名");break;
                    case 1:out.println("已批准");break;
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
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=1&pageLength=<%=movementpage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='movementactorList.do?operation=movementactorList&memberIDs=<%=memberIDs%>&kinds=<%=kinds%>&statuss=<%=statuss%>&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 审批 " class="button" onclick="change()">
<input type=button  value=" 删除 " class="button" onclick="del()">
</td></tr>
</table> 
</form>
<script>
function add(){
	document.form.action="FrontController.do?operation=movementactoradd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.maID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=movementactorquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.maID)){
		alert("请选择要显示的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=movementactorquery&method=show";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.maID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=movementactordelete";
	document.form.submit();
}
function change(){
	if(!isChecked(document.form.maID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=statuschange";
	document.form.submit();
}
function search(){

	document.form.action="movementactor.do?operation=movementactorlist&pageNum=1";                     
	document.form.submit();
}
</script>
</body>
</html>