<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript" src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

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
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��ְ��Ϣ�б�</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
<form name="form1" method="post" action="itmanger.do">

<table border=0 cellspacing=0 cellpadding=0  class="small">
			<tr>
				<td width="8%" class="titile"> ѡ��</td>
				<td width="18%" class="titile">��ְ��Ա</td>
				<td  width="18%"class="titile">�ظ���ְ��</td>
				<td width="8%"class="titile">״̬</td>
				<td width="18%" class="titile">�鿴ӦƸ����Ϣ</td>
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
									out.println("δ�Ķ�");
								if (status == 1)
									out.println("���Ķ�");
						%>
					</td>
				<td>
			<a href="queryletter.do?operation=queryletter&sign=hrsign&letterID=<%=u.getLetterID()%>&jobID=<%=u.getJobID()%>">�鿴��Ϣ</a>
				</td>
				<td>
			<a href="it/itbaseinfo.do?operation=itbaseinfo&sign=hrsign&userid=<%=u.getUserID()%>">�鿴ӦƸ����Ϣ</a>
			</td>
			</tr>
			<tr>
			<td colspan="5"><hr>
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
	<a href='showjobleter.do?operation=showjobleter&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='showjobleter.do?operation=showjobleter&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='showjobleter.do?operation=showjobleter&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr>
<td colspan="4">	
<input type="reset" name="reset"class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  value=" ���� "  onclick="history.back();">	
	<input type=button value=" ɾ�� " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
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
		alert("��ѡ��Ҫɾ������ְ�ţ�");
		return false;
	}
	document.form1.action="FrontController.do?operation=delleter";
	document.form1.submit();
}
</script>
</body>


