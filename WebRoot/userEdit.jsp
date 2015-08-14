<%@ page language="java"  import="com.hrclub.to.*" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/ParamUtil.js"></script>
<SCRIPT language="JavaScript" src="<%=request.getContextPath() %>/js/area_array.js"></SCRIPT> 
<script>
function jscheckform(){
  if(document.checkform.userName.value==""){
    alert("请输入用户名称");
    document.checkform.userName.focus();
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
  
  if(document.checkform.identifyCard.value==""){
    alert("请输入有效证件号码");
    document.checkform.identifyCard.focus();
    return false;
  } 
  if(document.checkform.address.value==""){
    alert("请输入联系地址");
    document.checkform.address.focus();
    return false;
  }
  if(document.checkform.postcode.value==""){
    alert("请输入邮政编码");
    document.checkform.postcode.focus();
    return false;
  }
  if(document.checkform.tel.value==""){
    alert("请输入联系电话");
    document.checkform.tel.focus();
    return false;
  }
  if(document.checkform.mobile.value==""){
    alert("请输入移动电话");
    document.checkform.mobile.focus();
    return false;
  } 
  if(document.checkform.email.value==""){
    alert("请输入E-MAIL地址");
    document.checkform.email.focus();
    return false;
  }
  
  if(!isTelnum(document.checkform.tel.value)){
    alert("联系电话不合法");
    document.checkform.tel.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.postcode.value)){
    alert("邮政编码不合法");
    document.checkform.postcode.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.mobile.value)){
    alert("移动电话不合法");
    document.checkform.mobile.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.fax.value)){
    alert("传真号码不合法");
    document.checkform.fax.focus();
    return false;
  } 
  if(!isEmail(document.checkform.email.value)){
    alert("E-MAIL地址不合法");
    document.checkform.email.focus();
    return false;
  } 
  if(confirm('您确定要提交么？')){
 	 document.checkform.submit();
  }
}
</script>
</head>

<body topmargin=0 leftmargin=0>
	<%@include file="Common.jsp"%>
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
						<td  valign=top> 
							<%@include file="CommonMenu.jsp"%>
						</td>
						<td valign=top>
							<%
UserTO user = (UserTO)request.getAttribute("user");
String action = request.getParameter("action");
if (action == null)
	action = "";
%>
<form name="checkform" action="qy.act?operation=useredit" method=post>
<input type=hidden name="action" value="<%=action %>">
<%
if (action.equalsIgnoreCase("update")) { 
%>
<input type=hidden name="userID" value="<%=user.getUserid() %>">
<%   
} 
%>
<table   cellspacing="1" width="100%" align=center bordercolor="#000080" bordercolordark="#FFFFFF" border=1>
<tr>
<td colspan=2 align=center background='image/cb_blue.gif' >用户信息</td> 
</tr>
<tr>
<td>用户名称</td>
<td> 
<input type=text size=40 name="userName" value="<%=user.getUsername() %>">
&nbsp;<input type=radio name="type" value=1 checked>个人  
&nbsp;<input type=radio name="type" value=2>公司
	<script>
		for(var i=0;i<document.checkform.type.length;i++){
    		if(document.checkform.type[i].value==<%=user.getType()%>)
         	{
            	document.checkform.type[i].checked=true;
            	break;
        	}
    	}
	 </script>
</td>
</tr>  
<tr>
     <td>所在地：</td>
     <td>
		<Select id=province size=1 name="prov">
					<OPTION selected></OPTION>
		</Select>&nbsp;&nbsp;&nbsp;&nbsp;
		<Select id=city size=1 name=city>
					<OPTION selected></OPTION>
		</Select> 
		<SCRIPT language=javascript>
		InitCitySelect(document.checkform.prov,document.checkform.city);
		InitCitySelect2(document.checkform.prov,document.checkform.city,'<%=user.getCity()%>');
		  
		</SCRIPT>
	 </td>
   </tr>
    
<tr>
<td>有效证件号码：</td>
<td>
	 <input type=text name="identifyCard" size=30 value="<%=user.getIdentifyCard() %>">&nbsp;&nbsp;&nbsp;&nbsp;
     <input type=radio name="identifyType" value="1" <%=(user.getIdentifyType()==1)?"checked":"" %>>身份证 
     <input type=radio name="identifyType" value="2" <%=(user.getIdentifyType()==2)?"checked":"" %>>其他

</td>
</tr>
<tr>
<td>银行帐户信息
</td>
<td>
	账号：<input type=text name="bankAccount" size=50 maxlength=50  value="<%=user.getBankAccount() %>"><br>
	<input type=radio name="banktype" value="1">工商银行 &nbsp;&nbsp;
    <input type=radio name="banktype" value="2">农业银行 &nbsp;&nbsp;
    <input type=radio name="banktype" value="3">招商银行 &nbsp;&nbsp;
	<input type=radio name="banktype" value="4">建设银行<br>
	<input type=radio name="banktype" value="5">中国银行 &nbsp;&nbsp;
	<input type=radio name="banktype" value="6">交通银行 &nbsp;&nbsp;
	<input type=radio name="banktype" value="7">兴业银行 &nbsp;&nbsp;
	<br>
	<font color=blue>温馨提示：您在预付款或系统退款的时候使用的帐户，该信息您也可以暂时不提供。</font>
	<script>
	for(var i=0;i<document.checkform.banktype.length;i++){
			    		if(document.checkform.banktype[i].value==<%=user.getBanktype()%>)
			         	{
			            	document.checkform.banktype[i].checked=true;
			            	break;
			        	}
			    	}
	</script>
</td>
</tr>
<tr>
<td>联系地址：</td>
<td><input type=text name="address" size=70 value="<%=user.getAddress() %>"></td>
</tr>
<tr>
<td>邮政编码：</td>
<td><input type=text name="postcode" value="<%=user.getPostcode() %>"></td>
</tr>
<tr>
<td>联系电话：</td>
<td><input type=text name="tel" value="<%=user.getTel() %>"></td>
</tr>
<tr>
<td>移动电话：</td>
<td><input type=text name="mobile" value="<%=user.getMobile() %>"> </td>
</tr>
<tr>
<td>传真：</td>
<td><input type=text name="fax" value="<%=user.getFax() %>"> </td>
</tr>
<tr>
<td>E-MAIL：</td>
<td><input type=text name="email" value="<%=user.getEmail() %>"> </td>
</tr>
<tr>
<td>QQ 或 MSN：</td>
<td><input type=text name="qqmsn" value="<%=user.getQqmsn() %>"> </td>
</tr>
<tr>
		     <td>联系信息：</td>
		     <td>
		     <input type='radio' name="openType" value="1" <%=(user.getOpenType()==1)?"checked":"" %>>不公开
		     <input type='radio' name="openType" value="2" <%=(user.getOpenType()==2)?"checked":"" %>>对行业专家公开
		     <input type='radio' name="openType" value="3" <%=(user.getOpenType()==3)?"checked":"" %>>对注册用户公开
		     <input type='radio' name="openType" value="4" <%=(user.getOpenType()==4)?"checked":"" %>>完全公开
			</td>
</tr>
<tr>
<td>个人简介：</td>
<td>
	<textarea name="desc" rows=10 cols=60><%=user.getDesc()%></textarea>
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type=button value="保存" onclick="jscheckform();">
<input type=button value="返回" onclick="history.back();">
</td>
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
 
 