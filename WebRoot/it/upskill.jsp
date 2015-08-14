<%@ page language="java" import="java.util.*,com.hrclub.to.ITskillTO"
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
			src="<%=request.getContextPath()%>/js/basicinfo.js"></script>

		<title>修改IT技能信息</title>

	</head>
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
	<%
		String skillIDs = request.getParameter("skillID");
		int skillID = Integer.parseInt(skillIDs);

		ITskillTO to = new ITskillTO();
		to = helper.getITskillTO(skillID);
	%>
	<body>
 

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	 <table align="center" width="700">
   <tr>
   <td width="100"  valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=url %>/itforntop.jsp"></iframe>
   </td><td width="600" valign="top">
		<form id="form1" name="form1" method="post"
			action="upitskill.do?operation=upitskill">
			<table align="center" width="400">
				 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">修改IT技能</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top">
								<table width="500"  border="0" align="center">
				<tr>
					<td width="100">
						技能名称
					</td>
					<td width="300">
						<%
						out.println(tb.getSelect("skillnameID", helper.getITskillcomf(),
							helper.getITskillcomf().get(new Integer(to.getSkillnameID())).toString(),String.valueOf(to.getSkillnameID())));
						%>
					</td>
				</tr>
				<tr>
					<td>
						掌握程度
					</td>
					<td>
				    <% int degree=to.getDegree(); %>
						<select name="degree">
							<option value="1" <%if(degree==1) out.print("selected") ;%>>
								精通
							</option>
							<option value="2" <%if(degree==2) out.print("selected") ;%>>
								熟练
							</option>
							<option value="3" <%if(degree==3) out.print("selected") ;%>>
								一般
							</option>
							<option value="4" <%if(degree==4) out.print("selected") ;%>>
								了解
							</option>
							<option value="0" <%if(degree==0) out.print("selected") ;%>>
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
						<input type="text" name="time" value="<%=to.getTime()%>" size="3"/>
						月
					</td>
				</tr>

     <tr><td>
     </td>
     <td><input type="hidden" name="skillID" value="<%=skillID %>">


				<input type=button onClick="jscheckform();"  class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  value="提交信息" />
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
		 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
