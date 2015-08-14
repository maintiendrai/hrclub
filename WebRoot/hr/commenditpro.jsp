<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
<%String path = request.getContextPath(); %>
		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
	

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
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<% Object hr=session.getAttribute("hrID"); %>
	<%if(null!=hr){ %>

	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">	<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   
			<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">项目经验</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			   
   <%} %>
		<form name="checkform" method="post" action="addproject.do">
			<table>
			<tr>
					<td  colspan="2">
						请填写项目经验	  <a href="<%=path%>/hr/commenditskill.jsp" target="top">下一步添加IT技能</a>	</td>
				 
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
					<td valign="top">
						项目简介
					</td>
					<td>
						<textarea name="projectinfo" rows="10" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="operation" value="commenditpro" />

						<input type=button name="Submit" value=" 提 交 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"  onClick="jscheckform();">
					</td>
				</tr>
				
			</table>
			<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
		</form>
		</td>
		</tr>
		</table>
		</td>
		</tr>
		</table>
		 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
