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
		<script language="javascript" type="text/javascript"
			src="<%=url%>/js/basicinfo.js"></script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	


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
 
	window.location.href='commenditcert.jsp';
}
</script>

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
   	<table  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">IT技能</td>
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
			listc = helper.getITskill(userid);
			HashMap list = helper.getITskillcomf();
		%>
		<table>
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
		<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif"  height="36" alt="" /></td>
      </tr>
		</table>
		<form id="form1" name="form1" method="post"
			action="commenditskill.do?operation=commenditskill">
		<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">	添加IT技能</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			   
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
						<input type="text" name="time" size="5"/>
						月
					</td>
				</tr>
					 <tr><td>		<input type=button name="Submit" value=" 增 加 "
					onClick="jscheckform();"class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
					<input type=button name="Submit" value="下一步"
					onClick="tocert()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
					
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
		</td>
		</tr>
		</table>
		 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
