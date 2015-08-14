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
	
		<title>显示职位信息</title>

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
            <td height="36" valign="top" class="titile">查看招聘</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">

					<table  align="center">
						<tr>
							<td>
								招聘标题
							</td>
							<td colspan="9">
								<%=to.getJobtitle()%>
							</td>

						</tr>
						<tr>
							<td>
								职位类型
							</td>
							<td colspan="9" >
								<%=helper.getJobcomf(to.getPositiontype())%>
							</td>
						</tr>
						<tr>


							
							
							<td class="samll" width="10%">
								招聘人数
							</td>
							<td class="samll" width="10%">
								<%=to.getNum()%>
								人
							</td>
							<td class="samll" width="10%">
								工作类型
							</td>
							<td class="samll" width="10%">
								<%
									int kind = to.getKind();
									if (kind == 0)
										out.print("不限");
									if (kind == 1)
										out.print("全职");

									if (kind == 2)
										out.print("兼职");
								%>
							</td>


							<td class="samll" width="10%">
								最低工作年限
							</td>
							<td class="samll" width="10%">
								<%=to.getYear()%>
								年
							</td>
						</tr>
						<tr>
							<td class="samll" width="10%">
								生效时间
							</td>
							<td class="samll" width="10%">
								<%=to.getStarttime()%>
							</td>
							<td class="samll" width="10%">
								截止时间
							</td>
							<td class="samll" width="10%">
								<%=to.getEndtime()%>
							</td>
							<td class="samll" width="10%">
								参考月薪
							</td>
							<td class="samll" width="10%">
								<%=helper.getWage(to.getWage())%>
							</td>
						
						</tr>
						<tr>
						<td class="samll" width="10%">
								学历要求
							</td>
							<td class="samll" width="10%">
								<% 
									int degree = to.getDegree();
									if (degree == 1)
										out.print("初中");
									if (degree == 2)
										out.print("中专");
									if (degree == 3)
										out.print("高中");
									if (degree == 4)
										out.print("大专");
									if (degree == 5)
										out.print("本科");
									if (degree == 6)
										out.print("硕士");
									if (degree == 7)
										out.print("博士");
									if (degree == 0)
										out.print("其他");
								%>
							</td>
						<td class="samll">
								专业要求
							</td>
							<td class="samll" width="10%">
								<%=helper.getSpecialitycomf(String.valueOf(to
							.getSpecialityID()))%>
							</td>
						
							<td class="samll" width="10%">
								工作城市
							</td>
							<td class="samll" colspan="2">
								<%=helper.getCtiyname(to.getCity())%>
							</td>
						
						</tr>
						<tr>
							<td class="samll" valign="top">
								待遇说明
							</td>
							<td colspan="9" class="samll" width="300">
								<%=to.getDeal()%>
							</td>
						</tr>

						<tr>
							<td class="samll" valign="top">
								职位要求
							</td>
							<td colspan="9" class="samll" width="300">
								<%=to.getRequest()%>
							</td>
						</tr>
						<tr>
							<td class="samll" valign="top">
								职位描述
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
								求职内容
							</td>
							<td colspan="9">
								<textarea name="content" cols="50" rows="10"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<input type="reset" name="reset" value=" 返回 "
									class=btn1_mouseout
									onmouseover="this.className='btn1_mouseover'"
									onmouseout="this.className='btn1_mouseout'"
									onclick="history.back();">

							</td>
<%	if (null != useid) { %>
							<td>
							
							<input type=submit  value="我要应聘"
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
