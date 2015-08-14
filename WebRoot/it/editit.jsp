
<%@ page language="java" import="java.util.*,com.hrclub.to.ITUserTO;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
        <script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
    <title>My JSP 'editit.jsp' starting page</title>
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
   if(!isNum(document.checkform.age.value)||document.checkform.age.value<0||document.checkform.age.value>100){
    alert("请输入正确年龄");
    document.checkform.age.focus();
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
  </head>
  <%
  ITUserTO ituser=(ITUserTO)request.getAttribute("ituser");
  %>
  <body>
  <jsp:include page="../itforntop.jsp" flush="true" />
 <form id="form1" name="form1" method="post" action="updateit.do">
  <p align="center" class="STYLE1">修改个人信息</p>
  <table width="600" height="175" border="0" align="center">
    <tr>
      <td width="59">账号</td>
      <td width="131"><input type="text" name="userid"  value=<%=ituser.getUserid() %>></td>
    </tr>
    <tr>
      <td>密码</td>
      <td><input type="password" name="password" /></td>
    </tr>
    <tr>
      <td>确认密码</td>
      <td><input type="password" name="password2" /></td>
    </tr>
    <tr>
      <td>年龄</td>
      <td><input type="text" name="age" value=<%=ituser.getAge()%>></td>
    </tr>
    <tr>
      <td>邮件</td>
      <td><input type="text" name="email" value=<%=ituser.getEmail() %> >
      <input type="hidden" name="operation"  value="updateit">
       <input type="hidden" name="userid2"  value=<%=ituser.getUserid() %>></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Submit" value="注册" />
        <input type="reset" name="Submit2" value="重置" />
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>