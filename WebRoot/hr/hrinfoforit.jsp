<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<html>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<title>��˾��Ϣ��ʾ����</title>
	</head>
	<%
	     Object useid=session.getAttribute("userid");
  Object hrID=session.getAttribute("hrID");
		HashMap listcall = helper.getCallingcomf();
		HRinfoTO ituser = new HRinfoTO();
		ituser = (HRinfoTO)request.getAttribute("to");
	%>
	<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 
	<table align="center" width="700">
 <tr>
   <td width="100"  valign="top">
    <% if (null !=useid){ %><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
     <%}else if(null!=hrID){ %>	<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe><%} %>
   </td><td width="600">
   
			<table width="600"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��˾��Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			   
		<form name="form1" method="post" action="">
			
			<table width="400" height="192" border="0">
			
			

				<tr>
					<td>
						����ʡ��
					</td>
					<td>
						<%=helper.getProvince(ituser.getProvince())%>
					</td>
				</tr>
				<tr>
					<td>
						���ڳ���
					</td>
					<td>
						<%=helper.getCity(ituser.getProvince(),ituser.getCity())%>
					</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;ҵ
					</td>
					<td>
						<%=listcall.get(ituser.getCalling())%>
					</td>
				</tr>
				<tr>
					<td>
						��ϵ��ַ
					</td>
					<td>
						<%=ituser.getAddress()%>
					</td>
				</tr>
				<tr>
					<td>
						�̶��绰
					</td>
					<td>
						<%=ituser.getTelephone()%>
					</td>
				</tr>
		
					<tr>
					<td>
					��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						<%=ituser.getEmail()%>
					</td>
				</tr>
				<tr>
					<td>
						��˾����
					</td>
					<td>
						<%=ituser.getCorporation()%>
					</td>
				</tr>
				<tr>
					<td>
						��˾����
					</td>
					<td>
						<%
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
				<tr>
					<td>
						��˾��վ
					</td>
					<td>
						<%=ituser.getWebsite()%>
					</td>
				</tr>
				</table>
				<table width="400" border="0">
				<tr>
					<td width="100" valign="top">
						��˾���
					</td>
					<td>
						<%=ituser.getCorinfo()%>
					</td>
				</tr>
				
	         <tr>
					<td >
					<input type="reset" name="reset" value=" ���� "
									class=btn1_mouseout
									onmouseover="this.className='btn1_mouseover'"
									onmouseout="this.className='btn1_mouseout'"
									onclick="history.back();">
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
