<%@ page language="java" import="java.util.*,com.hrclub.to.LanguageTO"
	pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	
	
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<title>修改外语信息</title>

	</head>
	<%
		String languageIDs = request.getParameter("languageID");
		int languageID = Integer.parseInt(languageIDs);

		LanguageTO to = new LanguageTO();
		to = helper.getLanguageTO(languageID);
	%>
	<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td><td width="558" valign="top" >
   <table  align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">外语编辑</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  height="192" border="0" align="center">
		<form id="form1" name="form1" method="post"
			action="uplanguage.do?operation=uplanguage">
			<table align="center" width="400">

				<tr>
					<td width="100">
						外语名称
					</td>
					<td width="300">
						<%
									out.println(tb.getSelect("languagename", helper.getLanguage(),
									(helper.getLanguage().get((new Integer(to.getLanguagename()))))
									.toString(),String.valueOf(to.getLanguagename())));
						%>
					</td>
				</tr>
				<tr>
					<td>
						掌握程度
					</td>
					<td>
					<% int grade=to.getGrade(); %>
						<select name="grade">
							<option value="1"  <%if(grade==1) out.print("selected") ;%>>
								精通
							</option>
							<option value="2"  <%if(grade==2) out.print("selected") ;%>>
								熟练
							</option>
							<option value="3"  <%if(grade==3) out.print("selected") ;%>>
								良好
							</option>
							<option value="4"  <%if(grade==4) out.print("selected") ;%>>
								一般
							</option>
							<option value="0"  <%if(grade==0) out.print("selected") ;%>>
								其他
							</option>
						</select>
					</td>
				</tr>


      <tr>
      <td>
      </td>
      <td>
      <input type="hidden" name="languageID" value="<%=languageID%>">

		
				<input type="submit" name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="修改信息" />

      </td>
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
			 	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
