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


		<title>����IT�˲���Ϣ</title>
	</head>
	<%
	ITUserTO ituser = (ITUserTO) request.getAttribute("itbaseto");
	%>
	<body>

		<div id="contentborder" align="center">
			
			<table border=0 cellspacing=0 cellpadding=0 width="97%" class="small">
                <tr><td><br></td></tr>
				<tr>
					<td>
						<table width="436" height="192" border="0" lign="center">
							<tr>
								<td width="436" colspan="2">
									<strong>������Ϣ</strong>
								</td>
							</tr>
							<tr>
								<td width="109">
									��ʵ����
								</td>
								<td width="330">
									<label>
										<%=ituser.getName()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									�Ա�
								</td>
								<td>
									<label>
										<%
												if (ituser.getSex() == 0)
												out.print("��");
										%>
									</label>
									<label>
										<%
												if (ituser.getSex() != 0)
												out.print("Ů");
										%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									����
								</td>
								<td>
									<label>
										<%=ituser.getAge()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									�ʼ�
								</td>
								<td>
									<label>
										<%=ituser.getEmail()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									��������
								</td>
								<td>
									<label>
										<%=ituser.getBorn()%>
									</label>
							</tr>
							<tr>
								<td>
									����ʡ��
								</td>
								<td>
									<label>
										<%=helper.getProvince(ituser.getProvince())%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									���ڳ���
								</td>
								<td>
									<label>
										<%=helper.getCity(ituser.getProvince(), ituser.getCity())%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									��ϵ��ַ
								</td>
								<td>
									<label>
										<%=ituser.getAddress()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									�ʱ�
								</td>
								<td>
									<label>
										<%=ituser.getPost()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									�̶��绰
								</td>
								<td>
									<label>
										<%=ituser.getTelephone()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									�ƶ��绰
								</td>
								<td>
									<label>
										<%=ituser.getMobiletphone()%>
									</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td>
						<%
							ITUserSpecialityTO itusersp = new ITUserSpecialityTO();

							itusersp = (ITUserSpecialityTO) request.getAttribute("itspeto");
							if (itusersp == null) {
						%>
						����רҵ��ְ������Ϣ

						<%
						} else {
						%>
						<table width="436" height="235" border="0" align="left">
							<tr>
								<td width="436" colspan="2">
									<strong>רҵ��ְ������Ϣ</strong>
								</td>
							</tr>
							<tr>
								<td>
									��������
								</td>
								<td>
									<%=itusersp.getNamekey()%>
								</td>
							</tr>
							<tr>
								<td>
									ѧ��
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
									�������ص�
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
									����
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

						<table width="436" border="0" align="left">


							<%
							if (listw.size() == 0) {
							%>
							���޹���������Ϣ
							<%
									} else {
									for (int i = 0; i < listw.size(); i++) {
							%>

							<tr>
								<td width="436" colspan="2">
									<strong>��������</strong>
								</td>
							</tr>
							<tr>
								<td width="436" colspan="2">
									��������
									<%=i + 1%>
							</tr>
							<tr>
								<td>
									�����ص�
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getAddress()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									���ڹ�˾����
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getCompname()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									���ڹ�˾����
								</td>
								<td>
									<label>
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
									</label>
								</td>
							</tr>
							<tr>
								<td>
									����ְλ
								</td>
								<td>
									<label>
										<%=helper.getJobcomf(((WorkexperienceTO) listw
									.get(i)).getPlace())%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									��ʼʱ��
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getStarttime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									��ְʱ��
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getLevertime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									�������
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getInfo()%>
									</label>
								</td>
							</tr>

							<%
								}
								}
							%>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<%
							List listp = new ArrayList();
							listp = (List) request.getAttribute("listpro");

							if (listp.size() == 0) {
						%>
						������Ŀ������Ϣ
						<%
						} else {
						%>
						<%
						for (int i = 0; i < listp.size(); i++) {
						%>
						<table width="436" border="0" align="left">
							<tr>
								<td width="436" colspan="2">
									<strong>��Ŀ����<%=i + 1%> </strong>
								</td>
							</tr>

							<tr>
								<td width="106">
									��Ŀ����
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getProjectname()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									��ʼʱ��
								</td>
								<td>
									<label>
										<%=((ProjectTO) listp.get(i)).getStarttime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									���ʱ��
								</td>
								<td>
									<label>
										<%=((ProjectTO) listp.get(i)).getEndtime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									Ӳ������
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getHardware()%>
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									�������
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getSoftware()%>
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									��Ŀ��ģ
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getProjectsize()%>
										��/��
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									����ְλ
								</td>
								<td width="243">
									<%=helper.getJobcomf(((ProjectTO) listp.get(i))
									.getPlace())%>
								</td>
							</tr>
							<tr>
								<td>
									��Ŀ���
								</td>
								<td>
									<label>
										<%=((ProjectTO) listp.get(i)).getProjectinfo()%>
									</label>
								</td>
							</tr>
						</table>
						<%
							}
							}
						%>
					</td>
				</tr>
				<tr>
					<td>
						<table width="600" border="0" align="left">

							<%
								List listc = new ArrayList();
								listc = (List) request.getAttribute("listcert");
								if (listc.size() == 0) {
							%>
							����֤����Ϣ
							<%
									} else {
									HashMap listcert = helper.getCertificateComf();
							%>
							<tr>
								<td width="600" colspan="2">
									<strong>֤����Ϣ</strong>
								</td>
							</tr>

							<tr>
								<td width="160" height="33">
									֤������
								</td>
								<td width="300">
									
										֤������
									
								</td>
								<td width="160">
									֤�����
								</td>
								<td width="60">
									�ɼ�
								</td>
							</tr>

							<%
							for (int i = 0; i < listc.size(); i++) {
							%>
							<tr>
								<td height="35">
									<label>
										
						<%int kind=((CertificateTO) listc.get(i)).getKind();
						if(kind==1)out.print("�����");
						if(kind==2)out.print("����");
						if(kind==3)out.print("����");
						if(kind==4)out.print("ְ��");
						if(kind==0)out.print("����");
						%>
									</label>
								</td>
								<td>
									<label>
										<%=listcert.get(Integer
									.parseInt(((CertificateTO) listc.get(i))
											.getCrertname()))%>
									</label>
								</td>
								<td>
									<label>
										<%=((CertificateTO) listc.get(i)).getNumber()%>
									</label>
								</td>
								<td>
									<label>
										<%=((CertificateTO) listc.get(i)).getGrade()%>
									</label>
								</td>
							</tr>
							<%
								}
								}
							%>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<%
							List listskill = new ArrayList();

							listskill = (List) request.getAttribute("listskill");
							if (listskill.size() == 0) {
						%>
						����IT������Ϣ
						<%
								} else {
								HashMap listsk = helper.getITskillcomf();
						%>
						<table width="436" border="0" align="left">

							<tr>
								<td width="436" colspan="2">
									<strong>IT������Ϣ</strong>
								</td>
							</tr>

							<tr>
								<td width="163" height="30">
									��������
								</td>
								<td width="123">
									<label></label>
									���ճ̶�
								</td>
								<td width="117">

									ʹ��ʱ��(��)
								</td>
							</tr>
							<%
							for (int i = 0; i < listskill.size(); i++) {
							%>

							<tr>
								<td height="31">
									<%=listsk.get(((ITskillTO) listskill.get(i))
									.getSkillnameID())%>
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
								}
							%>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="436" border="0" align="left">
							<%
								List listl = new ArrayList();
								listl = (List) request.getAttribute("listilang");
								if (listl.size() == 0) {
							%>

							&nbsp;&nbsp;����������Ϣ

							<%
									} else {

									HashMap map = helper.getLanguage();
							%>

							<tr>
								<td width="436" colspan="2">
									<strong> ������Ϣ</strong>
								</td>
							</tr>


							<tr>
								<td width="177" height="24">
									��������
								</td>
								<td width="248">

									���ճ̶�
								</td>
							</tr>
							<%
							for (int i = 0; i < listl.size(); i++) {
							%>
							<tr>
								<td height="20">

									<%
												out.print(map.get(((LanguageTO) listl.get(i))
												.getLanguagename()));
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

							<%
								}
								}
							%>
						</table>
					</td>
				</tr>
			</table>
		</div>
	</body>
</html>
