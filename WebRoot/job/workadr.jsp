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


		<title>ʡ������</title>

		

	</head>
	<SCRIPT LANGUAGE="JavaScript">   
  <!--   
  //checkboxԪ�ص�����ǰ׺������Ϊsample1,sample2,sample3...   
  var   sCtrlPrefix   =   "sample";   
  //checkboxԪ��������������18����   
  var   iMaxCheckbox   =   380;   
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
					<% HashMap province = helper.getProvince();
					   HashMap city = helper.getCity();
						String addrname = "";
						String addrkey = "";
						int i = 1;
						Iterator iterator = province.keySet().iterator();
						
						while (iterator.hasNext()) {
							addrkey = iterator.next().toString();
							addrname = province.get(addrkey).toString();
       
					%>
					
					<tr>
					<td>
						<%=addrname%>
						
					</td>
					</tr>
					<table>
					<tr>
					<%
							
							HashMap citys = (HashMap) city.get(addrkey);
							Iterator ci = citys.keySet().iterator();
							while (ci.hasNext()) {
						 Object key=ci.next(); 
		      
		                 if(i%3==0) out.print("<tr>");
					%>
					
					
					<td>
						<input type="CHECKBOX" name=<%="sample" + String.valueOf(i)%>
							value=<%=key%> onClick="doCheck(this)">
						</td><td><%=citys.get(key)%>
					</td>
					<%
							i++;
							}
                      
                      %>
                      </table>
                      
                       <%
						
						}
					%>
				
			</table>
		</form>
	</body>
</html>
