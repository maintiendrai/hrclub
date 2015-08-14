<%@ page language="java" import="java.util.*,com.hrclub.to.ProjectTO"
	pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />

<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/index.css"
			rel="stylesheet" type="text/css" />

		<%
		String url = request.getContextPath();
		%>

		<title>显示项目经验</title>

	</head>
	<%
		String userid = (String) session.getAttribute("userid");
		if (null == userid) {

			response.sendRedirect("../it/itlogin.jsp");

		} else {
	%>
	<body>

		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/top.js"></script>
		</div>

		<table width="776" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<table width="218" border="0" align="left" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<iframe height="550" frameborder="0" scrolling="no"
									src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
							</td>
						</tr>

					</table>
					<table width="558" border="0" align="right" cellpadding="0"
						cellspacing="0" >
						<tr>
							<td>
								<table width="558" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="60" align="left" valign="top"
											background="<%=request.getContextPath()%>/images/main_1.gif">
											<img src="<%=request.getContextPath()%>/images/ba-xmjy.jpg"
												width="181" height="49">
										</td>
									</tr>
									<tr>
										<td
											background="<%=request.getContextPath()%>/images/main_2.gif">

											<%
													List lists = new ArrayList();
													lists = helper.getListProject(userid);
													HashMap list = new HashMap();
													list = helper.getJobcomf();
											%>
											<table width="500" height="25" border="0" align="center"
												cellpadding="0" cellspacing="0">
												<tr>
													<td class="px12">
														<img
															src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
														<a href="<%=request.getContextPath()%>/it/addproject.jsp">
															增加项目</a>
													</td>
												</tr>
											</table>


											<form id="form1" name="form1" method="post" action="">

												<%
												for (int i = 0; i < lists.size(); i++) {
												%>
												<table width="500" align="center" cellpadding="4"
													cellspacing="0" class="px12">
													<tr>
														<td class="px12" width="100">
															·项目名称:
														</td>
														<td class="px12">
															<%=((ProjectTO) lists.get(i)).getProjectname()%>
														</td>
													</tr>
													<tr>
														<td class="px12">
															·开始时间:
														</td>
														<td>
															<%=((ProjectTO) lists.get(i)).getStarttime()%>
														</td>
													</tr>
													<tr>
														<td>
															·完成时间:
														</td>
														<td>
															<%=((ProjectTO) lists.get(i)).getEndtime()%>
														</td>
													</tr>
													<tr>
														<td>
															·硬件环境:
														</td>
														<td>
															<%=((ProjectTO) lists.get(i)).getHardware()%>
														</td>
													</tr>
													<tr>
														<td>
															·软件环境:
														</td>
														<td>
															<%=((ProjectTO) lists.get(i)).getSoftware()%>
														</td>
													</tr>
													<tr>
														<td>
															·项目规模:
														</td>
														<td>
															<%=((ProjectTO) lists.get(i)).getProjectsize()%>
															人/月
														</td>
													</tr>
													<tr>
														<td>
															·担任职位:
														</td>
														<td>
															<%=helper.getJobcomf(((ProjectTO) lists.get(i))
									.getPlace())%>
														</td>
													</tr>
													<tr>
														<td>
															·项目简介:
														</td>
														<td>
															<%=((ProjectTO) lists.get(i)).getProjectinfo()%>
														</td>
													</tr>
													<tr>
														<td>
															<input type="hidden" name="projectID"
																value=<%=((ProjectTO) lists.get(i)).getProjectID()%> />
														</td>
														<td align="right">
															<a
																href="upproject.jsp?projectID=<%=((ProjectTO) lists.get(i)).getProjectID()%>">&lt;修改项目&gt;
															</a>
															<a
																href="delproject.do?operation=delproject&projectID=<%=((ProjectTO) lists.get(i)).getProjectID()%>">
																&lt;删除项目&gt; </a>

														</td>
													</tr>
												</table>
									</form>
									<%
									}
									%>

									<tr>
										<td>
											<img src="<%=url%>/images/main_3.gif" width="558"
												height="36" alt="" />
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table width="785" border="0" align="center" cellpadding="0"
			cellspacing="0">
		</table>
		<%
		}
		%>


		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/down.js"></script>
		</div>
	</body>

</html>
