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
// ���庯��������3���������ֱ�Ϊ���������֣�����Ԫ�������ַ����ƣ� 
if (field.value.length > maxlimit) 
//���Ԫ�����ַ�����������ַ�������������ַ����ضϣ� 
field.value = field.value.substring(0, maxlimit); 
else 
//�ڼ������ı�������ʾʣ����ַ����� 
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
    alert("������Ϸ����ʺ�");
    document.checkform.userID.focus();
    return false;
  }
  if(document.checkform.userName.value==""){
    alert("����������");
    document.checkform.userName.focus();
    return false;
  }
  if(document.checkform.password1.value==""){
    alert("���������룡");
    document.checkform.password1.focus();
    return false;
  }
  if(document.checkform.password1.value!=document.checkform.password2.value){
    alert("�������õ����벻һ�£�");
    document.checkform.password1.focus();
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
   
  if(document.checkform.desc.value==""){
    alert("���������˵����");
    document.checkform.desc.focus();
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
 	 document.checkform.password.value=hex_md5(document.checkform.password1.value);
 	 document.checkform.submit();
  }
}

function checkUser() {
  var name = dwr.util.getValue("userID");
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

<body topmargin=0 leftmargin=0> 
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
						<td valign=top>
							<form name="checkform" method="post" action="qy.act?operation=userregister">
<table   cellspacing="0" width="90%" align=center bordercolor="#000080" bordercolordark="#FFFFFF" border=1>
	<tr>
   	 <td colspan=2 background='image/cb_blue.gif'>��ͨ�ͻ�ע�᣺�뾡����ϸ��д������Ϣ���Ա�ר�һ���������ϵ��<font color=red>(*)</font>���������д�����ݡ�
   	 </td>
   </tr>
   <tr>
     <td>�ʺ�<font color=red>(*)</font>��</td>
     <td>
     <input type=text id="userID" name="userID" value=""> <input type=button value='����Ƿ����' onclick='checkUser();'/><br>
     ������4��18λ��Сд��ĸ�����ֻ��»�����ɡ�
     <font color=red>
     <span id="ajaxReply"></span>
     </font>
     </td>
   </tr>
   <tr>
     <td>�û�����<font color=red>(*)</font>��</td>
     <td>
     <input type=text size=50 maxlength=50  name="userName" value="">
     <input type=radio name="type" value="0" checked>���� 
     <input type=radio name="type" value="1">��˾����
     </td>
   </tr>
   <tr>
     <td>����<font color=red>(*)</font>��</td>
     <td><input type=password name="password1" value=""></td>
   </tr>
   <tr>
     <td>�ظ�����<font color=red>(*)</font>��</td>
     <td><input type=password name="password2" value=""></td>
   </tr>
   <input type=hidden name="password" value="">
   <tr>
     <td>��Ч֤�����룺</td>
     <td>
     <input type=text size=50 maxlength=50  name="identifyCard" value=""> 
     <input type=radio name="identifyType" value="1" checked> ���֤ &nbsp;
     <input type=radio name="identifyType" value="2"> ����֤��
     </td>
   </tr> 
   <tr>
     <td>ʡ��<font color=red>(*)</font>��</td>
     <td>
     <Select id=province size=1 name="prov">
			<OPTION selected></OPTION>
	 </Select>
     </td>
   </tr>
   <tr>
      <td>����<font color=red>(*)</font>��</td>
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
	<td>����˵��<font color=red>(*)</font></td>
	<td>
		<textarea name="desc" rows=10 cols=60 wrap=physical onKeyDown="textCounter(document.checkform.desc,document.checkform.remLen2,250);" onKeyUp="textCounter(document.checkform.desc,document.checkform.remLen2,250);"></textarea>
		<br>�������� <input readonly type=text name=remLen2 size=4 maxlength=3 value="250"> ���ַ�
	</td>
	</tr>
	
	
<tr>
<td>��ϵ��ʽ
<br><font color=blue>�뾡���ṩ��Ч���ϣ��Ա�������ϵ�����ǽ�Ϊ������Ϣ���ܡ�</font>
</td>
<td>
	<table width=100%>
		<tr>
			<td >��ϵ��ַ
			</td>
			<td><input type=text name="address" value="">
			</td>
		</tr>
		<tr>
			<td>�ʱ�
			</td>
			<td><input type=text name="postcode" value="">
			</td>
		</tr>
		<tr>
			<td>��ϵ�绰
			</td>
			<td><input type=text name="tel" value="">
			</td>
		</tr>
		<tr>
			<td>�ƶ��绰
			</td>
			<td><input type=text name="mobile" value="">
			</td>
		</tr>
		<tr>
			<td>����
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
			<td>QQ��MSN
			</td>
			<td><input type=text name="qqmsn" value="">
			</td>
			
		</tr>
		<tr>
			<td colspan=2>
			<font color=blue>��ܰ��ʾ����ע��ɹ����������������ϵ��ʽ�ı��̶ܳȺ͹�������</font>
			</td>
		</tr>
	</table>
</td>
</tr>
<tr>
	<td>�����ʻ���Ϣ
	</td>
	<td>
	�����˺ţ�<input type=text  size=50 maxlength=50 name="bankAccount" value=""><br>
	<input type=radio name="banktype" value="1">�������� &nbsp;&nbsp;
    <input type=radio name="banktype" value="2">ũҵ���� &nbsp;&nbsp;
    <input type=radio name="banktype" value="3">�������� &nbsp;&nbsp;
	<input type=radio name="banktype" value="4">��������<br>
	<input type=radio name="banktype" value="5">�й����� &nbsp;&nbsp;
	<input type=radio name="banktype" value="6">��ͨ���� &nbsp;&nbsp;
	<input type=radio name="banktype" value="7">��ҵ���� &nbsp;&nbsp;
	<br><font color=blue>��ܰ��ʾ������Ԥ�����ϵͳ�˿��ʱ��ʹ�õ��ʻ�������Ϣ��Ҳ������ʱ���ṩ��</font>
	</td>
	 
	</tr>
<tr> 
     <td colspan=2 align=center><input type=button   value=" �� �� ע �� " onclick="jscheckform();"></td>
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
 
 