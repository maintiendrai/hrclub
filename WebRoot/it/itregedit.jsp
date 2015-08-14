
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>


<html>
	<head>
			<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<%String url=request.getContextPath(); %>

		<title>IT人才注册</title>
	<script language="javascript" type="text/javascript"
			src="<%=url %>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=url %>/js/country/change_region.js"></script>
			<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script  src='<%=url %>/js/ParamUtil.js'> </script>
<script  src='<%=url %>/js/encryption.js'> </script>
<script  src='<%=url %>/js/basicinfo.js'> </script>
	<style type="text/css">
<!--
.STYLE2 {font-size: 10px}
.STYLE4 {color: #FF0000}
.STYLE6 {
	color: #000000;
	font-size: 16px;
	font-weight: bold;
}
-->
    </style>
	</head>
	
	<script> 
function jscheckform(){

  if(!isAccountID(document.checkform.userid.value)){
    alert("请输入合法账号");
    document.checkform.userid.focus();
    return false;
  }
  if(document.checkform.password.value.length<6){
    alert("密码长度太小");
    document.checkform.password.focus();
    return false;
  }
  
  if(document.checkform.password.value==""){
    alert("请设置密码！");
    document.checkform.password.focus();
    return false;
  }
  if(document.checkform.password.value!=document.checkform.password2.value){
    alert("两次设置的密码不一致！");
    document.checkform.password.focus();
    return false;
  } 
  
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
  
  
   if(!isAreaNumber(document.checkform.telephone.value,13)||document.checkform.telephone.value.length<7){
    alert("电话号码不合法");
    document.checkform.telephone.focus();
    return false;
  }
  
   if(!isPhoneNumber(document.checkform.mobiletphone.value,11)||document.checkform.mobiletphone.value.length<8){
    alert("手机号码不合法");
    document.checkform.mobiletphone.focus();
    return false;
  }
  
  
  if(confirm('您确定要注册么？')){
 	 document.checkform.password.value=hex_md5(document.checkform.password.value);
 	 document.checkform.submit();
  }
}

function checkUser() {
  var name = dwr.util.getValue("userid");
  if(!isAccountID(name)){
  	alert('请输入合法的用户帐号！');
  	document.getElementById("ajaxReply").innerHTML=""; 
  }else{
  document.getElementById("ajaxReply").innerHTML="正在检测....";
	  ajaxHelper.isUserExist(name, function(data) {
	    dwr.util.setValue("ajaxReply", data);
	  });
  }
}

</script>
	<body>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

	
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
		<form  name="checkform" method="post" action="itregedit.do">
		
			<table width="558"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">IT人才注册</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table width="500"  border="0" align="center">
				
				<tr>
					<td>
						账&nbsp;&nbsp;&nbsp;&nbsp;号					</td>
					<td>
				  <input type="text" name="userid" />
				  <span class="STYLE4">*</span>				  <span class="STYLE2">必须由4到18位的小写字母、数字或下划线组成				  </span></td>
				</tr>
				<tr>
					<td>
						密&nbsp;&nbsp;&nbsp;&nbsp;码					</td>
				  <td>
						<input type="password" name="password" />   <span class="STYLE4">*</span>
				    <span class="STYLE2"> 密码长度至少为6位				    </span></td>
				</tr>
			
			
				<tr>
					<td>
						确认密码					</td>
				  <td>
						<input type="password" name="password2" /></td>
				</tr>
				<tr>
					<td>
						真实姓名
					</td>
					<td >
						<input type="text" name="name" > <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						性&nbsp;&nbsp;&nbsp;&nbsp;别					</td>
					<td>
						
<input type="radio" name="sex" value="male" checked="checked" />							
男					
							<input type="radio" name="sex" value="woman" />
							女			</td>
				</tr>
				<tr>
					<td>
						年&nbsp;&nbsp;&nbsp;&nbsp;龄					</td>
					<td>
						<input type="text" name="age" size="3"/> <span class="STYLE4">*</span>						</td>
				</tr>
				
				<tr>
					<td>
						出生日期
					</td>
					<td>
						<input type="text" name="born" class="Wdate"
							onfocus="new WdatePicker(this)" value="" /> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						所在省份
					</td>
					<td>
						<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.checkform.city , &#13;&#10;       window.document.checkform.country.options[selectedIndex].value );">
							<option selected="selected" value="no"> 请选择</option>
							<script language="javascript">
        set_select_options( window.document.checkform.country, country, "" ) ;
						</script>
						</select> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						所在城市
					</td>
					<td>
						<select name="city"
							onChange="change_region( &#13;&#10;        window.document.checkform.city , &#13;&#10;        window.document.checkform.state.options[selectedIndex].value );">
						
						<option selected="selected" value="no"> 请选择</option>
						</select> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;件					</td>
					<td>
						<input type="text" name="email" />
						<span class="STYLE4">*</span>
								</td>
				</tr>
				<tr>
					<td>
						联系地址
					</td>
					<td>
						<input type="text" name="address" value="">
					</td>
				</tr>
				<tr>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;编
					</td>
				  <td>
						<input type="text" name="post" value="">
					<span class="STYLE4">*</span>					</td>
				</tr>
				<tr>
					<td>
						固定电话
					</td>
				  <td>
						<input type="text" name="telephone"
							value="">
					<span class="STYLE4">*</span>					</td>
				</tr>
				<tr>
					<td>
						移动电话
					</td>
				  <td>
						<input type="text" name="mobiletphone"
							value="">
					<span class="STYLE4">*</span>					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="operation" value="itregedit">			
					<input type="button"  name="Submit" class=btn1_mouseout onMouseOver="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
					 value="注册" onClick="jscheckform();"/>
					    <input type="reset" name="Submit2" class=btn1_mouseout onMouseOver="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
					     value="重置" /></td>
				</tr>
		  </table>
		  	  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
      	
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
		</form>
	</body>
</html>
