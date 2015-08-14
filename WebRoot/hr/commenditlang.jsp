<%@ page language="java" import="java.util.*,com.hrclub.to.LanguageTO"
	pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>

	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<title>外语显示界面</title>

	</head>
	<body>
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<% Object hr=session.getAttribute("hrID"); %>
	<%if(null!=hr){ %>

		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   
			<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">外语信息</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
			   
   <%} %>
		<%
			String userid = (String) session.getAttribute("useridc");
			List listc = new ArrayList();
			listc = helper.getITLanguage(userid);

			HashMap map = helper.getLanguage();
		%>
		<table>
		
		<tr>
					<td  colspan="2">
						请添加添加外语信息 完成信息填写 <a href="it/itbaseinfo.do?operation=itbaseinfo&sign=findit&userid=<%=session.getAttribute("useridc")%>">查看全部信息</a>		</td>
				 
				</tr>
			<tr>
				<td>
					外语名称
				</td>
				<td>
				
					掌握程度
				</td>
				
			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>

			<tr>
				<td>

					<%
							out.print(map
							.get(((LanguageTO) listc.get(i)).getLanguagename()));
					%>

				</td>
				<td>

					<%
					int grade = ((LanguageTO) listc.get(i)).getGrade();
					
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
			%>
				</table>
		<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
		</table>

		<form id="form1" name="form1" method="post"
			action="commenditlang.do?operation=commenditlang">
				<table width="558"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">	添加外语	</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			   

				<tr>
					<td>
						外语名称
					</td>
					<td>
						<%
						out.println(tb.getSelect("languagename", map, null));
						%>
					</td>
				</tr>
				<tr>
					<td>
						掌握程度
					</td>
					<td>
						<select name="grade">
							<option value="1">
								精通
							</option>
							<option value="2">
								熟练
							</option>
							<option value="3" selected="selected">
								良好
							</option>
							<option value="4">
								一般
							</option>
							<option value="0">
								其他
							</option>
						</select>
					</td>
				</tr>

              <tr>
              <td colspan="2">
              <input type="submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit" value=" 增 加 " /></td>
             
              </tr>

			</table>
			<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
		  </table>
			
		</form>
		</td>
		</tr>
		</table>
		</td>
		</tr>
		</table>
		
		 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
