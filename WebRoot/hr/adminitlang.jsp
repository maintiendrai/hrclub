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


		<title>������ʾ����</title>

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
						<b>������Ϣ</b>
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
						��������������Ϣ �����Ϣ��д <a href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=session.getAttribute("useridc")%>">�鿴ȫ����Ϣ</a>		</td>
				 
				</tr>
			<tr>
				<td>
					��������
				</td>
				<td>
				
					���ճ̶�
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
								out.print("��ͨ");
				
								if (grade == 2)
								out.print("����");
				
								if (grade == 3)
				
								if (grade == 4)
								out.print("һ��");
					
								if (grade == 0)
								out.print("����");
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
						��������
					</td>
					<td>
						<%
						out.println(tb.getSelect("languagename", map, null));
						%>
					</td>
				</tr>
				<tr>
					<td>
						���ճ̶�
					</td>
					<td>
						<select name="grade">
							<option value="1">
								��ͨ
							</option>
							<option value="2">
								����
							</option>
							<option value="3" selected="selected">
								����
							</option>
							<option value="4">
								һ��
							</option>
							<option value="0">
								����
							</option>
						</select>
					</td>
				</tr>

              <tr>
              <td colspan="2">
              <input type="submit" name="Submit" value="����������Ϣ"   class="button"/></td>
             
              </tr>

			</table>
		</form>
		
	</body>
</html>
