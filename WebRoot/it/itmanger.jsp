<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>
		
		<script  src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath()%>/js/encryption.js'> </script>
<script  src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>
		
		
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
	<title>人才管理界面</title>
</head>
<%
	Page mypage = (Page) request.getAttribute("mypage");
	List data = mypage.getData();
%>

<body>
	<form name="form1" method="post" action="itmanger.do">
		<div id="contentborder" align="center">
		<table align="left">
		<tr>
		<td>
			<table align="left">
			 <tr><td><br></td></tr>
			<tr>
				<td colspan="2" class="dvInnerHeader">
						<b>人才列表</b>
					</td>
					</tr>
					<tr><td><br></td></tr>
				<tr>
					<td>
						名称
					</td>
					<td>
						<input type="text" name="name">
					</td>
					<td>
						状态
					</td>
					<td>
						<select name="status">
						<option value="no" >请选择</option>
						<option value="0" >正常</option>
						<option value="1" >正常</option>
						</select>
					</td>
				
				
					<td>
						所在省份
					</td>
					<td>
						<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.form1.city , &#13;&#10;       window.document.form1.country.options[selectedIndex].value );">
							<option selected="selected" value="no"> 请选择</option>
							<script language="javascript">
        set_select_options( window.document.form1.country, country, "" ) ;
						</script>
						</select> 
					</td>
				
					<td>
						所在城市
					</td>
					<td>
						<select name="city"
							onChange="change_region( &#13;&#10;        window.document.form1.city , &#13;&#10;        window.document.form1.state.options[selectedIndex].value );">
						
						<option selected="selected" value="no"> 请选择</option>
						</select>	
					</td>
				<td>
				<input type=button name="button" value="查询"
											class="button" onclick="" />
				</td>
				</tr>
				 <tr><td><br></td></tr>
			</table>
		</td>
	</tr>
	<tr>
	<td>
			
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	         
				<tr>
					<td width="49">
						选择
					</td>
					<td width="143">
						IT人才账号
					</td>
					<td width="109">
						IT人才状态
					</td>
					<td width="109">
						是否核心人才
					</td>
					<td width="152">
						查看信息
					</td>
				</tr>
				<%
					Iterator it = data.iterator();

					while (it.hasNext()) {
						ITUserTO u = (ITUserTO) it.next();
				%>

				<tr>

					<td>
						<input type="checkbox" name="userid" value=<%=u.getUserid()%>>
					</td>
					<td>
						<%=u.getUserid()%>
					</td>
					<td>
						<%
								int status = u.getStatus();
								if (status == 0)
									out.println("正常");
								if (status == 1)
									out.println("已冻结");
						%>
					</td>
					<td>
						<%
								int core = u.getCore();
								if (core == 0)
									out.println("否");
								if (core == 1)
									out.println("是");
						%>
					</td>
					<td>
						<input type="hidden" name="useridh" value=<%=u.getUserid()%>　>
						<a
							href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getUserid()%>">查看信息</a>
					</td>
				</tr>
				<%
				}
				%>

				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<%
					if (mypage.getPageCount() == 0) {
					%>
					<td colspan=6 align="center">
						当前没有记录
					</td>
					<%
					} else {
					%>
					<td colspan=6 align="center">
						第
						<%=mypage.getPageNum()%>
						/
						<%=mypage.getPageCount()%>
						页 共
						<%=mypage.getRecordNum()%>
						条记录
						<%
					if (mypage.getPageNum() == 1) {
					%>
						首页&nbsp;&nbsp; 上页&nbsp;&nbsp;
						<%
						} else {
						%>
						<a
							href='showit.do?operation=showit&pageNum=1&pageLength=<%=mypage.getPageLength()%>'>首页</a>&nbsp;&nbsp;
						<a
							href='showit.do?operation=showit&pageNum=<%=mypage.getPageNum() - 1%>&pageLength=<%=mypage.getPageLength()%>'>上页</a>&nbsp;&nbsp;
						<%
						}
						%>

						<%
						if (mypage.getPageNum() == mypage.getPageCount()) {
						%>
						下页&nbsp;&nbsp; 末页&nbsp;&nbsp;
						<%
						} else {
						%>
						<a
							href='showit.do?operation=showit&pageNum=<%=mypage.getPageNum() + 1%>&pageLength=<%=mypage.getPageLength()%>'>下页</a>&nbsp;&nbsp;
						<a
							href='showit.do?operation=showit&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>末页</a>
						<%
							}
							}
						%>
					</td>
				</tr>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type=button value=" 冻结 " class="button"
							onClick="stopstate()" />
						<input type=button value=" 启用 " class="button"
							onClick="startstate()" />
						<input type=button value="核心开启" class="button"
							onClick="changecore()" />
						<input type=button value="核心关闭" class="button" onClick="offcore()" />
					</td>
				</tr>
			</table>
			</td>
			</tr>
	</form>
	<script>
function stopstate(){
	if(!isChecked(document.form1.userid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=stop";
	document.form1.submit();
}
function startstate(){
	if(!isChecked(document.form1.userid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=open";
	document.form1.submit();
}
function changecore(){
	if(!isChecked(document.form1.userid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=tocore";
	document.form1.submit();
}
function offcore(){
	if(!isChecked(document.form1.userid)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=offcore";
	document.form1.submit();
}

function find(){
	if(!isChecked(document.form1.name)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=offcore";
	document.form1.submit();
}
</script>
</body>


