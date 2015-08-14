<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<title>活动管理</title>
<script>
function add(){
	document.form.action="FrontController.do?operation=movementactoradd&method=add";
	document.form.submit();
}
</script>
</head>

<body>
<%
   MovementTO to = (MovementTO)request.getAttribute("to");
   Page movementpage = (Page) request.getAttribute("page");
   List data = movementpage.getData();
%>

<form id="form" name="form" method="post" action="">
<input type="hidden" name="status"  value="<%=to.getStatus()%>"/>
<input type="hidden" name="moveID"  value="<%=to.getMoveID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>活动查看</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">活动主题</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>活动所需积分数</td>
      <td><% switch (to.getIntegral())
             {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
              }%></td>
    </tr>
    <tr>
      <td >活动发布时间</td>
      <td><%=to.getPuttime()%></td>
    </tr>
    <tr>
      <td>活动开始时间</td>
      <td><%=to.getStarttime()%></td>
    </tr>
    <tr>
      <td>活动结束时间</td>
      <td><%=to.getEndtime()%></td>
    </tr>
    <tr>
      <td>活动状态</td>
      <td><% switch (to.getStatus())
             {
                    case 0:out.println("报名中");break;
                    case 1:out.println("已停止");break;
                    case 2:out.println("已删除");break;
              }%></td>
    </tr>
    <tr>
      <td>活动内容</td>
      <td><%=to.getContext()%></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
 <tr>
	<td width="10%">选择</td>
	<td width="15%">活动编号</td>
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
	<td><%=u.getMoveID()%></td>
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
	<a href='FrontController.do?operation=movequery&method=show&pageNum=1&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>首页</a>&nbsp;&nbsp;
	<a href='FrontController.do?operation=movequery&method=show&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='FrontController.do?operation=movequery&method=show&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>下页</a>&nbsp;&nbsp;
	<a href='FrontController.do?operation=movequery&method=show&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
        <input type=button  value=" 审批 " class="button" onclick="change()">
        <input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
</td></tr>
</table>   
</form>
<script>
function change(){
	if(!isChecked(document.form.maID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=statuschangepart&moveID=<%=to.getMoveID()%>";
	document.form.submit();
}
</script>
</body>
</html>
