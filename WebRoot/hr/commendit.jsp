
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>


<html>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	


		<title>IT人才推荐</title>
	<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath() %>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath() %>/js/country/change_region.js"></script>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<script  src='<%=request.getContextPath() %>/js/basicinfo.js'> </script>
	<style type="text/css">
<!--
.STYLE1 {font-size: 14px}
.STYLE2 {font-size: 10px}
.STYLE4 {color: #FF0000}
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
  
  
  if(confirm('您确定要推荐么？')){
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
	  <%
String hrID = (String)session.getAttribute("hrID");
if(null==hrID) {

	response.sendRedirect("../hr/hrlogin.jsp");

}	else {
%>
	<body>


	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
	<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">推荐IT人才</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  border="0" align="center">
		<form  name="checkform" method="post" action="itregedit.do">
		
			<table  height="175" border="0" align="center">
				<tr>
					<td  colspan="2">
						请填写IT人才基本信息	下一步填写专业信息		</td>
				 
				</tr>
				<tr>
					<td width="110">
						账&nbsp;&nbsp;&nbsp;&nbsp;号					</td>
					<td>
				  <input type="text" name="userid" />
				  <span class="STYLE4">*</span>				  <span class="STYLE2">必须由4到18位的小写字母、数字或下划线组成				  </span></td>
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
						<input type="text" name="address" value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						邮&nbsp;&nbsp;&nbsp;&nbsp;编
					</td>
					<td>
						<input type="text" name="post" value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						固定电话
					</td>
					<td>
						<input type="text" name="telephone"
							value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						移动电话
					</td>
					<td>
						<input type="text" name="mobiletphone"
							value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					
					<td colspan="2"><input type="hidden" name="operation" value="commendit">			
					<input type="button" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit" value=" 推 荐 " onClick="jscheckform();"/>
					    <input type="reset" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit2" value=" 重 置 " /></td>
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
			<%} %>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>

</html>
