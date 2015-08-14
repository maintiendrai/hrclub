<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'mune.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>

	<body>


		<table width="170" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					<div align="center">
						<a href="itbaseinfo.do?operation=itbaseinfo" target="main">查看个人信息 </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="itinfo.do?operation=upitinfo" target="main">基础信息编辑 </a>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div align="center">
						<a href="itinfoedu.do?operation=itinfoedu" target="main">专业信息编辑</a>
					</div>
				</td>
			</tr>
			<tr>

				<td>
					<div align="center">
						<a href="it/workexperience.jsp" target="main">工作经历信息</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itproject.jsp" target="main">项目经验信息</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itcertificate.jsp" target="main">证书信息信息 </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itskill.jsp" target="main">IT技能信息 </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itlanguage.jsp" target="main">外语信息信息 </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/uppassword.jsp" target="main">修改密码 </a>
					</div>
				</td>
			</tr>
		</table>

	</body>
</html>
