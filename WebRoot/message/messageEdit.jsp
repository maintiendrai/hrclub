<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<script src="../js/ParamUtil.js"></script>
<script>
function validator(){
   
   if(document.myform.subject.value==""){
    alert("���ⲻ��Ϊ�գ�");
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
    alert("���������ݣ�");
    document.myform.context.focus();
    return false;
   }
}
</script>
<title>��Ϣ����</title>
</head>

<body>
<%MessageTO to = (MessageTO)request.getAttribute("to");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=messageedit" onsubmit="return validator(this)">
<input type="hidden" name="messageID"  value="<%=to.getMessageID()%>"/>
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>�޸���Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="80">��Ϣ����</td>
      <td width="131"><input type="text" name="subject" value="<%=to.getSubject()%>" style="width:230px"/></td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
      <td>   
          <select name="kind">
    			<option value="0" <%if(to.getKind()==0) out.print("selected");%>>����</option>  			
    			<option value="1" <%if(to.getKind()==1) out.print("selected");%>>����</option>
    			<option value="2" <%if(to.getKind()==2) out.print("selected");%>>HR����</option>
    			<option value="3" <%if(to.getKind()==3) out.print("selected");%>>IT�˲Ź���</option>
  	      </select>
  	  </td>
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
			onfocus="new WdatePicker(this)" MAXDATE="$endtime" value="<%=to.getStarttime()%>"/>
      </td>
    </tr>
     <tr>
      <td>ʧЧʱ��</td>
      <td><input id="endtime" name="endtime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MINDATE="$starttime" value="<%=to.getEndtime()%>"/>
      </td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
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
