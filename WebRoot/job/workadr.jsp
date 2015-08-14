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


		<title>省份类型</title>

		

	</head>
	<SCRIPT LANGUAGE="JavaScript">   
  <!--   
  //checkbox元素的名字前缀，本例为sample1,sample2,sample3...   
  var   sCtrlPrefix   =   "sample";   
  //checkbox元素数量，本例有18个；   
  var   iMaxCheckbox   =   380;   
  //设置最大允许选择的数量；   
  var   iMaxSelected   =   5;     
    var addr=""; 
  function   doCheck(ctrl)   { 
    
  var   iNumChecked   =   0;   
  var   thisCtrl;   
  var   i; 
 
 
  //初始化   
  i   =   1;   
  //循环直到选中了最多的checkbox;   
  while   ((i   <=   iMaxCheckbox)   &&   (iNumChecked   <=   iMaxSelected))   {   
    
  thisCtrl   =   eval("ctrl.form."   +   sCtrlPrefix   +   i);   
    
  if   ((thisCtrl   !=   ctrl)   &&   (thisCtrl.checked))   {   
    
  iNumChecked++;   
  }   
    
  i++;   
  }   
    
  //   检查是否达到了最大选择数量；   
  if   (iNumChecked   ==   iMaxSelected)   {  
  
  alert("最多选择五项"); 
  //   如果是则uncheck刚选择的元素；   
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
						<input type=button onclick="address()" value="确定">
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
