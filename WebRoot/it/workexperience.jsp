<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<html>
<% String url=request.getContextPath(); %>
	<head>
		<title>I������������</title>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

	</head>
		<%String userid = (String) session.getAttribute("userid");
				
				if(null==userid) {
	
	response.sendRedirect("../it/itlogin.jsp");

   }else{ %>
	<body>
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<form action="delwork.do">
	 <table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
   </td>
   <td width="558" valign="top">
		<%
		
			List list = new ArrayList();
			list = helper.getListWork(userid);

			
		%>
		
	
<table  align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��������</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
			<tr><td class="px12">
			<img src="<%=request.getContextPath()%>/images/icon-02.gif"
															width="13" height="13" align="absmiddle">
<a href="<%=url%>/it/addwork.jsp"> ���ӹ������� </a>
</td>
</tr>

<%for (int i = 0; i < list.size(); i++) { %>
<tr>
<td>
			<table align="center" width="100%">
			
			
			<tr>
					<td colspan="2">
						��������
			
					</td>
				
				</tr>
				<tr>
					<td width="100">
						�����ص�
					</td>
					<td>

						<%=((WorkexperienceTO) list.get(i)).getAddress()%>

					</td>
				</tr>
				<tr>
					<td>
						���ڹ�˾����
					</td>
					<td>

						<%=((WorkexperienceTO) list.get(i)).getCompname()%>

					</td>
				</tr>
				<tr>
					<td>
						���ڹ�˾����
					</td>
					<td>

						<%
								int kind = ((WorkexperienceTO) list.get(i)).getComkind();
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

						<%=helper.getJobcomf(((WorkexperienceTO) list.get(i))
								.getPlace())%>

					</td>
				</tr>
				<tr>
					<td>
						��ʼʱ��
					</td>
					<td>

						<%=((WorkexperienceTO) list.get(i)).getStarttime()%>

					</td>
				</tr>
				<tr>
					<td>
						��ְʱ��
					</td>
					<td>

						<%=((WorkexperienceTO) list.get(i)).getLevertime()%>

					</td>
				</tr>
				<tr>
					<td>
						�������
					</td>
					<td width="350">

						<%=((WorkexperienceTO) list.get(i)).getInfo()%>

					</td>
				</tr>
				<tr>

					<td colspan="2" align="right">
   
						<a
							href="upwork.jsp?workID=<%=((WorkexperienceTO) list.get(i)).getWorkID()%>">
							&lt;�޸Ĺ�������&gt; </a> 
						<a
							href="delwork.do?operation=delwork&workID=<%=((WorkexperienceTO) list.get(i)).getWorkID()%>">
							&lt;ɾ����������&gt; </a>

					</td>
				</tr>
			</table>
			</td>
			</tr>
	
		<%
		}
		%>
			
	</table>
	  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>		
</td>
</tr>
</table>
	<%} %>
	</td>
	</tr>
	</table>
  <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>

</html>
