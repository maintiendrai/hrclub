<%@ page language="java" import="java.util.*,com.hrclub.to.ITskillTO"
	pageEncoding="gbk"%>
<%
String url = request.getContextPath();
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	  <link rel="stylesheet" type="text/css" href="../adminindex/table.css">
		<script language="javascript" type="text/javascript"
			src="<%=url%>/js/basicinfo.js"></script>


		<title>IT������ʾ����</title>
		<script> 
function jscheckform(){
  if(document.form1.time.value==""){
    alert("������ʹ��ʱ�䣡");
    document.form1.time.focus();
    return false;
  } 
  if(!IsNumber(document.form1.time.value)){
    alert("���������֣�");
    document.form1.time.focus();
    return false;
  }
  
 	 document.form1.submit();
}
function tocert(){
	window.location.href='adminitcert.jsp';
}
</script>

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
						<b>IT������Ϣ</b>
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
			listc = helper.getITskill(userid);
			HashMap list = helper.getITskillcomf();
		%>
		<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
		<tr>
					<td  colspan="2">
						�����IT������Ϣ 	��һ�����֤��		</td>
				 
				</tr>
			<tr>
				<td>
					��������
				</td>
				<td>
					<label></label>
					���ճ̶�
				</td>
				<td >
					
						ʹ��ʱ��(��)
				
				</td>
				

			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>


			<tr>
				<td>
					<%=list.get(((ITskillTO) listc.get(i))
										.getSkillnameID())%>
				</td>
				<td>

					<%
					int kind = ((ITskillTO) listc.get(i)).getDegree();
					%>
					<%
								if (kind == 1)
								out.print("��ͨ");
					%>
					<%
								if (kind == 2)
								out.print("����");
					%>
					<%
								if (kind == 3)
								out.print("һ��");
					%>
					<%
								if (kind == 4)
								out.print("�˽�");
					%>
					<%
								if (kind == 0)
								out.print("����");
					%>
				</td>
				<td>
					<%=((ITskillTO) listc.get(i)).getTime()%>
					<input type="hidden" name=certificateID&quot;
						value=<%=((ITskillTO) listc.get(i)).getSkillID()%> />
					<input type="hidden" name="operation" value="delskill" />
				</td>
				
			</tr>




			<%
			}
			%>
		</table>
		<form id="form1" name="form1" method="post"
			action="commenditskill.do?operation=commenditskill">
			<table align="left">
				<tr>
					<td colspan="2">
						���IT����
					</td>
				</tr>
				<tr>
					<td>
						��������
					</td>
					<td>
						<%
						out.println(tb.getSelect("skillnameID", list, null));
						%>
					</td>
				</tr>
				<tr>
					<td>
						���ճ̶�
					</td>
					<td>
						<select name="degree">
							<option value="1">
								��ͨ
							</option>
							<option value="2">
								����
							</option>
							<option value="3" selected="selected">
								һ��
							</option>
							<option value="4">
								�˽�
							</option>
							<option value="0">
								����
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						ʹ��ʱ��
					</td>
					<td>
						<input type="text" name="time" />
						��
					</td>
				</tr>
				<tr><td>
				<input type=button name="Submit" value="����IT����"
					onClick="jscheckform();" class="button" />
					<input type=button name="Submit" value="��һ��"
					onClick="tocert()" class="button" /></td>
				</tr>
			</table>

				
					

		</form>
		
	</body>
</html>
