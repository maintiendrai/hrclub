<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">

<title>��Ƹ��Ϣ����</title>
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
            <td height="36" valign="top" class="titile">��Ƹ��Ϣ�б�</td>
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
															����ְλ</a>
													</td>
												</tr>
			<tr class="titile">
				<td width="7%" class="titile">ѡ��</td>
				<td width="15%" class="titile">ְλ����</td>
				<td width="8%" class="titile">״̬</td>
				<td width="15%" class="titile">ְλ����</td>
				<td width="15%" class="titile">����ʱ��</td>
				<td width="8%" class="titile">����</td>
				<td width="8%" class="titile">�޸�</td>
				<td width="17%" class="titile">�鿴��ְ��</td>
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
					    if(status==0) out.println("��Ƹ��");
					    if(status==1) out.println("������");
					    if(status==2) out.println("��ɾ��");   
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
				<td class="samll"><a href='<%=request.getContextPath()%>/job/upjob.jsp?jobID=<%=u.getJobID()%>'>�޸�</a>
				</td>
				<td class="samll"><a href='showjobleter.do?operation=showjobleter&pageNum=1&jobID=<%=u.getJobID()%>'>�鿴��ְ��</a>
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
    <%if(mypage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=6 align="center">�� <%=mypage.getPageNum() %>/<%=mypage.getPageCount() %> ҳ  �� <%=mypage.getRecordNum() %>����¼  
	<%if(mypage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjob.do?operation=showjob&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=showjob&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjob.do?operation=showjob&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjob.do?operation=showjob&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr>
<td colspan="6">
	<input type=button value=" �ط���Ƹ " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"onClick="startstatus()" />	
	<input type=button value=" ֹͣ��Ƹ " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="stopstatus()" />			
	<input type=button value=" ɾ����Ƹ " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
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
		alert("��ѡ��ҪIT�˲ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=jobstatus&sign=del";
	document.form1.submit();
}
function stopstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("��ѡ��ҪIT�˲ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=jobstatus&sign=stop";
	document.form1.submit();
}
function startstatus(){
	if(!isChecked(document.form1.jobID)){
		alert("��ѡ��ҪIT�˲ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=jobstatus&sign=start";
	document.form1.submit();
}
</script>
</body>


