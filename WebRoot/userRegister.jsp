<%@ page language="java"    contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" /> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
 <link href="css/style.css" rel="stylesheet" type="text/css">
<SCRIPT language="JavaScript" src="js/area_array.js"></SCRIPT> 
<SCRIPT language="JavaScript" src="js/en.js"></SCRIPT> 
<script type="text/javascript" src="js/ParamUtil.js"></script>
<SCRIPT LANGUAGE="JavaScript"> 
<!--// 
function textCounter(field, countfield, maxlimit) { 
// 定义函数，传入3个参数，分别为表单区的名字，表单域元素名，字符限制； 
if (field.value.length > maxlimit) 
//如果元素区字符数大于最大字符数，按照最大字符数截断； 
field.value = field.value.substring(0, maxlimit); 
else 
//在记数区文本框内显示剩余的字符数； 
countfield.value = maxlimit - field.value.length; 
} 
//--> 
</SCRIPT>  
<script src='<%=request.getContextPath() %>/dwr/interface/ajaxHelper.js'></script>
<script src='<%=request.getContextPath() %>/dwr/engine.js'></script>
<script  src='<%=request.getContextPath() %>/dwr/util.js'> </script>

<script> 
function jscheckform(){
  
  if(!isAccountID(document.checkform.userID.value)){
    alert("请输入合法的帐号");
    document.checkform.userID.focus();
    return false;
  }
  if(document.checkform.userName.value==""){
    alert("请输入名称");
    document.checkform.userName.focus();
    return false;
  }
  if(document.checkform.password1.value==""){
    alert("请设置密码！");
    document.checkform.password1.focus();
    return false;
  }
  if(document.checkform.password1.value!=document.checkform.password2.value){
    alert("两次设置的密码不一致！");
    document.checkform.password1.focus();
    return false;
  } 
  
  if(document.checkform.prov.options[document.checkform.prov.selectedIndex].value=="000000"){
    alert("请选择省份");
    document.checkform.prov.focus();
    return false;
  }
  if(document.checkform.city.options[document.checkform.city.selectedIndex].value==document.checkform.prov.options[document.checkform.prov.selectedIndex].value){
    alert("请选择城市");
    document.checkform.city.focus();
    return false;
  }
   
  if(document.checkform.desc.value==""){
    alert("请输入个人说明！");
    document.checkform.desc.focus();
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
  
  if(confirm('您确定要注册么？')){
 	 document.checkform.password.value=hex_md5(document.checkform.password1.value);
 	 document.checkform.submit();
  }
}

function checkUser() {
  var name = dwr.util.getValue("userID");
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

<body topmargin=0 leftmargin=0> 
		<table valign=top align=center width=870 cellSpacing=0 cellPadding=1
			border=0>

			<tr>
				<!-- 第1行：标题页：logo和索引 -->
				<td>
					<%@include file="title.html"%>

				</td>
			</tr>
			<tr>
				<!-- 工作区主体 -->
				<td>
				
				<table width=100%>
					<tr> 
						<td valign=top>
							<form name="checkform" method="post" action="qy.act?operation=userregister">
<table   cellspacing="0" width="90%" align=center bordercolor="#000080" bordercolordark="#FFFFFF" border=1>
	<tr>
   	 <td colspan=2 background='image/cb_blue.gif'>普通客户注册：请尽量详细填写以下信息，以便专家机构与您联系。<font color=red>(*)</font>代表必须填写的内容。
   	 </td>
   </tr>
   <tr>
     <td>帐号<font color=red>(*)</font>：</td>
     <td>
     <input type=text id="userID" name="userID" value=""> <input type=button value='检测是否可用' onclick='checkUser();'/><br>
     必须由4到18位的小写字母、数字或下划线组成。
     <font color=red>
     <span id="ajaxReply"></span>
     </font>
     </td>
   </tr>
   <tr>
     <td>用户名称<font color=red>(*)</font>：</td>
     <td>
     <input type=text size=50 maxlength=50  name="userName" value="">
     <input type=radio name="type" value="0" checked>个人 
     <input type=radio name="type" value="1">公司机构
     </td>
   </tr>
   <tr>
     <td>密码<font color=red>(*)</font>：</td>
     <td><input type=password name="password1" value=""></td>
   </tr>
   <tr>
     <td>重复密码<font color=red>(*)</font>：</td>
     <td><input type=password name="password2" value=""></td>
   </tr>
   <input type=hidden name="password" value="">
   <tr>
     <td>有效证件号码：</td>
     <td>
     <input type=text size=50 maxlength=50  name="identifyCard" value=""> 
     <input type=radio name="identifyType" value="1" checked> 身份证 &nbsp;
     <input type=radio name="identifyType" value="2"> 其他证件
     </td>
   </tr> 
   <tr>
     <td>省份<font color=red>(*)</font>：</td>
     <td>
     <Select id=province size=1 name="prov">
			<OPTION selected></OPTION>
	 </Select>
     </td>
   </tr>
   <tr>
      <td>城市<font color=red>(*)</font>：</td>
   	  <td>
   		<Select id=city size=1 name=city>
				<OPTION selected></OPTION>
		</Select> 
		<SCRIPT language=javascript>
                 InitCitySelect(document.checkform.prov,document.checkform.city);
        </SCRIPT>
  	  </td>
   </tr>
    <tr>
	<td>个人说明<font color=red>(*)</font></td>
	<td>
		<textarea name="desc" rows=10 cols=60 wrap=physical onKeyDown="textCounter(document.checkform.desc,document.checkform.remLen2,250);" onKeyUp="textCounter(document.checkform.desc,document.checkform.remLen2,250);"></textarea>
		<br>尚能输入 <input readonly type=text name=remLen2 size=4 maxlength=3 value="250"> 个字符
	</td>
	</tr>
	
	
<tr>
<td>联系方式
<br><font color=blue>请尽量提供有效资料，以便与您联系，我们将为您的信息保密。</font>
</td>
<td>
	<table width=100%>
		<tr>
			<td >联系地址
			</td>
			<td><input type=text name="address" value="">
			</td>
		</tr>
		<tr>
			<td>邮编
			</td>
			<td><input type=text name="postcode" value="">
			</td>
		</tr>
		<tr>
			<td>联系电话
			</td>
			<td><input type=text name="tel" value="">
			</td>
		</tr>
		<tr>
			<td>移动电话
			</td>
			<td><input type=text name="mobile" value="">
			</td>
		</tr>
		<tr>
			<td>传真
			</td>
			<td><input type=text name="fax" value="">
			</td>
		</tr>
		<tr>
			<td>EMAIL<font color=red>(*)</font>
			</td>
			<td><input type=text name="email" value="">
			</td>
		</tr>
		<tr>
			<td>QQ或MSN
			</td>
			<td><input type=text name="qqmsn" value="">
			</td>
			
		</tr>
		<tr>
			<td colspan=2>
			<font color=blue>温馨提示：您注册成功后可以设置以上联系方式的保密程度和公开对象。</font>
			</td>
		</tr>
	</table>
</td>
</tr>
<tr>
	<td>银行帐户信息
	</td>
	<td>
	银行账号：<input type=text  size=50 maxlength=50 name="bankAccount" value=""><br>
	<input type=radio name="banktype" value="1">工商银行 &nbsp;&nbsp;
    <input type=radio name="banktype" value="2">农业银行 &nbsp;&nbsp;
    <input type=radio name="banktype" value="3">招商银行 &nbsp;&nbsp;
	<input type=radio name="banktype" value="4">建设银行<br>
	<input type=radio name="banktype" value="5">中国银行 &nbsp;&nbsp;
	<input type=radio name="banktype" value="6">交通银行 &nbsp;&nbsp;
	<input type=radio name="banktype" value="7">兴业银行 &nbsp;&nbsp;
	<br><font color=blue>温馨提示：您在预付款或系统退款的时候使用的帐户，该信息您也可以暂时不提供。</font>
	</td>
	 
	</tr>
<tr> 
     <td colspan=2 align=center><input type=button   value=" 马 上 注 册 " onclick="jscheckform();"></td>
</tr>
</table>
</form>
						</td>
					</tr>
				</table>
				
				
				</td>
			</tr>

			<tr>
				<!-- 第4行：版权等注脚 -->
				<td>
					<%@include file="foot.html"%>
				</td>
			</tr>
		</table>
	</body>
 
</html>
 
 