<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />

<title>���Ϲ���</title>
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
            <td height="36" valign="top" class="titile">�����б�</td>
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
	<td width="10%">&nbsp;<b>ѡ��</b></td>
	<td width="30%"><b>��������</b></td>
	<td width="20%"><b>���Ļ���</b></td>
	<td width="15%"><b>�ļ���С</b></td>
	<td width="10%"><b>����</b></td>
	
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
    <td><a href="FrontController.do?operation=documentdown&url=<%=u.getUrl()%>&totlenum=<%=to.getNum()%>&num=0">����</a></td>
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
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='documentList.do?operation=documentquery&method=showhr&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
<input type=button  value="�ϴ�����" onclick="add()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
<input type=button  value=" �鿴 " onclick="show()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
<input type=button  value=" ɾ�� " onclick="del()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
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
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.documentID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=showone";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.documentID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=documentdelete&method=delhr";
	document.form.submit();
}
</script>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>