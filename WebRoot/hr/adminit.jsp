
<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>


<html>
	<head>


		<title>IT�˲��Ƽ�</title>
	<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath() %>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath() %>/js/country/change_region.js"></script>
<script  src='<%=request.getContextPath() %>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath() %>/js/encryption.js'> </script>
<script  src='<%=request.getContextPath() %>/js/basicinfo.js'> </script>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
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
<body>
<%
String adminID = (String)session.getAttribute("adminuserid");
if(null==adminID) {

	response.sendRedirect("../adminindex/login.jsp");

}	
%>
	<div id="contentborder" align="center">
           <table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
           <tr><td><br></td></tr>
           <tr> 
               <td colspan=6 class="newline"></td>
	       </tr>
	       <tr> 
               <td colspan="2"  class="dvInnerHeader"><b>�Ƽ�IT�˲�</b></td>
               <td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
           </tr>
           </table>
		   
		   <form  name="checkform" method="post" action="itregedit.do"> 
		   <table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
				<tr>
					<td  colspan="2">
						����дIT�˲Ż�����Ϣ	��һ����дרҵ��Ϣ		</td>
				 
				</tr>
				<tr><td><br></td></tr>
				<tr>
					<td>
						�˺�					</td>
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
						�Ա�					</td>
					<td>
						
                            <input type="radio" name="sex" value="male" checked="checked" />							
                            ��					
							<input type="radio" name="sex" value="woman" />
							Ů			</td>
				</tr>
				<tr>
					<td>
						����					</td>
					<td>
						<input type="text" name="age" size="3" /> <span class="STYLE4">*</span>						</td>
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
						�ʼ�					</td>
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
						�ʱ�
					</td>
					<td>
						<input type="text" name="post" value="">
					</td>
				</tr>
				<tr>
					<td>
						�̶��绰
					</td>
					<td>
						<input type="text" name="telephone"
							value="">
					</td>
				</tr>
				<tr>
					<td>
						�ƶ��绰
					</td>
					<td>
						<input type="text" name="mobiletphone"
							value="">
					</td>
				</tr>
		  </table>
		  <table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
		        <tr><td><br></td></tr>
				<tr>
                    <td>
                        <input type="hidden" name="operation" value="commendit">			
					    <input type="button" name="Submit" value=" ע�� " onClick="jscheckform();"  class="button"/>
					    <input type="reset" name="Submit2" value=" ���� "  class="button"/>
					</td>
				</tr>
		  </table>
		  </form>
	</div>
</body>
</html>
