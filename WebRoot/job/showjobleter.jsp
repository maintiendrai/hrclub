<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

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
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">求职信息列表</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
<form name="form1" method="post" action="itmanger.do">

<table border=0 cellspacing=0 cellpadding=0  class="small">
			<tr>
				<td width="8%" class="titile"> 选择</td>
				<td width="18%" class="titile">求职人员</td>
				<td  width="18%"class="titile">回复求职信</td>
				<td width="8%"class="titile">状态</td>
				<td width="18%" class="titile">查看应聘人信息</td>
			</tr>
<%
	
Iterator it = data.iterator();

while(it.hasNext()){
	JobletterTO u = (JobletterTO)it.next();
%>
		
			<tr>
			    <td><input type="checkbox" name="letterID" value=<%=u.getLetterID()%>>
			     <input type="hidden" name="jobID" value="<%=u.getJobID() %>" />
			    </td>
			   
				<td>
					<a href="it/itbaseinfo.do?operation=itbaseinfo&sign=hrsign&userid=<%=u.getUserID()%>">	<%=u.getUserID() %></a>
				</td>
					<td>
						<%
								int status = u.getStatus();
								if (status == 0)
									out.println("未阅读");
								if (status == 1)
									out.println("已阅读");
						%>
					</td>
				<td>
			<a href="queryletter.do?operation=queryletter&sign=hrsign&letterID=<%=u.getLetterID()%>&jobID=<%=u.getJobID()%>">查看信息</a>
				</td>
				<td>
			<a href="it/itbaseinfo.do?operation=itbaseinfo&sign=hrsign&userid=<%=u.getUserID()%>">查看应聘人信息</a>
			</td>
			</tr>
			<tr>
			<td colspan="5"><hr>
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
	<a href='showjobleter.do?operation=showjobleter&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>首页</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>上页</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	下页&nbsp;&nbsp;
	末页&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjobleter.do?operation=showjobleter&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>下页</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>末页</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr>
<td colspan="4">	
<input type="reset" name="reset"class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  value=" 返回 "  onclick="history.back();">	
	<input type=button value=" 删除 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="delleter()" />
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

function delleter(){
	if(!isChecked(document.form1.letterID)){
		alert("请选择要删除的求职信！");
		return false;
	}
	document.form1.action="FrontController.do?operation=delleter";
	document.form1.submit();
}
</script>
</body>


