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


		<title>所有IT人才信息</title>
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
									<strong>基本信息</strong>
								</td>
							</tr>
							<tr>
								<td width="109">
									真实姓名
								</td>
								<td width="330">
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
										<%=helper.getCity(ituser.getProvince(), ituser.getCity())%>
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
						暂无专业求职意向信息

						<%
						} else {
						%>
						<table width="436" height="235" border="0" align="left">
							<tr>
								<td width="436" colspan="2">
									<strong>专业求职意向信息</strong>
								</td>
							</tr>
							<tr>
								<td>
									简历名称
								</td>
								<td>
									<%=itusersp.getNamekey()%>
								</td>
							</tr>
							<tr>
								<td>
									学历
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
									意向工作地点
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
									奖励
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
							暂无工作经历信息
							<%
									} else {
									for (int i = 0; i < listw.size(); i++) {
							%>

							<tr>
								<td width="436" colspan="2">
									<strong>工作经历</strong>
								</td>
							</tr>
							<tr>
								<td width="436" colspan="2">
									工作经历
									<%=i + 1%>
							</tr>
							<tr>
								<td>
									工作地点
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getAddress()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									所在公司名称
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getCompname()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									所在公司性质
								</td>
								<td>
									<label>
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
									</label>
								</td>
							</tr>
							<tr>
								<td>
									担任职位
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
									开始时间
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getStarttime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									离职时间
								</td>
								<td>
									<label>
										<%=((WorkexperienceTO) listw.get(i)).getLevertime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									工作简介
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
						暂无项目经验信息
						<%
						} else {
						%>
						<%
						for (int i = 0; i < listp.size(); i++) {
						%>
						<table width="436" border="0" align="left">
							<tr>
								<td width="436" colspan="2">
									<strong>项目经验<%=i + 1%> </strong>
								</td>
							</tr>

							<tr>
								<td width="106">
									项目名称
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getProjectname()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									开始时间
								</td>
								<td>
									<label>
										<%=((ProjectTO) listp.get(i)).getStarttime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td>
									完成时间
								</td>
								<td>
									<label>
										<%=((ProjectTO) listp.get(i)).getEndtime()%>
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									硬件环境
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getHardware()%>
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									软件环境
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getSoftware()%>
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									项目规模
								</td>
								<td width="243">
									<label>
										<%=((ProjectTO) listp.get(i)).getProjectsize()%>
										人/月
									</label>
								</td>
							</tr>
							<tr>
								<td width="106">
									担任职位
								</td>
								<td width="243">
									<%=helper.getJobcomf(((ProjectTO) listp.get(i))
									.getPlace())%>
								</td>
							</tr>
							<tr>
								<td>
									项目简介
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
							暂无证书信息
							<%
									} else {
									HashMap listcert = helper.getCertificateComf();
							%>
							<tr>
								<td width="600" colspan="2">
									<strong>证书信息</strong>
								</td>
							</tr>

							<tr>
								<td width="160" height="33">
									证书类型
								</td>
								<td width="300">
									
										证书名称
									
								</td>
								<td width="160">
									证书编码
								</td>
								<td width="60">
									成绩
								</td>
							</tr>

							<%
							for (int i = 0; i < listc.size(); i++) {
							%>
							<tr>
								<td height="35">
									<label>
										
						<%int kind=((CertificateTO) listc.get(i)).getKind();
						if(kind==1)out.print("计算机");
						if(kind==2)out.print("外语");
						if(kind==3)out.print("管理");
						if(kind==4)out.print("职称");
						if(kind==0)out.print("其他");
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
						暂无IT技能信息
						<%
								} else {
								HashMap listsk = helper.getITskillcomf();
						%>
						<table width="436" border="0" align="left">

							<tr>
								<td width="436" colspan="2">
									<strong>IT技能信息</strong>
								</td>
							</tr>

							<tr>
								<td width="163" height="30">
									技能名称
								</td>
								<td width="123">
									<label></label>
									掌握程度
								</td>
								<td width="117">

									使用时间(月)
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

							&nbsp;&nbsp;暂无外语信息

							<%
									} else {

									HashMap map = helper.getLanguage();
							%>

							<tr>
								<td width="436" colspan="2">
									<strong> 外语信息</strong>
								</td>
							</tr>


							<tr>
								<td width="177" height="24">
									外语名称
								</td>
								<td width="248">

									掌握程度
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
