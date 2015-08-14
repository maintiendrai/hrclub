<%@ page language="java" import="java.util.*,com.hrclub.to.ITskillTO"
	pageEncoding="gbk"%>

<html>
	<head>
			<%
String url = request.getContextPath();
%>
				<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
	<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script> 
function jscheckform(checkform){

   if(checkform.password.value==""){
		alert("请输入原来密码!");checkform.password.focus();return false;
	}
	if(checkform.password1.value==""){
		alert("请输入新密码");checkform.password1.focus();return false;
	}
	if(document.checkform.password1.value.length<6){
	alert("密码长度太小");checkform.password1.focus();return false;
	}
	if(checkform.password1.value!=checkform.password2.value){
		alert("请输入相同的确认密码");checkform.password2.focus();return false;
	}
  document.checkform.password.value=hex_md5(document.checkform.password.value)
  document.checkform.password1.value=hex_md5(document.checkform.password1.value)
}

 </script>
		<title>修改IT账户或密码信息</title>

	</head>
		<%String userid = (String) session.getAttribute("userid");
				
				if(null==userid) {
	
	response.sendRedirect("../it/itlogin.jsp");

   }else{ %>
	<body>
	
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

	 <table align="center" width="700">
   <tr>
   <td width="100" valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td><td width="558" valign="top" >
		<form id="checkform" name="checkform" method="post"
			action="uppassword.do?operation=uppassword" onSubmit="return jscheckform(checkform)">
			<table align="center">
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">修改密码</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
				<tr>
					<td >
						原来密码
					</td>
					<td >
					<input type="password" name="password" >
					</td>
				</tr>
				<tr>
					<td>
						修改密码
					</td>
					<td>
					<input type="password" name="password1" >
					</td>
				</tr>
			<tr>
					<td>
						确认密码
					</td>
					<td>
					<input type="password" name="password2" >
					</td>
				</tr>
<tr><td></td>
<td >
				<input type="submit"  value="修改密码"  class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
			</td>
</tr>
			</table>
		
				  <tr>
        <td><img src="/hrclub/images/main_3.gif"  height="36" alt="" /></td>
      </tr>
      	</table>
		</form>
		</td>
		</tr>
		</table>
			<%} %>
			 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>

</html>
