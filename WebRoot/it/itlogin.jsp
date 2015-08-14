<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
			<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<link href="/hrclub/css/index.css" rel="stylesheet" type="text/css" />
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
	<%
String url = request.getContextPath();
%>
	<head>

		<title>IT人才登录界面</title>
	
		<title>添加工作经历</title>
<script> 
function jscheckform(checkform){

   if(checkform.userid.value==""){
		alert("请输入IT账号!");checkform.userid.focus();return false;
	}
	if(checkform.password.value==""){
		alert("请输入密码");checkform.password.focus();return false;
	}
 document.checkform.password.value=hex_md5(document.checkform.password.value)
  
}

 </script>
	</head>

	<body>
		<div align="center"><script language="javascript" type="text/javascript" src="/hrclub/js/top.js"></script></div>

		<form name="checkform" method="post" action="FrontController.do?operation=itlogin" onSubmit="return jscheckform(checkform)">
			
			<table width="430" height="100" border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">IT登录</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
				<tr>
					<td width="95">
						IT账号：
					</td>
					<td width="325">
						<input type="text" name="userid" size="18"/>
					</td>
				</tr>
				<tr>
					<td>
						密码：
					</td>
					<td>
						<input type="password" name="password" size="19"/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="left">

							<input type=submit value=" 登  录 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
							<input type=button value="注册新用户" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
						</div>
					</td>
				</tr>
			</table>
<tr>
        <td><img src="/hrclub/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
		</form>
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
                                      <div align="center"><script language="javascript" type="text/javascript" src="/hrclub/js/down.js"></script></div>
	</body>
</html>
