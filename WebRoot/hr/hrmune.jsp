<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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

		<title>HRĿ¼</title>

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
						<a href="hr/hrinfo.do?operation=qeueyhr" target="main">�鿴������Ϣ </a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="uphrinfo.do?operation=uphrinfo" target="main">������Ϣ�༭ </a>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div align="center">
						<a href="job/putjob.jsp" target="main">������Ƹ��Ϣ</a>
					</div>
				</td>
			</tr>
		<tr>
				<td>
					<div align="center">
						<a href="job/putjob.do?operation=showjob&pageNum=1" target="main">������Ƹ����</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="hr/commendit.jsp" target="main">�Ƽ��˲�</a>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						<a href="hr/uppassword.jsp" target="main">�޸�����</a>
					</div>
				</td>
			</tr>
			
		
		</table>

	</body>
</html>
