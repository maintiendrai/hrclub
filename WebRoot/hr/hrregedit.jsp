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
		<title>HR������Ϣע��</title>
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
    alert("������Ϸ��˺�");
    document.checkform.hrid.focus();
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

  if(document.checkform.name.value==""){
    alert("��������ʵ������");
    document.checkform.name.focus();
    return false;
  }

  if(document.checkform.born.value==""){
    alert("��ѡ��������ڣ�");
    document.checkform.born.focus();
    return false;
  }
  if(document.checkform.province.value=="no"){
    alert("��ѡ��ʡ�ݣ�");
    document.checkform.province.focus();
    return false;
  }
  
    if(document.checkform.city.value=="no"){
    alert("��ѡ����У�");
    document.checkform.city.focus();
    return false;
  }
  
  
   if(!isAreaNumber(document.checkform.telephone.value,13)){
    alert("�̶����벻�Ϸ�");
    document.checkform.telephone.focus();
    return false;
  }
  
   if(!isPhoneNumber(document.checkform.mobilephone.value,11)&&document.checkform.mobilephone.value!=""){
    
    alert("�ƶ����벻�Ϸ�");
    document.checkform.mobilephone.focus();
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
     if(document.checkform.calling.value=="no"){
    alert("��ѡ����ҵ");
    document.checkform.calling.focus();
    return false;
  }
  
    if(document.checkform.corporation.value==""){
    alert("�����빫˾����");
    document.checkform.corporation.focus();
    return false;
  }
  

  
  if(confirm('��ȷ��Ҫע��ô��')){
 	 document.checkform.password.value=hex_md5(document.checkform.password.value);
 	 document.checkform.submit();
  }
}

function checkUser() {
  var name = dwr.util.getValue("hrid");
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
<%  HashMap listcall = helper.getCallingcomf();%>
	<body>
		<form name="checkform" method="post" action="hrregedit.do">
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
  
	
			<table align="center" width="558">
		
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">HR������ע��</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table   border="0" align="center">
								
				<tr>
					<td width="250" align="right">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="hrid" style="width=152"/>
						<span class="star">*</span>
					</td>
				</tr>
				<tr>
				<td></td>
				<td class="small">
				&nbsp;&nbsp;&nbsp;&nbsp;������4��18λ��Сд��ĸ�����ֻ��»������
				</td> 
				</tr>
				<tr>
					<td align="right">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password" style="width=152"/> <span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						ȷ������
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="password2" style="width=152"/> <span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						��ʵ����
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="name" /> <span class="STYLE4">*</span><span class="STYLE2">
					</td>
				</tr>
				<tr>
					<td align="right">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>

						&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" name="sex" value="male" checked="checked" />
						��
						<input type="radio" name="sex" value="woman" />
						Ů
					</td>
				</tr>
				<tr>
					<td align="right">
						��������
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="born" class="Wdate"
							onfocus="new WdatePicker(this)" value="" />
					 	<span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						����ʡ��
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.checkform.city , &#13;&#10;       window.document.checkform.country.options[selectedIndex].value );">
							<option selected="selected" value="no">
								��ѡ��
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
						���ڳ���
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<select name="city"
							onChange="change_region( &#13;&#10;        window.document.checkform.city , &#13;&#10;        window.document.checkform.state.options[selectedIndex].value );">

							<option selected="selected" value="no">
								��ѡ��
							</option>
						</select>
						<span class="STYLE4">*</span>
					</td>
				</tr>

				<tr>
					<td align="right">
						�̶��绰
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="telephone" value="">	<span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						�ƶ��绰
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="mobilephone" value="">
					</td>
				</tr>
				<tr>
					<td align="right">
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="email" /> <span class="STYLE4">*</span><span class="STYLE2"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						��˾����
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<select name="corpkind">
							<option selected="selected" value="0">
								��ѡ��
							</option>
							<option value="1">
								������ҵ
							</option>
							<option value="2">
								˽Ӫ��ҵ
							</option>
							<option value="3">
								���ʶ�����ҵ
							</option>
							<option value="4">
								���������ҵ
							</option>
							<option value="0">
								����
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td align="right">
						��&nbsp;&nbsp;&nbsp;&nbsp;ҵ
					</td>
					<td>
					<table><tr><td>
					&nbsp;&nbsp;&nbsp;&nbsp;<%
						out.print(tb.getSelect("calling", listcall, "��ѡ��","no"));
						%>  </td>
						<td>
				  <span class="STYLE4">*</span>
				   </td></tr>
				   </table></td>
				</tr>
				<tr>
					<td align="right">
						��˾����
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="corporation" value="" />	<span class="STYLE4">*</span>
					</td>
				</tr>
				<tr>
					<td align="right">
						��˾��վ
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="website" />
					</td>
				</tr>
	
					<tr>
					<td align="right">
						��ϵ��ַ
					</td>
					<td>
						&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="address" />
					</td>
				</tr>
				<tr>
					<td align="right">
						��˾���
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
							<input type="button" name="Submit" value="ע&nbsp;��"
								onClick="jscheckform();" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
							<input type="reset" name="Submit2" value="��&nbsp;��" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
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
