<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script src="../js/datepicker/WdatePicker.js"></script>
<script type="text/javascript"  src="../js/fckeditor.js"></script>
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
<%String puttime =(String) request.getAttribute("puttime");%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=messageadd&method=add" onsubmit="return validator(this)">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>������Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td width="130">��Ϣ����</td>
      <td><input type="text" name="subject" value="" style="width:230px"/></td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
      <td>   
          <select name="kind">
    			<option value="0">����</option>  			
    			<option value="1">����</option>
    			<option value="2">HR����</option>
    			<option value="3">IT�˲Ź���</option>
  	      </select>
  	  </td>
    </tr>
    <tr>
      <td>����ʱ��</td>
      <td><input type="hidden" name="puttime" value="<%=puttime%>"/>
          <%=puttime%>
      </td>
    </tr>
    <tr>
      <td>��Чʱ��</td>
      <td><input id="starttime" name="starttime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MAXDATE="$endtime" /></td>
    </tr>
     <tr>
      <td>ʧЧʱ��</td>
      <td><input id="endtime" name="endtime" type="text" class="Wdate"
			onfocus="new WdatePicker(this)" MINDATE="$starttime"/></td>
    </tr>
    <tr>
      <td>��Ϣ����</td>
      <td><textarea id="context" name="context" rows=20 cols=60></textarea>
												<script type="text/javascript">
	 var oFCKeditor = new FCKeditor('context') ;
	 oFCKeditor.BasePath = "/hrclub/" ;
	 oFCKeditor.Width = 550;
	 oFCKeditor.Height = 250;
	 oFCKeditor.ToolbarSet = "qunyingnet" ; 
	 oFCKeditor.ReplaceTextarea();
	</script></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" ���� " class="button"/>
        <input type="reset" name="reset" value=" ȡ�� "class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</form>
</body>
</html>
