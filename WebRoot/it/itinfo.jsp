<%@ page language="java" import="com.hrclub.to.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<%String url=request.getContextPath(); %>
<html>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
		<script language="javascript" type="text/javascript"
			src="<%=url %>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=url %>/js/country/change_region.js"></script>
		<script  src='<%=url %>/js/ParamUtil.js'> </script>
		<script  src='<%=url %>/js/basicinfo.js'> </script>
		<title>IT信息显示界面</title>


	</head>
<script> 
function jscheckform(){


  
  if(document.checkform.name.value==""){
    alert("请填写真实姓名！");
    document.checkform.name.focus();
    return false;
  }
  
   if(!isNum(document.checkform.age.value)||document.checkform.age.value<0||document.checkform.age.value>100){
    alert("请输入正确年龄");
    document.checkform.age.focus();
    return false;
  } 
  
    if(document.checkform.born.value==""){
    alert("请选择出生日期！");
    document.checkform.born.focus();
    return false;
  }
  if(document.checkform.province.value=="no"){
    alert("请选择省份！");
    document.checkform.province.focus();
    return false;
  }
  
    if(document.checkform.city.value=="no"){
    alert("请选择城市！");
    document.checkform.city.focus();
    return false;
  }
  
  if(document.checkform.email.value==""){
    alert("请输入E-MAIL地址");
    document.checkform.email.focus();
    return false;
  }
   
  if(!isEmail(document.checkform.email.value)){
    alert("E-MAIL不合法");
    document.checkform.email.focus();
    return false;
  }
  
  
  
     if(!isAreaNumber(document.checkform.post.value,6)){
    alert("邮编不合法");
    document.checkform.post.focus();
    return false;
  }
  
  
   if(!isPhoneNumber(document.checkform.telephone.value,13)||document.checkform.telephone.value.length<7){
    alert("电话号码不合法");
    document.checkform.telephone.focus();
    return false;
  }
  
   if(!isPhoneNumber(document.checkform.mobiletphone.value,11)||document.checkform.mobiletphone.value.length<8){
    alert("手机号码不合法");
    document.checkform.mobiletphone.focus();
    return false;
  }
  
  if(confirm('您确定要提交信息么？')){
 	 document.checkform.submit();
  }
}



</script>

	<body onload="change_region(country)">
		<%
			ITUserTO ituser =(ITUserTO)request.getAttribute("to");
		%>
		<div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/top.js"></script></div>

	 <table align="center" width="700">
   <tr>
   <td width="100" valign="top" ><iframe  height="550" frameborder="0" scrolling="no" src="<%=url %>/itforntop.jsp"></iframe>
   </td><td width="558" valign="top">
	
		<form name="checkform" method="post" action="itinfoup.do">
			<table align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile" >基本信息编辑</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  border="0" align="center">
									
				<tr>
					<td  width="100">
						真实姓名
					</td>
					<td width="300">
						<input type="text" name="name" value=<%=ituser.getName()%>>
					</td>
				</tr>
				<tr>
					<td>
						性&nbsp;&nbsp;&nbsp;&nbsp;别
					</td>
					<td>
						
							<input type="radio" name="sex" value="male"
								<% if(ituser.getSex()==0)  out.print("checked");%>>
							男
						
							<input type="radio" name="sex" value="woman"
								<% if(ituser.getSex()!=0)  out.print("checked");%>>
							女
						
					</td>
				</tr>
				<tr>
					<td>
						年&nbsp;&nbsp;&nbsp;&nbsp;龄
					</td>
					<td>
						<input type="text" name="age" value=<%=ituser.getAge()%> size="3">
					</td>
				</tr>
				<tr>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;件
					</td>
					<td>
						<input type="text" name="email" value=<%=ituser.getEmail()%>>

					</td>
				</tr>
				<tr>
					<td>
						出生日期
					</td>
					<td>
						<input type="text" name="born" class="Wdate"
							onfocus="new WdatePicker(this)" value="<%=ituser.getBorn()%>" />
					</td>
				</tr>
				<tr>
					<td>
						所在省份
					</td>
					<td>
						<select name="province" id="country"
							onChange="change_region( window.document.checkform.city , window.document.checkform.country.options[selectedIndex].value );">
							<option selected="selected" value=<%=ituser.getProvince() %>> <%=helper.getProvince(ituser.getProvince())	%></option>
							<script language="javascript">
        set_select_options( window.document.checkform.country, country, "" ) ;
						</script>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						所在城市
					</td>
					<td>
					<% %>
						<select id="city" name="city">
						
								
						<option selected="selected" value=<%=ituser.getCity() %>> <%=helper.getCity(ituser.getProvince(),ituser.getCity())%></option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						联系地址
					</td>
					<td>
						<input type="text" name="address" value=<%=ituser.getAddress()%>>
					</td>
				</tr>
				<tr>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;编
					</td>
					<td>
						<input type="text" name="post" value=<%=ituser.getPost()%>>
					</td>
				</tr>
				<tr>
					<td>
						固定电话
					</td>
					<td>
						<input type="text" name="telephone"
							value=<%=ituser.getTelephone()%> >
					</td>
				</tr>
				<tr>
					<td>
						移动电话
					</td>
					<td>
						<input type="text" name="mobiletphone"
							value=<%=ituser.getMobiletphone()%> >
					</td>
				</tr>
				<tr>
				<td>
				</td>
					
					<td>
				
					<input type="hidden" name="operation" value="itinfoup"   />
						
							<input type=button name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="提交信息"  onClick="jscheckform();" />
							<input type="reset" name="Submit2" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="重置信息" />
						
					</td>
				</tr>
			</table>
							  <tr>
        <td><img src="<%=url %>/images/main_3.gif"  height="36"  /></td>
      </tr>
			</table>
		</form>
		</td>
		</tr>
		
		</table>
		  <div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/down.js"></script></div>
	</body>
</html>
