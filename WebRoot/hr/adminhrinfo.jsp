<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<html>
<head>
<script language="javascript" type="text/javascript" src="../js/datepicker/WdatePicker.js"></script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/country/change_region.js"></script>
<title>HR����</title>
</head>
<%
	HashMap listcall = helper.getCallingcomf();
	HRinfoTO ituser = new HRinfoTO();
	ituser = (HRinfoTO)request.getAttribute("to");
%>
<body>
	
<form name="form1" method="post" action="">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>HR������Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>  
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
   <tr>
     <td width="130">��ʵ����</td>
	 <td><%=ituser.getName()%></td>
   </tr>
   <tr>
        <td>�Ա�</td>
        <td><%
			   if (ituser.getSex() == 0)
				  out.print("��ʿ");
		       if (ituser.getSex() == 1)
			      out.print("Ůʿ");
	    	%>
    	</td>
	</tr>
	<tr>
		<td>��������</td>
		<td><%=ituser.getBorn()%></td>
	</tr>
	<tr>
		<td>����ʡ��</td>
		<td><%=helper.getProvince(ituser.getProvince())%></td>
	</tr>
	<tr>
		<td>���ڳ���</td>
		<td><%=helper.getCity(ituser.getProvince(),ituser.getCity())%></td>
	</tr>
	<tr>
		<td>��ҵ</td>
		<td><%=listcall.get(ituser.getCalling())%></td>
	</tr>
	<tr>
        <td>��ϵ��ַ</td>
		<td><%=ituser.getAddress()%></td>
	</tr>
	<tr>
		<td>�̶��绰</td>
		<td><%=ituser.getTelephone()%></td>
	</tr>
	<tr>
		<td>�ƶ��绰</td>
		<td><%=ituser.getMobilephone()%></td>
	</tr>
	<tr><td>��˾����</td>
		<td><%
				int kind = ituser.getCorpkind();
					if (kind == 1)
						out.print("������ҵ");
					if (kind == 2)
						out.print("˽Ӫ��ҵ");
					if (kind == 3)
						out.print("���ʶ�����ҵ");
					if (kind == 4)
						out.print("���������ҵ");
					if (kind == 0)
						out.print("����");
			%>
		</td>
	</tr>
	<tr><td>��˾����</td>
		<td><%=ituser.getCorporation()%></td>
	</tr>
	<tr>
		<td>��˾���</td>
		<td><%=ituser.getCorinfo()%></td>
	</tr>
	<tr>
		<td>��˾��վ</td>
		<td><%=ituser.getWebsite()%></td>
	</tr>
<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>
