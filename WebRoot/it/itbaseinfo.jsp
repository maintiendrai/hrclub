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


		<title>����IT�˲���Ϣ</title>
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
											������Ϣ
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
													out.print("��");
											%>

											<%
													if (ituser.getSex() != 0)
													out.print("Ů");
											%>

										</td>
									</tr>
									<tr>
										<td>
											��&nbsp;&nbsp;&nbsp;&nbsp;��
										</td>
										<td>

											<%=ituser.getAge()%>

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
											��������
										</td>
										<td>

											<%=ituser.getBorn()%>
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

											<%=helper.getCity(ituser.getProvince(), ituser.getCity())%>

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
											��&nbsp;&nbsp;&nbsp;&nbsp;��
										</td>
										<td>

											<%=ituser.getPost()%>

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
								 <a href="<%=url%>/it/itinfoedu.jsp">������רҵ��ְ������Ϣ</a>

								<%
								} else {
								%>
								<table border="0" align="left">

									<tr>
										<td height="60" valign="middle" class="top01" colspan="2">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td height="36" valign="top" class="titile">
														רҵ��ְ������Ϣ
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
														��������
													</td>
													<td width="300">
														<%=itusersp.getNamekey()%>
													</td>
												</tr>
												<tr>
													<td>
														ѧ&nbsp;&nbsp;&nbsp;&nbsp;��
													</td>
													<td>
														<%=helper.getDegree(itusersp.getDegree())%>
													</td>
												</tr>
												<tr>
													<td>
														��ҵԺУ
													</td>
													<td>
														<%=itusersp.getSchool()%>
													</td>
												</tr>
												<tr>
													<td>
														����רҵ
													</td>
													<td>
														<%=helper.getSpecialitycomf(itusersp.getSpecialityID())%>
													</td>
												</tr>
												<tr>
													<td>
														����ְλ
													</td>
													<td>
														<%=helper.getMoreJobcomf(itusersp.getPositiontype())%>
													</td>
												</tr>
												<tr>
													<td>
														����ص�
													</td>
													<td>
														<%=helper.getCtiyname(itusersp.getCity())%>
													</td>
												</tr>
												<tr>
													<td>
														Ԥ��нˮ
													</td>
													<td>
														<%=helper.getWage(itusersp.getWage())%>
													</td>
												</tr>
												<tr>
													<td>
														��������
													</td>
													<td>
														<%
																int year = itusersp.getWorkyear();
																if (year == 1)
																	out.print("��Уѧ��");
																if (year == 2)
																	out.print("һ������");
																if (year == 3)
																	out.print("һ������");
																if (year == 4)
																	out.print("��������");
																if (year == 5)
																	out.print("��������");
																if (year == 6)
																	out.print("��������");
														%>

													</td>
												</tr>
												<tr>
													<td>
														��������
													</td>
													<td>
														<%
																int kind = itusersp.getKind();
																if (kind == 0)
																	out.print("����");
																if (kind == 1)
																	out.print("ȫְ");
																if (kind == 2)
																	out.print("��ְ");
														%>
													</td>
												</tr>

												<tr>
													<td>
														��������
													</td>
													<td>
														<%=itusersp.getEducate()%>
													</td>
												</tr>
												<tr>
													<td>
														��&nbsp;&nbsp;&nbsp;&nbsp;��
													</td>
													<td>
														<%=itusersp.getHortation()%>
													</td>
												</tr>
												<tr>
													<td>
														��ѵ����
													</td>
													<td>
														<%=itusersp.getTrain()%>
													</td>
												</tr>
												<tr>
													<td>
														��������
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
									<a href="<%=url%>/it/addwork.jsp">�������㹤��������Ϣ </a>
									<%
									} else {
									%>
									<tr>
										<td height="60" valign="middle" class="top01" colspan="2">
											<table border="0" cellpadding="0" cellspacing="0">
												<tr>
													<td height="36" valign="top" class="titile">
														��������
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
														��������
														<%=i + 1%>
												</tr>
												<tr>
													<td width="100">
														�����ص�
													</td>
													<td width="300">

														<%=((WorkexperienceTO) listw.get(i)).getAddress()%>

													</td>
												</tr>
												<tr>
													<td>
														��˾����
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getCompname()%>

													</td>
												</tr>
												<tr>
													<td>
														��˾����
													</td>
													<td>

														<%
																	int kind = ((WorkexperienceTO) listw.get(i)).getComkind();
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
														����ְλ
													</td>
													<td>

														<%=helper.getJobcomf(((WorkexperienceTO) listw
									.get(i)).getPlace())%>

													</td>
												</tr>
												<tr>
													<td>
														��ʼʱ��
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getStarttime()%>

													</td>
												</tr>
												<tr>
													<td>
														��ְʱ��
													</td>
													<td>

														<%=((WorkexperienceTO) listw.get(i)).getLevertime()%>

													</td>
												</tr>
												<tr>
													<td>
														�������
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
															<a href="<%=url%>/it/addproject.jsp">����������Ŀ������Ϣ </a>
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
											��Ŀ����
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
														��Ŀ����
														<%=i + 1%>
													</td>
												</tr>

												<tr>
													<td width="100">
														��Ŀ����
													</td>
													<td width="300">

														<%=((ProjectTO) listp.get(i)).getProjectname()%>

													</td>
												</tr>
												<tr>
													<td >
														��ʼʱ��
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getStarttime()%>

													</td>
												</tr>
												<tr>
													<td >
														���ʱ��
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getEndtime()%>

													</td>
												</tr>
												<tr>
													<td >
														Ӳ������
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getHardware()%>

													</td>
												</tr>
												<tr>
													<td >
														�������
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getSoftware()%>

													</td>
												</tr>
												<tr>
													<td >
														��Ŀ��ģ
													</td>
													<td>

														<%=((ProjectTO) listp.get(i)).getProjectsize()%>
														��/��

													</td>
												</tr>
												<tr>
													<td>
														����ְλ
													</td>
													<td>
														<%=helper.getJobcomf(((ProjectTO) listp.get(i))
									.getPlace())%>
													</td>
												</tr>
												<tr>
													<td>
														��Ŀ���
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
															<a href="<%=url%>/it/itcertificate.jsp">��������֤����Ϣ </a>

								
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
														֤����Ϣ
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
														֤������
													</td>
													<td width="100">

														֤������

													</td>
													<td width="100">
														֤�����
													</td>
													<td width="100">
														�ɼ�
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
																out.print("�����");
																	if (kind == 2)
																out.print("����");
																	if (kind == 3)
																out.print("����");
																	if (kind == 4)
																out.print("ְ��");
																	if (kind == 0)
																out.print("����");
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
															<a href="<%=url%>/it/itskill.jsp">��������IT������Ϣ </a>
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
											IT������Ϣ
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
											��������
										</td>
										<td width="150">
											
											���ճ̶�
										</td>
										<td width="150">

											ʹ��ʱ��(��)
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
													out.print("��ͨ");

														if (kind == 2)
													out.print("����");

														if (kind == 3)
													out.print("һ��");

														if (kind == 4)
													out.print("�˽�");

														if (kind == 0)
													out.print("����");
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
															width="13" height="13" align="absmiddle"> <a href="<%=url%>/it/itlanguage.jsp">��������������Ϣ </a>
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
											������Ϣ
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
											��������
										</td>
										<td width="200">

											���ճ̶�
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
													out.print("��ͨ");

														if (grade == 2)
													out.print("����");

														if (grade == 3)
													out.print("����");
														if (grade == 4)
													out.print("һ��");

														if (grade == 0)
													out.print("����");
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
