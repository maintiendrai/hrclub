<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/ParamUtil.js"></script>
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
<%ServerorderTO to = (ServerorderTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=serverorderedit&method=edit" onsubmit="return validator(this)">
<input type="hidden" name="oderID"  value="<%=to.getOderID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸Ķ���</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">��������</td>
      <td><input type="text" name="ordertitle" value="<%=to.getOrdertitle()%>" style="width:230px"/></td>
    </tr>
    <tr>
      <td width="80">�������ʺ�</td>
      <td><input type="hidden" name="hrID" value="<%=to.getHrID()%>" /><%=to.getHrID()%></td>
    </tr>
    <tr>
      <td>��������</td>
      <td>
          <select name="kind">
    			<option value="0" <% if(to.getKind()==0) out.print("selected");%>>����</option>
    			<option value="1" <% if(to.getKind()==1) out.print("selected");%>>��ҵ����</option>
    			<option value="2" <% if(to.getKind()==2) out.print("selected");%>>��ѵ����</option>
    			<option value="3" <% if(to.getKind()==3) out.print("selected");%>>������</option>
    			<option value="4" <% if(to.getKind()==4) out.print("selected");%>>������ǲ</option>
    			<option value="5" <% if(to.getKind()==5) out.print("selected");%>>��ͷ</option>
  		   </select>
      </td>   
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><input type="hidden" name="buytime" value="<%=to.getBuytime()%>"/>
          <%=to.getBuytime()%>
      </td>
    </tr>
     <tr>
      <td>����״̬</td>
      <td>   
          <select name="status">
    			<option value="0" <% if(to.getStatus()==0) out.print("selected");%>>δ����</option>
    			<option value="1" <% if(to.getStatus()==1) out.print("selected");%>>�Ѵ���</option>
    			<option value="2" <% if(to.getStatus()==2) out.print("selected");%>>��ɾ��</option>
    			<option value="3" <% if(to.getStatus()==3) out.print("selected");%>>������</option>
  	      </select>
  	  </td>
    </tr>
    <tr>
      <td>�������</td>
      <td><textarea name="oderinfo" rows="7" cols="50"><%=to.getOderinfo()%></textarea></td>
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
</form>
</body>
</html>