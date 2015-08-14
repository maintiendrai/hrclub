<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
		<%
String url = request.getContextPath();
%>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
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
  if(document.checkform.place.value=="no"){
    alert("请选择职位！");
    document.checkform.place.focus();
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

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
   </td><td width="558" valign="top">
		<form name="checkform" method="post" action="addproject.do">
			<table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">添加项目经验</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
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
						out.println(tb.getSelect("place", list, "请选择","no"));
						%>
					</td>
				</tr>
				<tr>
					<td>
						项目简介
					</td>
					<td>
						<textarea name="projectinfo" cols="50" rows="10"></textarea>
					</td>
				</tr>
				<tr><td></td>
					<td  >
						<input type="hidden" name="operation" value="addproject" />

						<input type=button name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="提交项目信息"  onClick="jscheckform();">
					</td>
				</tr>
			</table>
			
				  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
		</form>
		</td>
		</tr>
		</table>
			 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
