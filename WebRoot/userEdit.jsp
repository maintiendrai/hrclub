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
    alert("�������û�����");
    document.checkform.userName.focus();
    return false;
  }
  if(document.checkform.prov.options[document.checkform.prov.selectedIndex].value=="000000"){
    alert("��ѡ��ʡ��");
    document.checkform.prov.focus();
    return false;
  } 
  if(document.checkform.city.options[document.checkform.city.selectedIndex].value==document.checkform.prov.options[document.checkform.prov.selectedIndex].value){
    alert("��ѡ�����");
    document.checkform.city.focus();
    return false;
  } 
  
  if(document.checkform.identifyCard.value==""){
    alert("��������Ч֤������");
    document.checkform.identifyCard.focus();
    return false;
  } 
  if(document.checkform.address.value==""){
    alert("��������ϵ��ַ");
    document.checkform.address.focus();
    return false;
  }
  if(document.checkform.postcode.value==""){
    alert("��������������");
    document.checkform.postcode.focus();
    return false;
  }
  if(document.checkform.tel.value==""){
    alert("��������ϵ�绰");
    document.checkform.tel.focus();
    return false;
  }
  if(document.checkform.mobile.value==""){
    alert("�������ƶ��绰");
    document.checkform.mobile.focus();
    return false;
  } 
  if(document.checkform.email.value==""){
    alert("������E-MAIL��ַ");
    document.checkform.email.focus();
    return false;
  }
  
  if(!isTelnum(document.checkform.tel.value)){
    alert("��ϵ�绰���Ϸ�");
    document.checkform.tel.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.postcode.value)){
    alert("�������벻�Ϸ�");
    document.checkform.postcode.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.mobile.value)){
    alert("�ƶ��绰���Ϸ�");
    document.checkform.mobile.focus();
    return false;
  } 
  if(!isTelnum(document.checkform.fax.value)){
    alert("������벻�Ϸ�");
    document.checkform.fax.focus();
    return false;
  } 
  if(!isEmail(document.checkform.email.value)){
    alert("E-MAIL��ַ���Ϸ�");
    document.checkform.email.focus();
    return false;
  } 
  if(confirm('��ȷ��Ҫ�ύô��')){
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
				<!-- ��1�У�����ҳ��logo������ -->
				<td>
					<%@include file="title.html"%>

				</td>
			</tr>
			<tr>
				<!-- ���������� -->
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
<td colspan=2 align=center background='image/cb_blue.gif' >�û���Ϣ</td> 
</tr>
<tr>
<td>�û�����</td>
<td> 
<input type=text size=40 name="userName" value="<%=user.getUsername() %>">
&nbsp;<input type=radio name="type" value=1 checked>����  
&nbsp;<input type=radio name="type" value=2>��˾
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
     <td>���ڵأ�</td>
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
<td>��Ч֤�����룺</td>
<td>
	 <input type=text name="identifyCard" size=30 value="<%=user.getIdentifyCard() %>">&nbsp;&nbsp;&nbsp;&nbsp;
     <input type=radio name="identifyType" value="1" <%=(user.getIdentifyType()==1)?"checked":"" %>>���֤ 
     <input type=radio name="identifyType" value="2" <%=(user.getIdentifyType()==2)?"checked":"" %>>����

</td>
</tr>
<tr>
<td>�����ʻ���Ϣ
</td>
<td>
	�˺ţ�<input type=text name="bankAccount" size=50 maxlength=50  value="<%=user.getBankAccount() %>"><br>
	<input type=radio name="banktype" value="1">�������� &nbsp;&nbsp;
    <input type=radio name="banktype" value="2">ũҵ���� &nbsp;&nbsp;
    <input type=radio name="banktype" value="3">�������� &nbsp;&nbsp;
	<input type=radio name="banktype" value="4">��������<br>
	<input type=radio name="banktype" value="5">�й����� &nbsp;&nbsp;
	<input type=radio name="banktype" value="6">��ͨ���� &nbsp;&nbsp;
	<input type=radio name="banktype" value="7">��ҵ���� &nbsp;&nbsp;
	<br>
	<font color=blue>��ܰ��ʾ������Ԥ�����ϵͳ�˿��ʱ��ʹ�õ��ʻ�������Ϣ��Ҳ������ʱ���ṩ��</font>
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
<td>��ϵ��ַ��</td>
<td><input type=text name="address" size=70 value="<%=user.getAddress() %>"></td>
</tr>
<tr>
<td>�������룺</td>
<td><input type=text name="postcode" value="<%=user.getPostcode() %>"></td>
</tr>
<tr>
<td>��ϵ�绰��</td>
<td><input type=text name="tel" value="<%=user.getTel() %>"></td>
</tr>
<tr>
<td>�ƶ��绰��</td>
<td><input type=text name="mobile" value="<%=user.getMobile() %>"> </td>
</tr>
<tr>
<td>���棺</td>
<td><input type=text name="fax" value="<%=user.getFax() %>"> </td>
</tr>
<tr>
<td>E-MAIL��</td>
<td><input type=text name="email" value="<%=user.getEmail() %>"> </td>
</tr>
<tr>
<td>QQ �� MSN��</td>
<td><input type=text name="qqmsn" value="<%=user.getQqmsn() %>"> </td>
</tr>
<tr>
		     <td>��ϵ��Ϣ��</td>
		     <td>
		     <input type='radio' name="openType" value="1" <%=(user.getOpenType()==1)?"checked":"" %>>������
		     <input type='radio' name="openType" value="2" <%=(user.getOpenType()==2)?"checked":"" %>>����ҵר�ҹ���
		     <input type='radio' name="openType" value="3" <%=(user.getOpenType()==3)?"checked":"" %>>��ע���û�����
		     <input type='radio' name="openType" value="4" <%=(user.getOpenType()==4)?"checked":"" %>>��ȫ����
			</td>
</tr>
<tr>
<td>���˼�飺</td>
<td>
	<textarea name="desc" rows=10 cols=60><%=user.getDesc()%></textarea>
</td>
</tr>
<tr>
<td colspan=2 align=center>
<input type=button value="����" onclick="jscheckform();">
<input type=button value="����" onclick="history.back();">
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
				<!-- ��4�У���Ȩ��ע�� -->
				<td>
					<%@include file="foot.html"%>
				</td>
			</tr>
		</table>
	</body>
 
</html>
 
 