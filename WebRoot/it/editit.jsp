
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
    alert("������Ϸ��˺�");
    document.checkform.userid.focus();
    return false;
  }
  if(document.checkform.password.value.length<6){
    alert("���볤��̫С");
    document.checkform.password.focus();
    return false;
  }
  
  if(document.checkform.password.value==""){
    alert("���������룡");
    document.checkform.password.focus();
    return false;
  }
  if(document.checkform.password.value!=document.checkform.password2.value){
    alert("�������õ����벻һ�£�");
    document.checkform.password.focus();
    return false;
  } 
   if(!isNum(document.checkform.age.value)||document.checkform.age.value<0||document.checkform.age.value>100){
    alert("��������ȷ����");
    document.checkform.age.focus();
    return false;
  } 
  
  if(document.checkform.email.value==""){
    alert("������E-MAIL��ַ");
    document.checkform.email.focus();
    return false;
  }
   
  if(!isEmail(document.checkform.email.value)){
    alert("E-MAIL���Ϸ�");
    document.checkform.email.focus();
    return false;
  }
  
  if(confirm('��ȷ��Ҫע��ô��')){
 	 document.checkform.password.value=hex_md5(document.checkform.password.value);
 	 document.checkform.submit();
  }
}

function checkUser() {
  var name = dwr.util.getValue("userid");
  if(!isAccountID(name)){
  	alert('������Ϸ����û��ʺţ�');
  	document.getElementById("ajaxReply").innerHTML=""; 
  }else{
  document.getElementById("ajaxReply").innerHTML="���ڼ��....";
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
  <p align="center" class="STYLE1">�޸ĸ�����Ϣ</p>
  <table width="600" height="175" border="0" align="center">
    <tr>
      <td width="59">�˺�</td>
      <td width="131"><input type="text" name="userid"  value=<%=ituser.getUserid() %>></td>
    </tr>
    <tr>
      <td>����</td>
      <td><input type="password" name="password" /></td>
    </tr>
    <tr>
      <td>ȷ������</td>
      <td><input type="password" name="password2" /></td>
    </tr>
    <tr>
      <td>����</td>
      <td><input type="text" name="age" value=<%=ituser.getAge()%>></td>
    </tr>
    <tr>
      <td>�ʼ�</td>
      <td><input type="text" name="email" value=<%=ituser.getEmail() %> >
      <input type="hidden" name="operation"  value="updateit">
       <input type="hidden" name="userid2"  value=<%=ituser.getUserid() %>></td>
    </tr>
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Submit" value="ע��" />
        <input type="reset" name="Submit2" value="����" />
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>