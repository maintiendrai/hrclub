<%@ page language="java"  import="com.hrclub.to.*,com.hrclub.model.Command" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
</head> 
<%
UserTO user = (UserTO)request.getAttribute("user");
%>

<body topmargin=0 leftmargin=0>
	<%@include file="Common.jsp"%>
		<table valign=top align=center width=870 cellSpacing=0 cellPadding=1
			border=0>

			<tr>
				<!-- ��1�У�����ҳ��logo������ -->
				<td>
					<%@include file="title.html"%>

				</td>
			</tr>
			<tr>
				<!-- ���������� -->
				<td>
				
				<table width=100%>
					<tr> 
						<td  width="100%" valign=top>
							<table   cellspacing="0" width="100%" align=center bordercolor="#000080" bordercolordark="#FFFFFF" border=1>
<tr>
<td colspan=2 align=center background='image/cb_blue.gif' >�û���Ϣ</td> 
</tr>
<tr>
<td>�û��ʺ�</td>
<td><%=user.getUserid()%>
<a
 href='<%=request.getContextPath()%>/sendMessage.jsp?receiver=<%=user.getUserid()%>&receiverType=2&receiverName=<%=user.getUsername()%>'>
 <img border=0 src='image/liuy.jpg'></a>
</td>
</tr>
<tr>
<td>�û�����</td>
<td><%=user.getUsername()%></td>
</tr>
<tr>
<td>�û����ͣ�</td>
<%
  int type=user.getType();
  String temp = "����";
  if(type==1) temp="��˾";
%>
<td><%=temp%></td>
</tr>
<tr>
<td>ʡ�ݣ�</td>
<td><%=user.getProvName()%></td>
</tr> 
<tr>
<td>���У�</td> 
<td><%=user.getCityName()%></td>
</tr> 
<tr>
<td>֤�����룺</td>
<td><%=user.getIdentifyCard()%></td>
</tr>
<tr>
<td>֤�����ͣ�</td>
<td><%=user.getIdentifyType()%></td>
</tr> 
<%   
		boolean flag=false;
		int ot = user.getOpenType();
		if (ot==4||intUsertype== Command.ADMIN_MANAGER||intUsertype== Command.ADMIN_ROOT) {
			 flag=true;
		}
		if (ot==3&&intUsertype!=-1) {
			 flag=true;
		}
		if (ot==2&&intUsertype==Command.EXPERT) {
			 flag=true;
		}
		if(flag){
%>
<tr>
<td>��ϵ��ַ��</td>
<td><%=user.getAddress()%></td>
</tr>
<tr>
<td>�������룺</td>
<td><%=user.getPostcode()%> </td>
</tr>
<tr>
<td>��ϵ�绰��</td>
<td><%=user.getTel()%></td>
</tr>
<tr>
<td>�ƶ��绰��</td>
<td><%=user.getMobile()%></td>
</tr>
<tr>
<td>���棺</td>
<td><%=user.getFax()%></td>
</tr>
<tr>
<td>E-MAIL��</td>
<td><%=user.getEmail()%></td>
</tr>
<tr>
<td>QQ �� MSN��</td>
<td><%=user.getQqmsn()%></td>
</tr>
<%		
		
		}
 %>
<tr>
<td>���˼�飺</td>
<td><%=user.getDesc()%></td>
</tr>
<tr>
<td colspan=2 align=center>
<input type=button value="����" onclick="history.back();">
</td>
</tr>
</table>
						</td>
					</tr>
				</table>
				
				
				</td>
			</tr>

			<tr>
				<!-- ��4�У���Ȩ��ע�� -->
				<td>
					<%@include file="foot.html"%>
				</td>
			</tr>
		</table>
	</body>
 
</html>
 
 