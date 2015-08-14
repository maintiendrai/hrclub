<%@ page language="java" import="java.util.*,com.hrclub.to.ITskillTO"
	pageEncoding="gbk"%>

<html>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

				<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
	<head>
		<title>修改HR账户/密码</title>
<script> 
function jscheckform(checkform){

 
	if(checkform.password.value==""){
		alert("请输入原始密码");checkform.password.focus();return false;
	}
	
	if(checkform.password1.value==""){
		alert("请输入新密码");checkform.password1.focus();return false;
	}
	if(document.checkform.password1.value.length<6){
	alert("密码长度太小");checkform.password1.focus();return false;
	}
	if(checkform.password2.value==""){
		alert("请输入确认密码");checkform.password2.focus();return false;
	}
	
	if(checkform.password2.value!=checkform.password1.value){
		alert("请输入新密码与确认密码不相同");checkform.password1.focus();return false;
	}
  document.checkform.password.value=hex_md5(document.checkform.password.value)
  document.checkform.password1.value=hex_md5(document.checkform.password1.value)
  
}

 </script>
	</head>
	  <%
String hrID = (String)session.getAttribute("hrID");
if(null==hrID) {

	response.sendRedirect("../hr/hrlogin.jsp");

}	else {
%>
	<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath() %>/js/top.js"></script></div>
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   	<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">修改密码</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
		<form  name="checkform" method="post"
			action="uppassword.do?operation=uphrpassword" onSubmit="return jscheckform(checkform)">
			<table>
		      
		  
				<tr>
					<td width="100">
						&nbsp;原始密码
					</td>
					<td>
					<input type="password" name="password" >
					</td>
				</tr>
				<tr>
					<td>
						&nbsp;修改密码
					</td>
					<td>
					<input type="password" name="password1" >
					</td>
				</tr>
			<tr>
					<td>
						&nbsp;确认密码
					</td>
					<td>
					<input type="password" name="password2" >
					</td>
				</tr>
<tr>
<td>
     <input type="submit" name="Submit" value=" 提 交 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
				 />
</td>
<td>
				
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
			<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	</body>
	<%} %>
</html>
