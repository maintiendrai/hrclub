<%@ page language="java" import="java.util.*,com.hrclub.to.LanguageTO"
	pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	<%
String url = request.getContextPath();
%>
<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
		<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>

		<title>������ʾ����</title>

	</head>
		<%String userid = (String) session.getAttribute("userid");
				
				if(null==userid) {
	
	response.sendRedirect("../it/itlogin.jsp");

   }else{ %>
	<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/top.js"></script></div>

		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	 <table align="center" width="700">
	 
   <tr>
   <td width="100" valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=url %>/itforntop.jsp"></iframe>
   </td><td width="558" valign="top">
		<%
	
			List listc = new ArrayList();
			listc = helper.getITLanguage(userid);

			HashMap map = helper.getLanguage();
		%>
		<table  align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">������Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			<tr class="titlename">
				<td>
					��������
				</td>
				<td>
				
					���ճ̶�
				</td>
				<td>
					�޸�����
				</td>
				<td>
					ɾ������
				</td>
			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>

			<tr>
				<td>

					<%
							out.print(map
							.get( new Integer(((LanguageTO) listc.get(i)).getLanguagename())));
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
				                   out.print("����");
								if (grade == 4)
								out.print("һ��");
					
								if (grade == 0)
								out.print("����");
					%>
					<input type="hidden" name=certificateID
						value=<%=((LanguageTO) listc.get(i)).getLanguageID()%> />
					<input type="hidden" name="operation" value="delskill" />
				</td>
				<td>
					<a
						href="uplanguage.jsp?languageID=<%=((LanguageTO) listc.get(i)).getLanguageID()%> ">�޸�����</a>
				</td>
				<td>
					<a
						href="FrontController.do?operation=dellanguage&languageID=<%=((LanguageTO) listc.get(i)).getLanguageID()%> ">ɾ������
					</a>
				</td>
			</tr>


			<%
			}
			%>
			</table>
				  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
		</table>

		<form id="form1" name="form1" method="post"
			action="addlanguage.do?operation=addlanguage">
			<table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">���������Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
	<tr>
		
					<td width="100">
						��������
					</td>
					<td width="300">
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
              <td></td>
              <td >
              <input type="submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit" value="����������Ϣ" /></td>
              </tr>
</table>
				  <tr>
        <td><img src="<%=url %>/images/main_3.gif"  height="36" alt="" /></td>
      </tr>
			</table>
		</form>
		</td>
		</tr>
		</table>
			<%} %>
	                                      <div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/down.js"></script></div>
	</body>

</html>
