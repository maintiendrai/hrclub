<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script src='<%=path%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>


		<title>ְλ��������</title>

		<%
		HashMap listitskill = helper.getSpecialitycomf();
		%>

	</head>
	<SCRIPT LANGUAGE="JavaScript">   
  <!--   
  //checkboxԪ�ص�����ǰ׺������Ϊsample1,sample2,sample3...   
  var   sCtrlPrefix   =   "sample";   
  //checkboxԪ��������������18����   
  var   iMaxCheckbox   =   30;   
  //�����������ѡ���������   
  var   iMaxSelected   =   5;     
    var addr=""; 
  function   doCheck(ctrl)   { 
    
  var   iNumChecked   =   0;   
  var   thisCtrl;   
  var   i; 
 
 
  //��ʼ��   
  i   =   1;   
  //ѭ��ֱ��ѡ��������checkbox;   
  while   ((i   <=   iMaxCheckbox)   &&   (iNumChecked   <=   iMaxSelected))   {   
    
  thisCtrl   =   eval("ctrl.form."   +   sCtrlPrefix   +   i);   
    
  if   ((thisCtrl   !=   ctrl)   &&   (thisCtrl.checked))   {   
    
  iNumChecked++;   
  }   
    
  i++;   
  }   
    
  //   ����Ƿ�ﵽ�����ѡ��������   
  if   (iNumChecked   ==   iMaxSelected)   {  
  
  alert("���ѡ������"); 
  //   �������uncheck��ѡ���Ԫ�أ�   
  ctrl.checked   =   false;   
  }   
  }   
  //   -->   
  
  
  function address(){
  var i=0
   for(i=1;i<=iMaxCheckbox;i++)
   { 
     thisCtrl   =   eval("form."   +   sCtrlPrefix   +   i);   
     if(thisCtrl.checked){
      addr=thisCtrl.value+","+addr;  
     }
    }

    parent.window.returnValue=addr;
	window.close();
	
 }
  

  </SCRIPT>

	<body>


		<form name="form" method="post">
			<table>
			<tr>
					<td>
						<input type=button onclick="address()" value="ȷ��">
					</td>
				</tr>
			<tr>
				<%
				for (int i = 0; i < listitskill.size(); i++) {
				if((i+1)%3==0) out.print("<tr>");
				 %>
					<td>
						<input type="CHECKBOX" name=<%="sample"+String.valueOf(i+1) %> value=<%=i+1%> onClick="doCheck(this)">
						<%=listitskill.get(i+1)%>
					</td>
					<%
					}
					%>
				</tr>
			</table>
		</form>
	</body>
</html>
