
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>


<html>
	<head>
			<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<%String url=request.getContextPath(); %>

		<title>IT�˲�ע��</title>
	<script language="javascript" type="text/javascript"
			src="<%=url %>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=url %>/js/country/change_region.js"></script>
			<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script  src='<%=url %>/js/ParamUtil.js'> </script>
<script  src='<%=url %>/js/encryption.js'> </script>
<script  src='<%=url %>/js/basicinfo.js'> </script>
	<style type="text/css">
<!--
.STYLE2 {font-size: 10px}
.STYLE4 {color: #FF0000}
.STYLE6 {
	color: #000000;
	font-size: 16px;
	font-weight: bold;
}
-->
    </style>
	</head>
	
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
  
  if(document.checkform.name.value==""){
    alert("����д��ʵ������");
    document.checkform.name.focus();
    return false;
  }
  
   if(!isNum(document.checkform.age.value)||document.checkform.age.value<0||document.checkform.age.value>100){
    alert("��������ȷ����");
    document.checkform.age.focus();
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
  
  
     if(!isAreaNumber(document.checkform.post.value,6)){
    alert("�ʱ಻�Ϸ�");
    document.checkform.post.focus();
    return false;
  }
  
  
   if(!isAreaNumber(document.checkform.telephone.value,13)||document.checkform.telephone.value.length<7){
    alert("�绰���벻�Ϸ�");
    document.checkform.telephone.focus();
    return false;
  }
  
   if(!isPhoneNumber(document.checkform.mobiletphone.value,11)||document.checkform.mobiletphone.value.length<8){
    alert("�ֻ����벻�Ϸ�");
    document.checkform.mobiletphone.focus();
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
	<body>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

	
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
		<form  name="checkform" method="post" action="itregedit.do">
		
			<table width="558"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01"  ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">IT�˲�ע��</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text" valign="top" >
								<table width="500"  border="0" align="center">
				
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��					</td>
					<td>
				  <input type="text" name="userid" />
				  <span class="STYLE4">*</span>				  <span class="STYLE2">������4��18λ��Сд��ĸ�����ֻ��»������				  </span></td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��					</td>
				  <td>
						<input type="password" name="password" />   <span class="STYLE4">*</span>
				    <span class="STYLE2"> ���볤������Ϊ6λ				    </span></td>
				</tr>
			
			
				<tr>
					<td>
						ȷ������					</td>
				  <td>
						<input type="password" name="password2" /></td>
				</tr>
				<tr>
					<td>
						��ʵ����
					</td>
					<td >
						<input type="text" name="name" > <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��					</td>
					<td>
						
<input type="radio" name="sex" value="male" checked="checked" />							
��					
							<input type="radio" name="sex" value="woman" />
							Ů			</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��					</td>
					<td>
						<input type="text" name="age" size="3"/> <span class="STYLE4">*</span>						</td>
				</tr>
				
				<tr>
					<td>
						��������
					</td>
					<td>
						<input type="text" name="born" class="Wdate"
							onfocus="new WdatePicker(this)" value="" /> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						����ʡ��
					</td>
					<td>
						<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.checkform.city , &#13;&#10;       window.document.checkform.country.options[selectedIndex].value );">
							<option selected="selected" value="no"> ��ѡ��</option>
							<script language="javascript">
        set_select_options( window.document.checkform.country, country, "" ) ;
						</script>
						</select> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						���ڳ���
					</td>
					<td>
						<select name="city"
							onChange="change_region( &#13;&#10;        window.document.checkform.city , &#13;&#10;        window.document.checkform.state.options[selectedIndex].value );">
						
						<option selected="selected" value="no"> ��ѡ��</option>
						</select> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��					</td>
					<td>
						<input type="text" name="email" />
						<span class="STYLE4">*</span>
								</td>
				</tr>
				<tr>
					<td>
						��ϵ��ַ
					</td>
					<td>
						<input type="text" name="address" value="">
					</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
				  <td>
						<input type="text" name="post" value="">
					<span class="STYLE4">*</span>					</td>
				</tr>
				<tr>
					<td>
						�̶��绰
					</td>
				  <td>
						<input type="text" name="telephone"
							value="">
					<span class="STYLE4">*</span>					</td>
				</tr>
				<tr>
					<td>
						�ƶ��绰
					</td>
				  <td>
						<input type="text" name="mobiletphone"
							value="">
					<span class="STYLE4">*</span>					</td>
				</tr>
				<tr>
					<td></td>
					<td><input type="hidden" name="operation" value="itregedit">			
					<input type="button"  name="Submit" class=btn1_mouseout onMouseOver="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
					 value="ע��" onClick="jscheckform();"/>
					    <input type="reset" name="Submit2" class=btn1_mouseout onMouseOver="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
					     value="����" /></td>
				</tr>
		  </table>
		  	  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
      	
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
		</form>
	</body>
</html>
