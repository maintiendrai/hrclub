<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.utilname.value==""){
    alert("��λ���Ʋ���Ϊ�գ�");
    document.myform.utilname.focus();
    return false;
   }
   
   if(document.myform.contactname.value==""){
    alert("��ϵ�˲���Ϊ�գ�");
    document.myform.contactname.focus();
    return false;
   }
   
   if(document.myform.email.value==""){
    alert("�ʼ�����Ϊ�գ�");
    document.myform.email.focus();
    return false;
   }
   
   if(!isEmail(document.myform.email.value)){
    alert("�ʼ���ʽ����");
    document.myform.email.focus();
    return false;
   }
   
   if(document.myform.telephone.value==""){
    alert("��ϵ�绰����Ϊ�գ�");
    document.myform.telephone.focus();
    return false;
   }
   
   if(document.myform.address.value==""){
    alert("��ϵ��ַ����Ϊ�գ�");
    document.myform.address.focus();
    return false;
   }
   
   if(document.myform.utilinfo.value==""){
    alert("��λ��鲻��Ϊ�գ�");
    document.myform.utilinfo.focus();
    return false;
   }
   
}
</script>
<title>��λ��Ϣ����</title>
</head>

<body>
<%CooperateutilTO to = (CooperateutilTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=cooperateutiledit" onsubmit="return validator(this)">
<input type="hidden" name="utilID"  value="<%=to.getUtilID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸ĵ�λ��Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">��λ����</td>
      <td><input type="text" name="utilname" value="<%=to.getUtilname()%>" style="width:180px"/></td>
    
      <td>��λ����</td>
      <td>
           <select name="utilkind">
              
    			<option value="1" <% if(to.getUtilkind()==1) out.print("selected");%> >����</option>
    			<option value="0" <% if(to.getUtilkind()==0) out.print("selected");%> >��ҵ</option>
    				
  		   </select>
      </td>
    </tr>
    <tr>
      <td>��ϵ��</td>
      <td><input type="text" name="contactname" value="<%=to.getContactname()%>" style="width:180px"/></td>
      
      <td>�ʼ�</td>
      <td><input type="text" name="email" value="<%=to.getEmail()%>" style="width:180px"/></td>
      
    </tr>
    <tr>
      <td>��ϵ�绰</td>
      <td><input type="text" name="telephone" value="<%=to.getTelephone()%>" style="width:180px"/></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr>
      <td width="129">��ϵ��ַ</td>
      <td><input type="text" name="address" value="<%=to.getAddress()%>" style="width:330px"/></td>
    </tr>
    <tr><td><br></td></tr>
    <tr>
	  <td width="129">��λ���</td>
	  <td><textarea name="utilinfo" rows="7" cols="50"><%=to.getUtilinfo()%></textarea></td>
	</tr>
<tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>