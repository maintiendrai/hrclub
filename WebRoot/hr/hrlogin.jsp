<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>

		<title>HR��¼����</title>
	</head>
	<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
	<link href="<%=request.getContextPath()%>/css/index.css"
		rel="stylesheet" type="text/css" />

	<script> 
function jscheckform(checkform){


 
  
   if(checkform.hrID.value==""){
		alert("������HR�˺�!");checkform.hrID.focus();return false;
	}
	if(checkform.password.value==""){
		alert("����������");checkform.password.focus();return false;
	}
   document.checkform.password.value=hex_md5(document.checkform.password.value)
}
function regedit(checkform){
	window.location.href='hrregedit.jsp';
}
 </script>
	<body>
		<%
			String msgerror = (String) request.getAttribute("msgerror");
			if (null != msgerror) {
				out.print(tb.getalert(msgerror));
			}
		%>
		<form name="checkform" method="post"
			action="FrontController.do?operation=hrlogin"
			onSubmit="return jscheckform(checkform)">
			<div align="center">
				<script language="javascript" type="text/javascript"
					src="<%=request.getContextPath()%>/js/top.js"></script>
			</div>


			<table width="558" border="0" align="center">
				<tr>
					<td height="60" valign="middle" class="top01">
						<table  border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td height="36" valign="top" class="titile">
									HR�����˵�½
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td background="<%=request.getContextPath()%>/images/main_2.gif"  >
						<table  align="center" >

							<tr >
								<td width="175" align="right" >
									HR�˺ţ�
								</td>
								<td width="255" align="left">
									<input type="text" name="hrID" style="width=152" />
								</td>
							</tr>
							<tr>
								<td width="175" align="right">
									��&nbsp;&nbsp;�룺
								</td>
								<td align="left">
									<input type="password" name="password" style="width=152" />
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div align="center">
										&nbsp;
										<input type="submit" name="Submit" value="  ��  ¼  "
											onClick="itlogin()" class=btn1_mouseout
											onmouseover="this.className='btn1_mouseover'"
											onmouseout="this.className='btn1_mouseout'" />
										<input type="button" name="Submit2" value="ע�����û�"
											onClick="regedit()" onClick="itlogin()" class=btn1_mouseout
											onmouseover="this.className='btn1_mouseover'"
											onmouseout="this.className='btn1_mouseout'" />
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<img src="<%=request.getContextPath()%>/images/main_3.gif"
							width="558" height="36" alt="" />
					</td>
				</tr>
			</table>
			<div align="center">
				<script language="javascript" type="text/javascript"
					src="<%=request.getContextPath()%>/js/down.js"></script>
			</div>
		</form>
	</body>
</html>
