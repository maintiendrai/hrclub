<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<title>�����</title>
<script>
function add(){
	document.form.action="FrontController.do?operation=movementactoradd&method=add";
	document.form.submit();
}
</script>
</head>

<body>
<%
   MovementTO to = (MovementTO)request.getAttribute("to");
   Page movementpage = (Page) request.getAttribute("page");
   List data = movementpage.getData();
%>

<form id="form" name="form" method="post" action="">
<input type="hidden" name="status"  value="<%=to.getStatus()%>"/>
<input type="hidden" name="moveID"  value="<%=to.getMoveID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>��鿴</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">�����</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>����������</td>
      <td><% switch (to.getIntegral())
             {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
              }%></td>
    </tr>
    <tr>
      <td >�����ʱ��</td>
      <td><%=to.getPuttime()%></td>
    </tr>
    <tr>
      <td>���ʼʱ��</td>
      <td><%=to.getStarttime()%></td>
    </tr>
    <tr>
      <td>�����ʱ��</td>
      <td><%=to.getEndtime()%></td>
    </tr>
    <tr>
      <td>�״̬</td>
      <td><% switch (to.getStatus())
             {
                    case 0:out.println("������");break;
                    case 1:out.println("��ֹͣ");break;
                    case 2:out.println("��ɾ��");break;
              }%></td>
    </tr>
    <tr>
      <td>�����</td>
      <td><%=to.getContext()%></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
 <tr>
	<td width="10%">ѡ��</td>
	<td width="15%">����</td>
	<td width="15%">������</td>
	<td width="15%">����������</td>
	<td width="20%">����ʱ��</td>
	<td width="10%">������״̬</td>
</tr>
<%

Iterator it = data.iterator();

while(it.hasNext()){
	MovementactorTO u = (MovementactorTO)it.next();
%>
<tr>
	<td><input type=checkbox name="maID" value="<%=u.getMaID()%>"></td>
	<td><%=u.getMoveID()%></td>
	<td><%if (u.getKind()==1) {%>
	     <a href="../hr/hrinfo.do?operation=qeueyhr&sign=sign&hrID=<%=u.getMemberID()%>" ><%=u.getMemberID()%></a>
	    <%} else { %>
	     <a href="../it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getMemberID()%>"><%=u.getMemberID()%></a>
	    <%} %>
	</td>
	<td><%   switch (u.getKind())
             {
                    case 1:out.println("HR");break;
                    case 2:out.println("IT�˲�");break;
              }%>
	</td>
	<td><%=u.getStarttime()%></td>
	<td><%   switch (u.getStatus())
             {
                    case 0:out.println("�ѱ���");break;
                    case 1:out.println("����׼");break;
              }%>
    </td> 
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
	<a href='FrontController.do?operation=movequery&method=show&pageNum=1&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>��ҳ</a>&nbsp;&nbsp;
	<a href='FrontController.do?operation=movequery&method=show&pageNum=<%=movementpage.getPageNum()-1 %>&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>��ҳ</a>&nbsp;&nbsp;
	<%
	}%>
	
	 
	
	<%if(movementpage.getPageNum()==movementpage.getPageCount()) {
	%>
	��ҳ&nbsp;&nbsp;
	ĩҳ&nbsp;&nbsp;
	<%
	}else{
	%>
	<a href='FrontController.do?operation=movequery&method=show&pageNum=<%=movementpage.getPageNum()+1 %>&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>��ҳ</a>&nbsp;&nbsp;
	<a href='FrontController.do?operation=movequery&method=show&pageNum=<%=movementpage.getPageCount() %>&pageLength=<%=movementpage.getPageLength() %>&moveID=<%=to.getMoveID()%>'>ĩҳ</a>
	<%
	}}%> 
	
	</td>
</tr>
<tr><td colspan=2>
        <input type=button  value=" ���� " class="button" onclick="change()">
        <input type="reset" name="reset" value=" ���� " class="button" onclick="history.back();">
</td></tr>
</table>   
</form>
<script>
function change(){
	if(!isChecked(document.form.maID)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form.action="FrontController.do?operation=statuschangepart&moveID=<%=to.getMoveID()%>";
	document.form.submit();
}
</script>
</body>
</html>
