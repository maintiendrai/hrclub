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
						<a href="itbaseinfo.do?operation=itbaseinfo" target="main">�鿴������Ϣ </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="itinfo.do?operation=upitinfo" target="main">������Ϣ�༭ </a>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div align="center">
						<a href="itinfoedu.do?operation=itinfoedu" target="main">רҵ��Ϣ�༭</a>
					</div>
				</td>
			</tr>
			<tr>

				<td>
					<div align="center">
						<a href="it/workexperience.jsp" target="main">����������Ϣ</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itproject.jsp" target="main">��Ŀ������Ϣ</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itcertificate.jsp" target="main">֤����Ϣ��Ϣ </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itskill.jsp" target="main">IT������Ϣ </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/itlanguage.jsp" target="main">������Ϣ��Ϣ </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="it/uppassword.jsp" target="main">�޸����� </a>
					</div>
				</td>
			</tr>
		</table>

	</body>
</html>
