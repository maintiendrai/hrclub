<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
				<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<head>
	<%
String url = request.getContextPath();
%>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>求职管理界面</title>
</head>
<%
	Page mypage = (Page) request.getAttribute("mypage");
	List data = mypage.getData();
%>

<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
  
		 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td><td width="600" valign="top">	<table width=550  border="0" align="center">
    <tr>
        <td height="60" valign="middle" class="top01" ><table width="90%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">求职历史</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
<form name="form1" method="post" action="itmanger.do">


<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">

				<tr class="titlename">
					<td width="8%">选择</td>
					<td width="20%">招聘标题</td>
				
					<td width="15%">查看求职信</td>
					<td width="15%">求职时间</td>
					<td width="10%">状态</td>
					
				</tr>
				<%
					Iterator it = data.iterator();

					while (it.hasNext()) {
						JobletterTO u = (JobletterTO) it.next();
				%>

				<tr>

					<td><input type="checkbox" name="letterID" value=<%=u.getLetterID()%>></td>
					<td class="small">
						<a href='showjobleter.do?operation=queryjob&jobID=<%=u.getJobID()%>'>
					<%=u.getJobtitle()%> </a></td>
					
					<td class="small">
						<input type="hidden" name="useridh" value=<%=u.getLetterID()%>　>
						<a href="it/queryletter.do?operation=queryletter&sign=itsign&letterID=<%=u.getLetterID()%>">查看求职信</a>
					</td>
					<td class="small">
					 <%=u.getJobtime() %>
					</td>
					<td class="small">
						<%
								int status = u.getStatus();
								if (status == 0)
									out.println("未阅读");
								if (status == 1)
									out.println("已阅读");
						%>
					</td>
				
				</tr>
				<tr><td colspan="5"><hr> </td>
				</tr>
				<%}%>

				<tr><td><br></td></tr>
				<tr>
				    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">当前没有记录</td>
                	<%}else {%>  
					<td colspan=6 align="center">
						第<%=mypage.getPageNum()%>/<%=mypage.getPageCount()%>页 共<%=mypage.getRecordNum()%>条记录
						<%if (mypage.getPageNum() == 1) {%>
						首页&nbsp;&nbsp; 上页&nbsp;&nbsp;
						<%} else {%>
						<a href='showletter.do?operation=showletter&pageNum=1&pageLength=<%=mypage.getPageLength()%>'>首页</a>&nbsp;&nbsp;
						<a href='showletter.do?operation=showletter&pageNum=<%=mypage.getPageNum() - 1%>&pageLength=<%=mypage.getPageLength()%>'>上页</a>&nbsp;&nbsp;
						<%}%>

						<%if (mypage.getPageNum() == mypage.getPageCount()) {%>
						下页&nbsp;&nbsp; 末页&nbsp;&nbsp;
						<%} else {%>
						<a href='showletter.do?operation=showletter&pageNum=<%=mypage.getPageNum() + 1%>&pageLength=<%=mypage.getPageLength()%>'>下页</a>&nbsp;&nbsp;
						<a href='showletter.do?operation=showletter&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>末页</a>
						<%}}%>
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td colspan="4">
				
					<input type=button value=" 删除 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="delstate()" />
					<input type=button value=" 重发 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="startstate()" />
					</td>
				</tr>
</table>
<tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
 </form>
 </td>
 </tr>
 </table>
 
<script>
function delstate(){
	if(!isChecked(document.form1.letterID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=lettermanager&sign=delstate";
	document.form1.submit();
}
function startstate(){
	if(!isChecked(document.form1.letterID)){
		alert("请选择要重发的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=lettermanager&sign=startstate";
	document.form1.submit();
}

</script>

		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>


