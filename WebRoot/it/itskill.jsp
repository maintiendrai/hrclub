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
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
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
</script>

	</head>
		<%String userid = (String) session.getAttribute("userid");
				
				if(null==userid) {
	
	response.sendRedirect("../it/itlogin.jsp");

   }else{ %>
	<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/top.js"></script></div>
  
	 <table align="center" width="700">
	 	<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
   <tr>
   <td width="100" valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=url %>/itforntop.jsp"></iframe>
   </td><td width="558" valign="top">
	
		<%
	
			List listc = new ArrayList();
			listc = helper.getITskill(userid);
			HashMap list = helper.getITskillcomf();
		%>
		<table  align="center">
					 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">IT技能</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			<tr class="titlename">
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
				<td >
					修改技能
				</td>
				<td >
					删除技能
				</td>

			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>


			<tr>
				<td>
					<%=list.get( new Integer(((ITskillTO) listc.get(i))
										.getSkillnameID()))%>
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
				<td>
					<a
						href="upskill.jsp?skillID=<%=((ITskillTO) listc.get(i)).getSkillID()%>">
						修改技能 </a>
				</td>
				<td>
					<a
						href="FrontController.do?operation=delskill&skillID=<%=((ITskillTO) listc.get(i)).getSkillID()%>">
						删除技能 </a>
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
			action="addskill.do?operation=addskill">
			<table align="center" width="558">
			
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">添加IT技能</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
		
				
				<tr>
					<td width="100">
						技能名称
					</td>
					<td width="300">
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
						<input type="text" name="time" size="3" />
						月
					</td>
				</tr>
					<tr>
					<td></td>
					<td>
					<input type=button name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="增加技能"
					onClick="jscheckform();" />
					</td>
				</tr>
				
			</table>

					  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
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
