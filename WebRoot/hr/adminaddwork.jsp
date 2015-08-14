<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	
		<title>添加工作经历</title>
<script> 
function jscheckform(){


 
  if(document.checkform.address.value==""){
    alert("请输入工作地点！");
    document.checkform.address.focus();
    return false;
  }
  
  if(document.checkform.compname.value==""){
    alert("请输入所在公司名称！");
    document.checkform.compname.focus();
    return false;
  }
  if(document.checkform.starttime.value==""){
    alert("请开始时间！");
    document.checkform.starttime.focus();
    return false;
  }
  if(document.checkform.levertime.value==""){
    alert("请离开时间！");
    document.checkform.levertime.focus();
    return false;
  }
  
  
  if(confirm('您确定要工作经历信息')){
 	
 	 document.checkform.submit();
  }
}

 </script>

	</head>

	<%
	HashMap list = helper.getJobcomf();
	%>
	<body>
		<jsp:include page="../fromtop.jsp" flush="true" />
  <table align="center" width="700">
   <tr>
   <td width="100" valign="top"><jsp:include page="../itforntop.jsp" flush="true" />
   </td><td width="600">
		<form  name="checkform" method="post" action="addwork.do">
			<table width="600" align="center">
				<tr>
					<td >
						工作地点
					</td>
					<td >
						<input type="text" name="address" />
					</td>
				</tr>
				<tr>
					<td >
						所在公司名称
					</td>
					<td >
						<input type="text" name="compname" />
					</td>
				</tr>
				<tr>
					<td>
						所在公司性质
					</td>
					<td>
						<select name="comkind">
							<option selected="selected" value="1">
								国有企业
							</option>
							<option value="2">
								私营企业
							</option>
							<option value="3">
								外资独资企业
							</option>
							<option value="4">
								中外合资企业
							</option>
							<option value="0">
								其他
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						担任职位
					</td>
					<td>
						<%
						out.println(tb.getSelect("place", list, null));
						%>

					</td>
				</tr>
				<tr>
					<td>
						开始时间
					</td>
					<td>
						<input id="htStart" name="starttime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MAXDATE="$htEnd" />
					</td>
				</tr>
				<tr>
					<td>
						离职时间
					</td>
					<td>
						<input id="htEnd" name="levertime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1" />
					</td>
				</tr>
				<tr>
					<td>
						工作简介
					</td>
					<td>
						<textarea name="info" cols="50" rows="3">></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>
							<div align="center">
								<input type="hidden" name="operation" value="addwork" />
								<input type=button name="Submit" value="增加工作经历" onClick="jscheckform();" />
							</div>
						</label>
					</td>
				</tr>
			</table>
		</form>
		</td>
		</tr>
		</table>
	</body>
</html>
