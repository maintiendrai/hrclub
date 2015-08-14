<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

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
	

		<title>添加项目经验</title>

<script> 
function jscheckform(){

  if(document.checkform.projectname.value==""){
    alert("请输入项目名称！");
    document.checkform.projectname.focus();
    return false;
  }
  if(document.checkform.starttime.value==""){
    alert("请选择项目开始时间！");
    document.checkform.starttime.focus();
    return false;
  }
  if(document.checkform.endtime.value==""){
    alert("请选择项目结束时间！");
    document.checkform.endtime.focus();
    return false;
  }
  
   if(document.checkform.hardware.value==""){
    alert("请输入硬件环境！");
    document.checkform.hardware.focus();
    return false;
  }
  if(document.checkform.software.value==""){
    alert("请输入软件环境！");
    document.checkform.software.focus();
    return false;
  }

   if(!isNum(document.checkform.projectsize.value)){
    alert("请输入数字");
    document.checkform.age.focus();
    return false;
  } 
  if(confirm('您确定要提交项目信息')){
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
		<form name="checkform" method="post" action="addproject.do">
			<table align="center" width="600">
				<tr>
					<td>
						项目名称
					</td>
					<td >
						<input type="text" name="projectname" />
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
						完成时间
					</td>
					<td>
						<input id="htEnd" name="endtime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1" />
					
					</td>
				</tr>
				<tr>
					<td >
						硬件环境
					</td>
					<td >
						<input type="text" name="hardware" />
					</td>
				</tr>
				<tr>
					<td >
						软件环境
					</td>
					<td >
						<input type="text" name="software" />
					</td>
				</tr>
				<tr>
					<td >
						项目规模
					</td>
					<td >
						<input type="text" name="projectsize" /> 人/月
					</td>
				</tr>
				<tr>
					<td >
						担任职位
					</td>
					<td >
						<%
						out.println(tb.getSelect("place", list, null));
						%>
					</td>
				</tr>
				<tr>
					<td>
						项目简介
					</td>
					<td>
						<textarea name="projectinfo"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="operation" value="addproject" />

						<input type=button name="Submit" value="提交"  onClick="jscheckform();">
					</td>
				</tr>
			</table>
		</form>
		</td>
		</tr>
		</table>
	</body>
</html>
