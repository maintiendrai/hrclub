<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">

<title>招聘信息管理</title>
</head>
<%
	Page mypage = (Page) request.getAttribute("mypage");
    List data = mypage.getData();
%>

<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   	<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">招聘信息列表</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
<form name="form1" method="post" action="itmanger.do">
<div id="contentborder" align="center">

<table border=0 cellspacing=0 cellpadding=0  >
	<tr>
													<td class="px12" colspan="7" align="right">
														<img
															src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
														<a href="<%=request.getContextPath()%>/job/putjob.jsp">
															发布职位</a>
													</td>
												</tr>
			<tr class="titile">
				<td width="7%" class="titile">选择</td>
				<td width="15%" class="titile">职位标题</td>
				<td width="8%" class="titile">状态</td>
				<td width="15%" class="titile">职位类型</td>
				<td width="15%" class="titile">发布时间</td>
				<td width="8%" class="titile">人数</td>
				<td width="8%" class="titile">修改</td>
				<td width="17%" class="titile">查看求职者</td>
			</tr>
		
<%
	
Iterator it = data.iterator();

while(it.hasNext()){
	JobinfoTO u = (JobinfoTO)it.next();
%>
		
			<tr class="samll">
			    <td class="samll"><input type="checkbox" name="jobID" value=<%=u.getJobID()%>></td>
				<td class="samll">
				<a href='showjobleter.do?operation=queryjob&jobID=<%=u.getJobID()%>'>
				<%=u.getJobtitle()%></a></td>
				
				<td class="samll">
					<%  
					    int status=u.getStatus();
					    if(status==0) out.println("招聘中");
					    if(status==1) out.println("已招满");
					    if(status==2) out.println("已删除");   
					%>
				</td>
				<td class="samll">
					<%=helper.getJobcomf(u.getPositiontype())%>
				</td>
				<td class="samll" align="center">
					<%=u.getPuttime()%>
				</td>
				<td class="samll" align="center">
					<%=u.getNum()%>
				</td>
				<td class="samll"><a href='<%=request.getContextPath()%>/job/upjob.jsp?jobID=<%=u.getJobID()%>'>修改</a>
				</td>
				<td class="samll"><a href='showjobleter.do?operation=showjobleter&pageNum=1&jobID=<%=u.getJobID()%>'>查看求职者</a>
				</td>
				
			</tr>
			<tr>
			<td colspan="8">
			<hr>
			</td>
			</tr>
			<%}%>	
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
	<a href='showjob.do?operation=showjob&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=showjob&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjob.do?operation=showjob&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=showjob&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr>
<td colspan="6">
	<input type=button value=" 重发招聘 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"onClick="startstatus()" />	
	<input type=button value=" 停止招聘 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="stopstatus()" />			
	<input type=button value=" 删除招聘 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="delstatus()" />
</td>
</tr>
</table>
<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
 </form>
 </td>
 </tr>
 </table>
  <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
<script>

function delstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("请选择要IT人才！");
		return false;
	}
	document.form1.action="FrontController.do?operation=jobstatus&sign=del";
	document.form1.submit();
}
function stopstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("请选择要IT人才！");
		return false;
	}
	document.form1.action="FrontController.do?operation=jobstatus&sign=stop";
	document.form1.submit();
}
function startstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("请选择要IT人才！");
		return false;
	}
	document.form1.action="FrontController.do?operation=jobstatus&sign=start";
	document.form1.submit();
}
</script>
</body>


