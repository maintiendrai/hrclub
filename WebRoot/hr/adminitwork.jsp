<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
		<%
	String path = request.getContextPath();
	%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
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
						<b>工作经历</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>

		<form  name="checkform" method="post" action="commenditwork.do">
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
				<tr>
					<td  colspan="2">
						请填写工作经历	 <a href="<%=path%>/hr/adminitpro.jsp">下一步添加项目</a>	</td>
				 
				</tr>
				<tr>
					<td width="130">
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
					<td>
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
						<textarea name="info" rows="10" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>
							<div align="left">
								<input type="hidden" name="operation" value="commenditwork" class="button" />
								<input type=button name="Submit" value="增加工作经历" onClick="jscheckform();" class="button" />
							</div>
						</label>
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>
