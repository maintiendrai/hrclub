<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
<title>�����</title>
</head>
<body>
<%
	Object useid = session.getAttribute("userid");
			Object hrID = session.getAttribute("hrID");

Page movementpage = (Page) request.getAttribute("mypage");
String memberID = (String)request.getAttribute("memberID");
String kind = (String)request.getAttribute("kind");
List data = movementpage.getData();
 %>
  <%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
 	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

 <table align="center" width="700">
			<tr>
				<td width="100" valign="top">
					<%
					if (null != useid) {
					%>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
					<%
					} else if (null != hrID) {
					%>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					
					<%
					}
					%>
				</td>
				<td width="558" valign="top">
					<table align="center">
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�Ѳ���Ļ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
                                      
<form name="form"  action="" method=post>

<table border=0 cellspacing=0 cellpadding=0 width="90%" class="small">
<tr class="titlename">
	<td width="25%">�����</td>
	<td width="20%">����ʱ��</td>
	<td width="10%">״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementactorTO u = (MovementactorTO)it.next();
%>
<tr>
    <td><li><a href= "FrontController.do?operation=movementquery&method=show&moveID=<%=u.getMoveID()%>"><%=u.getTitle()%></a></td>
	<td><%=u.getStarttime()%></td>
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("�ѱ���");break;
                    case 1:out.println("����׼");break;
              }%>
    </td> 
</tr>
<tr> <td colspan="3"><hr></td>
</tr>
<%
}
 %>
<tr><td><br></td></tr>
<tr>
    <%if(movementpage.getPageCount()==0) {%><td colspan=6 align="center">��ǰû�м�¼</td>
	<%}else {%>
	<td colspan=8 align="center">�� <%=movementpage.getPageNum() %>/<%=movementpage.getPageCount() %> ҳ  �� <%=movementpage.getRecordNum() %>����¼  
	<%if(movementpage.getPageNum()==1) {
	%>
	��ҳ&nbsp;&nbsp;
	��ҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=1&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='movactorList.do?operation=movactorlist&memberID=<%=memberID%>&kind=<%=kind%>&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value=" ���� "class=btn1_mouseout onMouseOver="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="search()">
</td></tr>
</table> 
</form>
				  <tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
				</table></td>
				</tr>
				</table>
				

<script>
function search(){

	document.form.action="movementactor.do?operation=movementlistlimt&pageNum=1";                     
	document.form.submit();
}
</script>


	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>

</body>
</html>