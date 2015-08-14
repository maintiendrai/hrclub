<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	<%
	String path = request.getContextPath();
	%>
 <link rel="stylesheet" type="text/css" href="../adminindex/table.css">
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
	

	<div id="contentborder" align="center">
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan=6 class="newline"></td>
				</tr>
				<tr>
					<td colspan="2" class="dvInnerHeader">
						<b>项目经验</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>

		<form name="checkform" method="post" action="addproject.do">
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
					<td  colspan="2">
						请填写项目经验	    <a href="<%=path%>/hr/adminitskill.jsp">下一步添加IT技能</a>	</td>
				 
				</tr>
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
						<textarea name="projectinfo" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="operation" value="commenditpro"  class="button"/>

						<input type=button name="Submit" value="提交"  onClick="jscheckform();" class="button">
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
