<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>��Ϣ����</title>
</head>
<body>
<%
   Object useid=session.getAttribute("userid");
     Object hrID=session.getAttribute("hrID");
   
Page mypage = (Page) request.getAttribute("mypage");
List data = mypage.getData();
 %>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
  <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
    <% if (null !=useid){ %>
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
     <%}else if(null!=hrID){ %><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe><%} %>
   </td><td width="558" valign="top">
 	<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��Ϣ�б�</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  border="0" align="center">
			   
<form name="form"  action="" method=post>


<table border=0 cellspacing=0 cellpadding=0 class="small">
<tr>
	<td width="300"><b>��Ϣ����</b></td>
	<td width="200"><b>��Ϣ����</b></td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MessageTO u = (MessageTO)it.next();
%>
<tr>
<input type=hidden name="messageID" value="<%=u.getMessageID()%>">
	<td><li><a href="FrontController.do?operation=messagequery&method=show&messageID=<%=u.getMessageID()%>"><%=u.getSubject()%></a></td>
    <td><%   switch (u.getKind())
                            {
                               case 0:out.println("����");break;
                               case 1:out.println("����");break;
                               case 2:out.println("HR����");break;
                               case 3:out.println("IT�˲Ź���");break;
                            }%>
    </td> 
</tr>
<tr><td><br></td></tr>
<%
}
 %>
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
	<a href='messageList.do?operation=messagelistlimt&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelistlimt&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='messageList.do?operation=messagelistlimt&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='messageList.do?operation=messagelistlimt&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
 <tr>   
      <td colspan="2">
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
</body>
</html>