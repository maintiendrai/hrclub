<%@ page language="java" import="java.util.*,com.hrclub.to.JobinfoTO"
	pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
  <script type="text/javascript">
  

  
  </script>
	
		<title>��ʾְλ��Ϣ</title>

		<%
			JobinfoTO to = (JobinfoTO) request.getAttribute("to");
			Object useid = session.getAttribute("userid");
			Object hrID = session.getAttribute("hrID");
		%>

	</head>
	<body>
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

		<%
			String msgerror = (String) request.getAttribute("msgerror");
			if (null != msgerror) {
				out.print(tb.getalert(msgerror));
			}
		%>
		<form  name="form1" action="tojob.do" method=post>
		<input type="hidden" name="operation" value="tojob" >
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
					<%
					if (null != useid) {
					%>
					
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

					<%
					} else if (null != hrID) {
					%>
	

					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%
					}
					%>
				</td>
				<td width="558" valign="top">
					<table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�鿴��Ƹ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">

					<table  align="center">
						<tr>
							<td>
								��Ƹ����
							</td>
							<td colspan="9">
								<%=to.getJobtitle()%>
							</td>

						</tr>
						<tr>
							<td>
								ְλ����
							</td>
							<td colspan="9" >
								<%=helper.getJobcomf(to.getPositiontype())%>
							</td>
						</tr>
						<tr>


							
							
							<td class="samll" width="10%">
								��Ƹ����
							</td>
							<td class="samll" width="10%">
								<%=to.getNum()%>
								��
							</td>
							<td class="samll" width="10%">
								��������
							</td>
							<td class="samll" width="10%">
								<%
									int kind = to.getKind();
									if (kind == 0)
										out.print("����");
									if (kind == 1)
										out.print("ȫְ");

									if (kind == 2)
										out.print("��ְ");
								%>
							</td>


							<td class="samll" width="10%">
								��͹�������
							</td>
							<td class="samll" width="10%">
								<%=to.getYear()%>
								��
							</td>
						</tr>
						<tr>
							<td class="samll" width="10%">
								��Чʱ��
							</td>
							<td class="samll" width="10%">
								<%=to.getStarttime()%>
							</td>
							<td class="samll" width="10%">
								��ֹʱ��
							</td>
							<td class="samll" width="10%">
								<%=to.getEndtime()%>
							</td>
							<td class="samll" width="10%">
								�ο���н
							</td>
							<td class="samll" width="10%">
								<%=helper.getWage(to.getWage())%>
							</td>
						
						</tr>
						<tr>
						<td class="samll" width="10%">
								ѧ��Ҫ��
							</td>
							<td class="samll" width="10%">
								<% 
									int degree = to.getDegree();
									if (degree == 1)
										out.print("����");
									if (degree == 2)
										out.print("��ר");
									if (degree == 3)
										out.print("����");
									if (degree == 4)
										out.print("��ר");
									if (degree == 5)
										out.print("����");
									if (degree == 6)
										out.print("˶ʿ");
									if (degree == 7)
										out.print("��ʿ");
									if (degree == 0)
										out.print("����");
								%>
							</td>
						<td class="samll">
								רҵҪ��
							</td>
							<td class="samll" width="10%">
								<%=helper.getSpecialitycomf(String.valueOf(to
							.getSpecialityID()))%>
							</td>
						
							<td class="samll" width="10%">
								��������
							</td>
							<td class="samll" colspan="2">
								<%=helper.getCtiyname(to.getCity())%>
							</td>
						
						</tr>
						<tr>
							<td class="samll" valign="top">
								����˵��
							</td>
							<td colspan="9" class="samll" width="300">
								<%=to.getDeal()%>
							</td>
						</tr>

						<tr>
							<td class="samll" valign="top">
								ְλҪ��
							</td>
							<td colspan="9" class="samll" width="300">
								<%=to.getRequest()%>
							</td>
						</tr>
						<tr>
							<td class="samll" valign="top">
								ְλ����
							</td>
							<td colspan="9" class="samll"  width="300">
								<%=to.getExplain()%>
							</td>
						</tr>

                 <tr><td colspan="10">
                 <hr>
                 </td>
                 </tr>

						<tr>
							<td valign="top">
								��ְ����
							</td>
							<td colspan="9">
								<textarea name="content" cols="50" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<input type="reset" name="reset" value=" ���� "
									class=btn1_mouseout
									onmouseover="this.className='btn1_mouseover'"
									onmouseout="this.className='btn1_mouseout'"
									onclick="history.back();">

							</td>
<%	if (null != useid) { %>
							<td>
							
							<input type=submit  value="��ҪӦƸ"
									class=btn1_mouseout
									onmouseover="this.className='btn1_mouseover'"
									onmouseout="this.className='btn1_mouseout'"
									>
			
							</td>
				 		<%} %>	
                        <input type="hidden" name="jobtitle" value=<%=to.getJobtitle()%> >
                          <input type="hidden" name="jobID" value=<%=request.getParameter("jobID") %> >
                            <input type="hidden" name="positiontype" value=<%=to.getPositiontype()%> >
						</tr>
					</table>
				</td>
			</tr>
				  <tr>
        <td><img src="<%=path %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
		</table>
		
      	</table>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</form>
	</body>

</html>
