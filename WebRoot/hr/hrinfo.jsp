<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
	
		<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>
		<title>HR��Ϣ��ʾ����</title>
	</head>
	<%
		HashMap listcall = helper.getCallingcomf();
		HRinfoTO ituser = new HRinfoTO();
		ituser = (HRinfoTO)request.getAttribute("to");
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
            <td height="36" valign="top" class="titile">������Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
			   
		<form name="form1" method="post" action="">
			
			<table width="400" height="192" border="0">
				<tr>
					<td width="100">
						��ʵ����
					</td>
					<td width="300">
						<%=ituser.getName()%>
					</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						<%
							if (ituser.getSex() == 0)
								out.print("��ʿ");
							if (ituser.getSex() == 1)
								out.print("Ůʿ");
						%>
					</td>
				</tr>
				<tr>
					<td>
						��������
					</td>
					<td>
						<%=ituser.getBorn()%>
					</td>
				</tr>

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
						<%=helper.getCallingcomf(ituser.getCalling())%>
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
						�ƶ��绰
					</td>
					<td>
						<%=ituser.getMobilephone()%>
					</td>
				</tr>
					<tr>
					<td>
					�ʼ�
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
