<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<title>资料管理</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
IntegralTO to = (IntegralTO)request.getAttribute("to");
List data = mypage.getData();
 %>
 <% Object hrID=session.getAttribute("hrID");
 Object userid=session.getAttribute("userid"); %>
  <%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
				<%if(null!=hrID){ %>
				<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%}%>
					
				</td>
				<td width="558" valign="top">
				<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">资料列表</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
<form name="form"  action="" method=post>
<div id="contentborder" align="center">

<table border=0 cellspacing=0 cellpadding=0 class="small">
<tr class="titlename">
	<td width="10%">&nbsp;<b>选择</b></td>
	<td width="30%"><b>资料名称</b></td>
	<td width="20%"><b>消耗积分</b></td>
	<td width="15%"><b>文件大小</b></td>
	<td width="10%"><b>下载</b></td>
	
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	DocumentTO u = (DocumentTO)it.next();
%>
<tr>
	<td>&nbsp;<input type=radio name="documentID" value="<%=u.getDocumentID()%>"></td>
	<td><a href="FrontController.do?operation=documentquery&method=showone&documentID=<%=u.getDocumentID()%>"><%=u.getDocumentname()%></a></td>
    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%   switch (u.getIntegral())
             {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
              }%></td>
    <td><%=u.getSize()%>KB</td>
    <td><a href="FrontController.do?operation=documentdown&url=<%=u.getUrl()%>&totlenum=<%=to.getNum()%>&num=0">下载</a></td>
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
	<td colspan=6 align="center">第 <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> 页  共 <%=mypage.getRecordNum() %>条记录  
	<%if(mypage.getPageNum()==1) {
	%>
	首页&nbsp;&nbsp;
	上页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value="上传资料" onclick="add()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
<input type=button  value=" 查看 " onclick="show()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
<input type=button  value=" 删除 " onclick="del()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
</td></tr>

</table> 
<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
</form>
</td>
</tr>

</table>

<script>
function add(){
	document.form.action="FrontController.do?operation=documentadd&method=addItemHr";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=showone";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentdelete&method=delhr";
	document.form.submit();
}
</script>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>