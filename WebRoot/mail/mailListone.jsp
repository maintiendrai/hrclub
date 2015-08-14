<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>邮件管理</title>
</head>
<body>
		<%
String url = request.getContextPath();
%>
<%

Page mypage = (Page) request.getAttribute("mypage");
List data = mypage.getData();
 
Object userid = session.getAttribute("userid");
Object hrID = session.getAttribute("hrID");
String revID=null;
String revkind=null;
                                   
	if (null !=userid) {
		revID=session.getAttribute("userid").toString();
		revkind="2";
	}
	if (null !=hrID) {
		revID=session.getAttribute("hrID").toString();
		revkind="1";
	}
%>
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
				<%if(null!=hrID){ %>
			
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%}else if(null!=userid) { %>
		
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

					<%} %>
				</td>
				<td width="558" valign="top">
				<table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">邮件列表</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
<form name="form"  action="" method=post>
<div id="contentborder" align="center">

<table border=0 cellspacing=0 cellpadding=0  class="small">
<tr>
	<td width="10%">选择</td>
	<td width="25%">邮件主题</td>
	<td width="10%">发送人</td>
	<td width="15%">发送人类型</td>
	<td width="15%">发送时间</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MailTO u = (MailTO)it.next();
%>
<tr>
	<td><input type=radio name="mailID" value="<%=u.getMailID()%>"></td>
	<td><%=u.getSubject()%></td>
    <td><%=u.getSentID()%></td>
    <td>管理员</td>
    <td><%=u.getTime()%></td>
</tr>
<tr>
<td colspan="6">
<hr>
</td>
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
	<%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
	<%}else {%>  
	<td colspan=8 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='mail.do?operation=mailquery&method=showone&revkind=<%=revkind%>&revID=<%=revID%>&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='mail.do?operation=mailquery&method=showone&revkind=<%=revkind%>&revID=<%=revID%>&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='mail.do?operation=mailquery&method=showone&revkind=<%=revkind%>&revID=<%=revID%>&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='mail.do?operation=mailquery&method=showone&revkind=<%=revkind%>&revID=<%=revID%>&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" 查看 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="show()">
<input type=button  value=" 删除 "class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="delone()">
<input type="hidden" name="revID" value="<%=revID%>">
<input type="hidden" name="revkind" value="<%=revkind%>">
</td></tr>
</table> 
</form>
</td>
</tr>
  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
</table>
<script>
function delone(){
	if(!isChecked(document.form.mailID)){
		alert("请选择要删除的信息！");
		return false;
	}
	var revID = document.form.revID.value;
	var revkind = document.form.revkind.value;
	document.form.action="FrontController.do?operation=mailquery&method=del";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.mailID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=mailquery&method=read";
	document.form.submit();
}
</script>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>