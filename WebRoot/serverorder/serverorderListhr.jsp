<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
<title>���񶩵�����</title>
</head>
<body>
<%

Page mypage = (Page) request.getAttribute("mypage");
List data = mypage.getData();
 %>
 <% Object hrID=session.getAttribute("hrID");
 %>


	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>


		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
				<%if(null!=hrID){ %>
					
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%} %>
				</td>
				<td width="558" valign="top">
				<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�ҹ���ķ���</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  border="0" align="center">
<form name="form"  action="" method=post>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0  class="small">
<tr class="titlename">
	<td width="50">ѡ��</td>
	<td width="200">��������</td>
	<td width="75">����ʱ��</td>	
	<td width="75">��������</td>
	<td width="75">����״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	ServerorderTO u = (ServerorderTO)it.next();
%>
<tr>
	<td><input type=radio name="orderID" value="<%=u.getOderID()%>"></td>
	<td><a href="FrontController.do?operation=serverorderquery&orderID=<%=u.getOderID()%>"><%=u.getOrdertitle()%></a></td>
	<td><%=u.getBuytime()%></td>
    <td><%   switch(u.getKind())
             {
                     case 0:out.println("����");break;
                     case 1:out.println("��ҵ����");break;
                     case 2:out.println("��ѵ����");break;
                     case 3:out.println("������");break;
                     case 4:out.println("������ǲ");break;
                     case 5:out.println("��ͷ");break;         
             }%></td>
    <td><%   switch(u.getStatus())
             {
                     case 0:out.println("δ����");break;
                     case 1:out.println("�Ѵ���");break;
                     case 2:out.println("��ɾ��");break;
                     case 3:out.println("������");break; 
              }%></td>
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
	<a href='FrontController.do?operation=serverorderedit&method=list&pageNum=1&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='FrontController.do?operation=serverorderedit&method=list&pageNum=<%=mypage.getPageNum()-1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(mypage.getPageNum()==mypage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='FrontController.do?operation=serverorderedit&method=list&pageNum=<%=mypage.getPageNum()+1 %>&pageLength=<%=mypage.getPageLength() %>'>��ҳ</a>&nbsp;&nbsp;
	<a href='FrontController.do?operation=serverorderedit&method=list&pageNum=<%=mypage.getPageCount() %>&pageLength=<%=mypage.getPageLength() %>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=4>
<input type=button  value=" ���� " onclick="add()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
<input type=button  value=" �޸� "  onclick="edit()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
<input type=button  value=" ɾ�� "  onclick="del()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
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
	document.form.action="FrontController.do?operation=serverorderadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.orderID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderedit&method=editItemhr";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.orderID)){
		alert("��ѡ��Ҫ�鿴����Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderquery";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.orderID)){
		alert("��ѡ��Ҫɾ������Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=serverorderdelete&method=delhr";
	document.form.submit();
}
</script>
 

 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>