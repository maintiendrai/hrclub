<%@ page language="java" import="com.hrclub.to.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />

<html>
	<head>
		<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>
		<title>IT信息显示界面</title>

	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
	</head>
	<body>
		<%
			String userid = (String) session.getAttribute("userid");
			ITUserTO ituser = new ITUserTO();
			ituser = helper.selectITUser(userid);
		%>
		
	<div align="center"><script language="javascript" type="text/javascript" src="/hrclub/js/top.js"></script></div>

 

		 <table align="center" width="700">
   <tr>
   <td width="100" valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
   </td><td width="600" valign="top">
 <table width="600" align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">个人基本信息</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="600" height="192" border="0" align="center">
   
		<form id="form1" name="form1" method="post" action="itinfoup.do">
			<table width="600" height="192" border="0" align="center">
				<tr>
					<td width="102">
						真实姓名
					</td>
					<td width="231">
						<label>
							<%=ituser.getName()%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						性别
					</td>
					<td>
						<label>
							<%
									if (ituser.getSex() == 0)
									out.print("男");
							%>

						</label>
						<label>
							<%
									if (ituser.getSex() != 0)
									out.print("女");
							%>

						</label>
					</td>
				</tr>
				<tr>
					<td>
						年龄
					</td>
					<td>
						<label>
							<%=ituser.getAge()%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						邮件
					</td>
					<td>
						<label>
							<%=ituser.getEmail()%>
						</label>

					</td>
				</tr>
				<tr>
					<td>
						出生日期
					</td>
					<td>
						<label>
							<%=ituser.getBorn()%>
						</label>
				</tr>
				<tr>
					<td>
						所在省份
					</td>
					<td>
						<label>
							<%=helper.getProvince(ituser.getProvince())%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						所在城市
					</td>
					<td>
						<label>
							<%=helper.getCity(ituser.getProvince(),ituser.getCity())%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						联系地址
					</td>
					<td>
						<label>
							<%=ituser.getAddress()%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						邮编
					</td>
					<td>
						<label>
							<%=ituser.getPost()%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						固定电话
					</td>
					<td>
						<label>
							<%=ituser.getTelephone()%>
						</label>
					</td>
				</tr>
				<tr>
					<td>
						移动电话
					</td>
					<td>
						<label>
							<%=ituser.getMobiletphone()%>
						</label>
					</td>
				</tr>

			</table>
			
					  <tr>
        <td><img src="/hrclub/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
			
		</form>
		</td>
		</tr>
		</table>
		


	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
		
	</body>
</html>
