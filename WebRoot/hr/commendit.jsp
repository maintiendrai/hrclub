
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>


<html>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	


		<title>IT�˲��Ƽ�</title>
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
    alert("������Ϸ��˺�");
    document.checkform.userid.focus();
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
  
  
  if(confirm('��ȷ��Ҫ�Ƽ�ô��')){
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
            <td height="36" valign="top" class="titile">�Ƽ�IT�˲�</td>
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
						����дIT�˲Ż�����Ϣ	��һ����дרҵ��Ϣ		</td>
				 
				</tr>
				<tr>
					<td width="110">
						��&nbsp;&nbsp;&nbsp;&nbsp;��					</td>
					<td>
				  <input type="text" name="userid" />
				  <span class="STYLE4">*</span>				  <span class="STYLE2">������4��18λ��Сд��ĸ�����ֻ��»������				  </span></td>
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
						<input type="text" name="address" value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						��&nbsp;&nbsp;&nbsp;&nbsp;��
					</td>
					<td>
						<input type="text" name="post" value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						�̶��绰
					</td>
					<td>
						<input type="text" name="telephone"
							value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					<td>
						�ƶ��绰
					</td>
					<td>
						<input type="text" name="mobiletphone"
							value=""> <span class="STYLE4">*</span>	
					</td>
				</tr>
				<tr>
					
					<td colspan="2"><input type="hidden" name="operation" value="commendit">			
					<input type="button" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit" value=" �� �� " onClick="jscheckform();"/>
					    <input type="reset" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit2" value=" �� �� " /></td>
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
