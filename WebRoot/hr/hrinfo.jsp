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
		<title>HR信息显示界面</title>
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
            <td height="36" valign="top" class="titile">个人信息</td>
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
						真实姓名
					</td>
					<td width="300">
						<%=ituser.getName()%>
					</td>
				</tr>
				<tr>
					<td>
						性&nbsp;&nbsp;&nbsp;&nbsp;别
					</td>
					<td>
						<%
							if (ituser.getSex() == 0)
								out.print("男士");
							if (ituser.getSex() == 1)
								out.print("女士");
						%>
					</td>
				</tr>
				<tr>
					<td>
						出生日期
					</td>
					<td>
						<%=ituser.getBorn()%>
					</td>
				</tr>

				<tr>
					<td>
						所在省份
					</td>
					<td>
						<%=helper.getProvince(ituser.getProvince())%>
					</td>
				</tr>
				<tr>
					<td>
						所在城市
					</td>
					<td>
						<%=helper.getCity(ituser.getProvince(),ituser.getCity())%>
					</td>
				</tr>
				<tr>
					<td>
						行&nbsp;&nbsp;&nbsp;&nbsp;业
					</td>
					<td>
						<%=helper.getCallingcomf(ituser.getCalling())%>
					</td>
				</tr>
				<tr>
					<td>
						联系地址
					</td>
					<td>
						<%=ituser.getAddress()%>
					</td>
				</tr>
				<tr>
					<td>
						固定电话
					</td>
					<td>
						<%=ituser.getTelephone()%>
					</td>
				</tr>
				<tr>
					<td>
						移动电话
					</td>
					<td>
						<%=ituser.getMobilephone()%>
					</td>
				</tr>
					<tr>
					<td>
					邮件
					</td>
					<td>
						<%=ituser.getEmail()%>
					</td>
				</tr>
				<tr>
					<td>
						公司名称
					</td>
					<td>
						<%=ituser.getCorporation()%>
					</td>
				</tr>
				<tr>
					<td>
						公司性质
					</td>
					<td>
						<%
							int kind = ituser.getCorpkind();
							if (kind == 1)
								out.print("国有企业");
							if (kind == 2)
								out.print("私营企业");
							if (kind == 3)
								out.print("外资独资企业");
							if (kind == 4)
								out.print("中外合资企业");
							if (kind == 0)
								out.print("其他");
						%>
					</td>
				</tr>
				<tr>
					<td>
						公司网站
					</td>
					<td>
						<%=ituser.getWebsite()%>
					</td>
				</tr>
				</table>
				<table width="400" border="0">
				<tr>
					<td width="100" valign="top">
						公司简介
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
