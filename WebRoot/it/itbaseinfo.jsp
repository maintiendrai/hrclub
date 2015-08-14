<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />

<%
String url = request.getContextPath();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<script src='<%=url%>/js/country/change_region.js'> </script>
		<script src='<%=url%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=url%>/js/ParamUtil.js'> </script>
		<link href="<%=request.getContextPath()%>/css/index.css"
			rel="stylesheet" type="text/css" />


		<title>所有IT人才信息</title>
	</head>
	<%
	ITUserTO ituser = (ITUserTO) request.getAttribute("itbaseto");
	%>
	<body>
		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/top.js"></script>
		</div>


		<table align="center" width="700">
			<tr>
				<td height="" width="100" valign="top">
					<%
						Object userid = session.getAttribute("userid");
						if (null != userid) {
					%>

					<iframe height="550" frameborder="0" scrolling="no"
						src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

					<%
					}
					%>
				</td>
				<td width="558" valign="top">
					<table border="0" align="center" width="558">
						<tr>
							<td height="60" valign="middle" class="top01">
								<table border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="36" valign="top" class="titile">
											基本信息
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr >
							<td class="text" >
								<table border="0" align="center">

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
													out.print("男");
											%>

											<%
													if (ituser.getSex() != 0)
													out.print("女");
											%>

										</td>
									</tr>
									<tr>
										<td>
											年&nbsp;&nbsp;&nbsp;&nbsp;龄
										</td>
										<td>

											<%=ituser.getAge()%>

										</td>
									</tr>
									<tr>
										<td>
											邮&nbsp;&nbsp;&nbsp;&nbsp;件
										</td>
										<td>

											<%=ituser.getEmail()%>

										</td>
									</tr>
									<tr>
										<td>
											出生日期
										</td>
										<td>

											<%=ituser.getBorn()%>
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

											<%=helper.getCity(ituser.getProvince(), ituser.getCity())%>

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
											邮&nbsp;&nbsp;&nbsp;&nbsp;编
										</td>
										<td>

											<%=ituser.getPost()%>

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

											<%=ituser.getMobiletphone()%>

										</td>
									</tr>

								</table>
							</td>
						</tr>
						<tr>
							<td>
								<img src="<%=url%>/images/main_3.gif" height="36" alt="" />
							</td>
						</tr>
						<tr>
							<td>
								<%
									ITUserSpecialityTO itusersp = new ITUserSpecialityTO();

									itusersp = (ITUserSpecialityTO) request.getAttribute("itspeto");
									if (itusersp == null) {
								%>
								<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
								 <a href="<%=url%>/it/itinfoedu.jsp">请完善专业求职意向信息</a>

								<%
								} else {
								%>
								<table border="0" align="left">

									<tr>
										<td height="60" valign="middle" class="top01" colspan="2">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td height="36" valign="top" class="titile">
														专业求职意向信息
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="text">
											<table border="0" align="center">

												<tr>
													<td width="100">
														简历名称
													</td>
													<td width="300">
														<%=itusersp.getNamekey()%>
													</td>
												</tr>
												<tr>
													<td>
														学&nbsp;&nbsp;&nbsp;&nbsp;历
													</td>
													<td>
														<%=helper.getDegree(itusersp.getDegree())%>
													</td>
												</tr>
												<tr>
													<td>
														毕业院校
													</td>
													<td>
														<%=itusersp.getSchool()%>
													</td>
												</tr>
												<tr>
													<td>
														所修专业
													</td>
													<td>
														<%=helper.getSpecialitycomf(itusersp.getSpecialityID())%>
													</td>
												</tr>
												<tr>
													<td>
														意向职位
													</td>
													<td>
														<%=helper.getMoreJobcomf(itusersp.getPositiontype())%>
													</td>
												</tr>
												<tr>
													<td>
														意向地点
													</td>
													<td>
														<%=helper.getCtiyname(itusersp.getCity())%>
													</td>
												</tr>
												<tr>
													<td>
														预期薪水
													</td>
													<td>
														<%=helper.getWage(itusersp.getWage())%>
													</td>
												</tr>
												<tr>
													<td>
														工作年限
													</td>
													<td>
														<%
																int year = itusersp.getWorkyear();
																if (year == 1)
																	out.print("在校学生");
																if (year == 2)
																	out.print("一年以内");
																if (year == 3)
																	out.print("一年以上");
																if (year == 4)
																	out.print("两年以上");
																if (year == 5)
																	out.print("三年以上");
																if (year == 6)
																	out.print("五年以上");
														%>

													</td>
												</tr>
												<tr>
													<td>
														工作类型
													</td>
													<td>
														<%
																int kind = itusersp.getKind();
																if (kind == 0)
																	out.print("不限");
																if (kind == 1)
																	out.print("全职");
																if (kind == 2)
																	out.print("兼职");
														%>
													</td>
												</tr>

												<tr>
													<td>
														教育经历
													</td>
													<td>
														<%=itusersp.getEducate()%>
													</td>
												</tr>
												<tr>
													<td>
														奖&nbsp;&nbsp;&nbsp;&nbsp;励
													</td>
													<td>
														<%=itusersp.getHortation()%>
													</td>
												</tr>
												<tr>
													<td>
														培训经历
													</td>
													<td>
														<%=itusersp.getTrain()%>
													</td>
												</tr>
												<tr>
													<td>
														自我评价
													</td>
													<td>
														<%=itusersp.getSelfvalue()%>
													</td>
												</tr>

											</table>
									<tr>
										<td>
											<img src="<%=url%>/images/main_3.gif" height="36" alt="" />
										</td>
									</tr>
								</table>
								<%
								}
								%>
							</td>

						</tr>

						<tr>
							<td>
								<%
									List listw = new ArrayList();
									listw = (List) request.getAttribute("listwork");
								%>

								<table border="0" align="left">


									<%
									if (listw.size() == 0) {
									%>
									<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
									<a href="<%=url%>/it/addwork.jsp">请完善你工作经历信息 </a>
									<%
									} else {
									%>
									<tr>
										<td height="60" valign="middle" class="top01" colspan="2">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td height="36" valign="top" class="titile">
														工作经历
													</td>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td class="text">
											<table " border="0" align="center">

												<%
												for (int i = 0; i < listw.size(); i++) {
												%>
												<tr>
													<td colspan="2">
														工作经历
														<%=i + 1%>
												</tr>
												<tr>
													<td width="100">
														工作地点
													</td>
													<td width="300">

														<%=((WorkexperienceTO) listw.get(i)).getAddress()%>

													</td>
												</tr>
												<tr>
													<td>
														公司名称
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getCompname()%>

													</td>
												</tr>
												<tr>
													<td>
														公司性质
													</td>
													<td>

														<%
																	int kind = ((WorkexperienceTO) listw.get(i)).getComkind();
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
														担任职位
													</td>
													<td>

														<%=helper.getJobcomf(((WorkexperienceTO) listw
									.get(i)).getPlace())%>

													</td>
												</tr>
												<tr>
													<td>
														开始时间
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getStarttime()%>

													</td>
												</tr>
												<tr>
													<td>
														离职时间
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getLevertime()%>

													</td>
												</tr>
												<tr>
													<td>
														工作简介
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getInfo()%>

													</td>
												</tr>

												<%
												}
												%>
												
											



											</table>
									<tr>
										<td>
											<img src="<%=url%>/images/main_3.gif" height="36" alt="" />
										</td>
									</tr>
										<%
												}
												%>
								</table>
							</td>
						</tr>

						<%
							List listp = new ArrayList();
							listp = (List) request.getAttribute("listpro");

							if (listp.size() == 0) {
						%>
						<tr>
							<td>
								<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
															<a href="<%=url%>/it/addproject.jsp">请完善你项目经验信息 </a>
							</td>
						</tr>
						<%
						} else {
						%>
						<tr>
							<td height="60" valign="middle" class="top01" colspan="2">
								<table  border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="36" valign="top" class="titile">
											项目经验
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="text">
								<table border="0" align="center">

									<%
									for (int i = 0; i < listp.size(); i++) {
									%>
									<tr>
										<td>
											<table border="0" align="left">
												<tr>
													<td colspan="2">
														项目经验
														<%=i + 1%>
													</td>
												</tr>

												<tr>
													<td width="100">
														项目名称
													</td>
													<td width="300">

														<%=((ProjectTO) listp.get(i)).getProjectname()%>

													</td>
												</tr>
												<tr>
													<td >
														开始时间
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getStarttime()%>

													</td>
												</tr>
												<tr>
													<td >
														完成时间
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getEndtime()%>

													</td>
												</tr>
												<tr>
													<td >
														硬件环境
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getHardware()%>

													</td>
												</tr>
												<tr>
													<td >
														软件环境
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getSoftware()%>

													</td>
												</tr>
												<tr>
													<td >
														项目规模
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getProjectsize()%>
														人/月

													</td>
												</tr>
												<tr>
													<td>
														担任职位
													</td>
													<td>
														<%=helper.getJobcomf(((ProjectTO) listp.get(i))
									.getPlace())%>
													</td>
												</tr>
												<tr>
													<td>
														项目简介
													</td>
													<td >

														<%=((ProjectTO) listp.get(i)).getProjectinfo()%>

													</td>
												</tr>

											</table>
											<%
											}
											%>
											<br>
										
								</table>
						<tr>
						<tr>
							<td>
								<img src="<%=url%>/images/main_3.gif" width="558" height="36"
									alt="" />
							</td>
						</tr>
	<%
											}
											%>
										

						<tr>
							<td>	<%
										List listc = new ArrayList();
										listc = (List) request.getAttribute("listcert");
										if (listc.size() == 0) {
									%>
								
										<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
															<a href="<%=url%>/it/itcertificate.jsp">请完善你证书信息 </a>

								
									<%
											} else {
											HashMap listcert = helper.getCertificateComf();
									%>
								<table  border="0" align="left">

								
									<tr>
										<td height="60" valign="middle" class="top01" colspan="2">
											<table  border="0" cellpadding="0"
												cellspacing="0">
												<tr>
													<td height="36" valign="top" class="titile">
														证书信息
													</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td class="text">
											<table   border="0" align="center">

												<tr>
													<td width="100">
														证书类型
													</td>
													<td width="100">

														证书名称

													</td>
													<td width="100">
														证书编码
													</td>
													<td width="100">
														成绩
													</td>
												</tr>

												<%
												for (int i = 0; i < listc.size(); i++) {
												%>
												<tr>
													<td height="35">


														<%
																	int kind = ((CertificateTO) listc.get(i)).getKind();
																	if (kind == 1)
																out.print("计算机");
																	if (kind == 2)
																out.print("外语");
																	if (kind == 3)
																out.print("管理");
																	if (kind == 4)
																out.print("职称");
																	if (kind == 0)
																out.print("其他");
														%>


													</td>
													<td>

														<%=listcert.get(new Integer(((CertificateTO) listc
									.get(i)).getCrertname()))%>

													</td>
													<td>

														<%=((CertificateTO) listc.get(i)).getNumber()%>

													</td>
													<td>

														<%=((CertificateTO) listc.get(i)).getGrade()%>

													</td>
												</tr>
												<%
												}
												%>
											</table>
									<tr>
									<tr>
										<td>
											<img src="<%=url%>/images/main_3.gif" width="558"
												height="36" alt="" />
										</td>
									</tr>

								</table>
							</td>
						</tr>
						<%
						}
						%>
						<%
							List listskill = new ArrayList();

							listskill = (List) request.getAttribute("listskill");
							if (listskill.size() == 0) {
						%>
						<tr>
							<td>
								<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle"> 
															<a href="<%=url%>/it/itskill.jsp">请完善你IT技能信息 </a>
							</td>
						</tr>
						<%
								} else {
								HashMap listsk = helper.getITskillcomf();
						%>
						<tr>
							<td height="60" valign="middle" class="top01" colspan="2">
								<table  border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="36" valign="top" class="titile">
											IT技能信息
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="text">
								<table  border="0" align="center">


									<tr>
										<td width="150">
											技能名称
										</td>
										<td width="150">
											
											掌握程度
										</td>
										<td width="150">

											使用时间(月)
										</td>
									</tr>
									<%
									for (int i = 0; i < listskill.size(); i++) {
									%>

									<tr>
										<td height="31">
											<%=listsk.get(new Integer(((ITskillTO) listskill
									.get(i)).getSkillnameID()))%>
										</td>
										<td>


											<%
														int kind = ((ITskillTO) listskill.get(i)).getDegree();

														if (kind == 1)
													out.print("精通");

														if (kind == 2)
													out.print("熟练");

														if (kind == 3)
													out.print("一般");

														if (kind == 4)
													out.print("了解");

														if (kind == 0)
													out.print("其他");
											%>
										</td>
										<td>
											<%=((ITskillTO) listskill.get(i)).getTime()%>
										</td>
									</tr>
									<%
									}
									%>

								</table>

							</td>
						</tr>

						<tr>
						<tr>
							<td>
								<img src="<%=url%>/images/main_3.gif" width="558" height="36"
									alt="" />
							</td>
						</tr>
						<%
						}
						%>


						<%
							List listl = new ArrayList();
							listl = (List) request.getAttribute("listilang");
							if (listl.size() == 0) {
						%>
						<tr>
							<td>
								<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle"> <a href="<%=url%>/it/itlanguage.jsp">请完善你外语信息 </a>
							</td>
						</tr>
						<%
								} else {
								HashMap map = helper.getLanguage();
						%>
						<tr>
							<td height="60" valign="middle" class="top01" colspan="2">
								<table  border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="36" valign="top" class="titile">
											外语信息
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="text">
								<table  border="0" align="center">




									<tr>
										<td width="200" >
											外语名称
										</td>
										<td width="200">

											掌握程度
										</td>
									</tr>
									<%
									for (int i = 0; i < listl.size(); i++) {
									%>
									<tr>
										<td >

											<%
														out.print(map.get(new Integer(((LanguageTO) listl.get(i))
														.getLanguagename())));
											%>
										</td>
										<td>

											<%
														int grade = ((LanguageTO) listl.get(i)).getGrade();

														if (grade == 1)
													out.print("精通");

														if (grade == 2)
													out.print("熟练");

														if (grade == 3)
													out.print("良好");
														if (grade == 4)
													out.print("一般");

														if (grade == 0)
													out.print("其他");
											%>

										</td>
									</tr>
   <%} %>
									
								</table>
							</td>
						</tr>
						<tr>
						<tr>
							<td>
								<img src="<%=url%>/images/main_3.gif" width="558" height="36"
									alt="" />
							</td>
						</tr>
						<%
								
										}
									%>
					</table>
				</td>
			</tr>

		</table>
		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/down.js"></script>
		</div>
	</body>
</html>
