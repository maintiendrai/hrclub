<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<script src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.ordertitle.value==""){
    alert("�������Ʋ���Ϊ�գ�");
    document.myform.ordertitle.focus();
    return false;
   }
   
   if(document.myform.hrID.value==""){
    alert("�������ʺŲ���Ϊ�գ�");
    document.myform.hrID.focus();
    return false;
   }
   
   if(document.myform.oderinfo.value==""){
    alert("������鲻��Ϊ�գ�");
    document.myform.oderinfo.focus();
    return false;
   }
   
}
</script>
<title>���񶩵�����</title>
</head>

<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<table align="center" width="700">
   <tr>
   <td width="100">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��д����</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
<%
    String buytime =(String) request.getAttribute("buytime");
    
    Object id = session.getAttribute("hrID");
    String hrID=null;
                                   
	if (null !=id) {
		hrID=session.getAttribute("hrID").toString();
	}

%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=serverorderadd&method=add" onsubmit="return validator(this)">
<input type="hidden" name="operation"  value="serverorderadd"/>
<div id="contentborder" align="center">
 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">��������</td>
      <td><input type="text" name="ordertitle" style="width:230px"/></td>
    </tr>
    <tr>
      <td width="80">�������ʺ�</td>
      <td><input type="hidden" name="hrID" value="<%=hrID%>"/><%=hrID%></td>
    </tr>
    <tr>
      <td>��������</td>
      <td>
          <select name="kind">
    			<option value="0">����</option>
    			<option value="1">��ҵ����</option>
    			<option value="2">��ѵ����</option>
    			<option value="3">������</option>
    			<option value="4">������ǲ</option>
    			<option value="5">��ͷ</option>
  		   </select>
      </td>   
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><input type="hidden" name="buytime" value="<%=buytime%>"/>
          <%=buytime%>
      </td>
    </tr>
     <tr>
      <td>����״̬</td>
      <td><input type="hidden" name="status" value="0"/>   
          <%out.print("δ����");%>
         
  	  </td>
    </tr>
    <tr>
      <td>�������</td>
      <td><textarea name="oderinfo" rows="7" cols="50" value="" /></textarea></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" ���� " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
        <input type="reset" name="reset" value=" ȡ�� " onclick="history.back();" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
      </td>
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

 	 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>

</html>
