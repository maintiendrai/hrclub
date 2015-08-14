<%@ page language="java" import="java.util.*" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
	<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>

	<head>
	
			<%
String url = request.getContextPath();
%>
		<title>HR基本信息注册</title>
		<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE2 {font-size: 12px;}
.STYLE4 {color: #FF0000}
-->
    </style>
		<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script
			src="<%=request.getContextPath()%>/js/country/change_region.js"></script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
		<script src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<script> 
function jscheckform(){

  if(!isAccountID(document.checkform.hrid.value)){
    alert("请输入合法账号");
    document.checkform.hrid.focus();
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
    alert("请输入真实姓名！");
    document.checkform.name.focus();
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
  
  
   if(!isAreaNumber(document.checkform.telephone.value,13)){
    alert("固定号码不合法");
    document.checkform.telephone.focus();
    return false;
  }
  
   if(!isPhoneNumber(document.checkform.mobilephone.value,11)&&document.checkform.mobilephone.value!=""){
    
    alert("移动号码不合法");
    document.checkform.mobilephone.focus();
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
     if(document.checkform.calling.value=="no"){
    alert("请选择行业");
    document.checkform.calling.focus();
    return false;
  }
  
    if(document.checkform.corporation.value==""){
    alert("请输入公司名称");
    document.checkform.corporation.focus();
    return false;
  }
  

  
  if(confirm('您确定要注册么？')){
 	 document.checkform.password.value=hex_md5(document.checkform.password.value);
 	 document.checkform.submit();
  }
}

function checkUser() {
  var name = dwr.util.getValue("hrid");
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
	</head>
<%  HashMap listcall = helper.getCallingcomf();%>
	<body>
		<form name="checkform" method="post" action="hrregedit.do">
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
  
	
			<table align="center" width="558">
		
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">HR经理人注册</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
								
				<tr>
					<td width="250" align="right">
						账&nbsp;&nbsp;&nbsp;&nbsp;号
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="hrid" style="width=152"/>
						<span class="star">*</span>
					</td>
				</tr>
				<tr>
				<td></td>
				<td class="small">
				&nbsp;&nbsp;&nbsp;&nbsp;必须由4到18位的小写字母、数字或下划线组成
				</td> 
				</tr>
				<tr>
					<td align="right">
						密&nbsp;&nbsp;&nbsp;&nbsp;码
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" style="width=152"/> <span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						确认密码
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password2" style="width=152"/> <span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						真实姓名
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" /> <span class="STYLE4">*</span><span class="STYLE2">
					</td>
				</tr>
				<tr>
					<td align="right">
						性&nbsp;&nbsp;&nbsp;&nbsp;别
					</td>
					<td>

						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="male" checked="checked" />
						男
						<input type="radio" name="sex" value="woman" />
						女
					</td>
				</tr>
				<tr>
					<td align="right">
						出生日期
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="born" class="Wdate"
							onfocus="new WdatePicker(this)" value="" />
					 	<span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						所在省份
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.checkform.city , &#13;&#10;       window.document.checkform.country.options[selectedIndex].value );">
							<option selected="selected" value="no">
								请选择
							</option>
							<script language="javascript">
        set_select_options( window.document.checkform.country, country, "" ) ;
						</script>
						</select>
						 <span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						所在城市
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<select name="city"
							onChange="change_region( &#13;&#10;        window.document.checkform.city , &#13;&#10;        window.document.checkform.state.options[selectedIndex].value );">

							<option selected="selected" value="no">
								请选择
							</option>
						</select>
						<span class="STYLE4">*</span>
					</td>
				</tr>

				<tr>
					<td align="right">
						固定电话
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="telephone" value="">	<span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						移动电话
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mobilephone" value="">
					</td>
				</tr>
				<tr>
					<td align="right">
						邮&nbsp;&nbsp;&nbsp;&nbsp;件
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" /> <span class="STYLE4">*</span><span class="STYLE2"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						公司性质
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<select name="corpkind">
							<option selected="selected" value="0">
								请选择
							</option>
							<option value="1">
								国有企业
							</option>
							<option value="2">
								私营企业
							</option>
							<option value="3">
								外资独资企业
							</option>
							<option value="4">
								中外合资企业
							</option>
							<option value="0">
								其他
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						行&nbsp;&nbsp;&nbsp;&nbsp;业
					</td>
					<td>
					<table><tr><td>
					&nbsp;&nbsp;&nbsp;&nbsp;<%
						out.print(tb.getSelect("calling", listcall, "请选择","no"));
						%>  </td>
						<td>
				  <span class="STYLE4">*</span>
				   </td></tr>
				   </table></td>
				</tr>
				<tr>
					<td align="right">
						公司名称
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="corporation" value="" />	<span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						公司网站
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="website" />
					</td>
				</tr>
	
					<tr>
					<td align="right">
						联系地址
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" />
					</td>
				</tr>
				<tr>
					<td align="right">
						公司简介
					</td>
					
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<textarea name="corinfo" cols="40" rows="5"></textarea>
					</td>
				</tr>
				<tr>
				    <td></td>
					<td align="left">
					&nbsp;&nbsp;
							<input type="hidden" name="operation" value="hrregedit">
							<input type="button" name="Submit" value="注&nbsp;册"
								onClick="jscheckform();" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
							<input type="reset" name="Submit2" value="重&nbsp;置" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
				
					</td>
					
				</tr>
			</table>
				  <tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
    
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>

		</form>
	</body>
</html>
