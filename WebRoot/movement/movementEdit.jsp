<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<script>
function validator(){
   
   if(document.myform.subject.value==""){
    alert("����ⲻ��Ϊ�գ�");
    document.myform.subject.focus();
    return false;
   }
   
   if(document.myform.starttime.value==""){
    alert("��Чʱ�䲻��Ϊ�գ�");
    document.myform.starttime.focus();
    return false;
   }
   
   if(document.myform.endtime.value==""){
    alert("ʧЧʱ�䲻��Ϊ�գ�");
    document.myform.endtime.focus();
    return false;
   }
   
   if(document.myform.context.value==""){
    alert("����ݲ���Ϊ�գ�");
    document.myform.context.focus();
    return false;
   }
   
}
</script>
<title>�����</title>
</head>

<body>
<%MovementTO to = (MovementTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=movementedit" onsubmit="return validator(this)">
<input type="hidden" name="moveID"  value="<%=to.getMoveID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸Ļ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">�����</td>
      <td><input type="text" name="subject" value="<%=to.getSubject()%>" style="width:230px"/></td>
    </tr>
    <tr>
      <td>��������</td>
      <td><select name="integral">
          <option value="5" <% if(to.getIntegral()==5) out.print("selected");%>>5</option>
    	  <option value="10" <% if(to.getIntegral()==10) out.print("selected");%>>10</option>
    	  <option value="15" <% if(to.getIntegral()==15) out.print("selected");%>>15</option>
    	  <option value="20" <% if(to.getIntegral()==20) out.print("selected");%>>20</option>
    	  <option value="25" <% if(to.getIntegral()==25) out.print("selected");%>>25</option>
    	  <option value="30" <% if(to.getIntegral()==30) out.print("selected");%>>30</option>
  	  </select></td>   
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><input type="hidden" name="puttime" value="<%=to.getPuttime()%>"/>
          <%=to.getPuttime()%>
      </td>
    </tr>
    <tr>
      <td>��Чʱ��</td>
      <td><input id="starttime" name="starttime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MAXDATE="$endtime" value="<%=to.getStarttime()%>"/></td>
    </tr>
     <tr>
      <td>ʧЧʱ��</td>
      <td><input id="endtime" name="endtime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MINDATE="$starttime" value="<%=to.getEndtime()%>"/></td>
    </tr>
    <tr>
      <td>�״̬</td>
      <td><select name="status">
    	  <option value="0" <% if(to.getStatus()==0) out.print("selected");%>>������</option>
    	  <option value="1" <% if(to.getStatus()==1) out.print("selected");%>>��ֹͣ</option>
    	  <option value="2" <% if(to.getStatus()==2) out.print("selected");%>>��ɾ��</option>	
  	  </select></td>
    </tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">�����</td>
      <td><textarea name="context" rows="7" cols="50"><%=to.getContext()%></textarea></td>
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