<%@ page language="java" import="java.util.*,com.hrclub.to.LanguageTO"
	pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
		<script language="javascript" type="text/javascript"
			src="../js/datepicker/WdatePicker.js"></script>
		<script src="../js/country/change_region.js"></script>


		<title>外语显示界面</title>

	</head>
	<body>
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	<div id="contentborder" align="center">
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan=6 class="newline"></td>
				</tr>
				<tr>
					<td colspan="2" class="dvInnerHeader">
						<b>外语信息</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>
		<%
			String userid = (String) session.getAttribute("useridc");
			List listc = new ArrayList();
			listc = helper.getITLanguage(userid);

			HashMap map = helper.getLanguage();
		%>
		<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
		
		<tr>
					<td  colspan="2">
						请添加添加外语信息 完成信息填写 <a href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=session.getAttribute("useridc")%>">查看全部信息</a>		</td>
				 
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

		<form id="form1" name="form1" method="post"
			action="commenditlang.do?operation=commenditlang">
			<table align="left">

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
              <input type="submit" name="Submit" value="增加外语信息"   class="button"/></td>
             
              </tr>

			</table>
		</form>
		
	</body>
</html>
