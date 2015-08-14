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


		<title>IT技能显示界面</title>
		<script> 
function jscheckform(){
  if(document.form1.time.value==""){
    alert("请输入使用时间！");
    document.form1.time.focus();
    return false;
  } 
  if(!IsNumber(document.form1.time.value)){
    alert("请输入数字！");
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
						<b>IT技能信息</b>
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
						请添加IT技能信息 	下一步添加证书		</td>
				 
				</tr>
			<tr>
				<td>
					技能名称
				</td>
				<td>
					<label></label>
					掌握程度
				</td>
				<td >
					
						使用时间(月)
				
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
								out.print("精通");
					%>
					<%
								if (kind == 2)
								out.print("熟练");
					%>
					<%
								if (kind == 3)
								out.print("一般");
					%>
					<%
								if (kind == 4)
								out.print("了解");
					%>
					<%
								if (kind == 0)
								out.print("其他");
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
						添加IT技能
					</td>
				</tr>
				<tr>
					<td>
						技能名称
					</td>
					<td>
						<%
						out.println(tb.getSelect("skillnameID", list, null));
						%>
					</td>
				</tr>
				<tr>
					<td>
						掌握程度
					</td>
					<td>
						<select name="degree">
							<option value="1">
								精通
							</option>
							<option value="2">
								熟练
							</option>
							<option value="3" selected="selected">
								一般
							</option>
							<option value="4">
								了解
							</option>
							<option value="0">
								其他
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						使用时间
					</td>
					<td>
						<input type="text" name="time" />
						月
					</td>
				</tr>
				<tr><td>
				<input type=button name="Submit" value="增加IT技能"
					onClick="jscheckform();" class="button" />
					<input type=button name="Submit" value="下一步"
					onClick="tocert()" class="button" /></td>
				</tr>
			</table>

				
					

		</form>
		
	</body>
</html>
