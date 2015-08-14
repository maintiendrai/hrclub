<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
String url = request.getContextPath();
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/index.css"
			rel="stylesheet" type="text/css" /> 

		<link href="<%=request.getContextPath()%>/css/css.css"
			rel="stylesheet" type="text/css" />
		<base href="<%=basePath%>">
		<script src='<%=path%>/js/country/change_region.js'> </script>
		<title>职位搜索界面</title>


		<script type="text/javascript">
 


function doKeyDown(sim)
{
  if(event.keyCode==13)
    {
    if(sim=="1")
      simfindjob(form1);
 }
}


</script>


		<script type="text/javascript">
 <!--

function Mv(a,b) {
var i = 0;
var f=document.getElementById(a);
var t=document.getElementById(b);
for(var i=0; i<f.options.length; i++) {
if(f.options[i].selected &&chosejob(b)&&f.options[i].value!="no") {
var no = new Option();
no.value = f.options[i].value;
no.text = f.options[i].text;
no.selected="selected";
t.options[t.options.length] = no;

Rv(a);}
}

}

function Mvout(a,b) {
var i = 0;
var f=document.getElementById(a);
var t=document.getElementById(b);
for(var i=0; i<f.options.length; i++) {
if(f.options[i].selected ) {
var no = new Option();
no.value = f.options[i].value;
no.text = f.options[i].text;
no.selected="selected";

t.options[t.options.length] = no;}
}

Rv(a);
}
function Rv(o) {
var o=document.getElementById(o);
for(var i=o.options.length-1; i>=0; i--) {
if(o.options[i].selected && o.options[i] != "") {
 o.options[i].value = "";
 o.options[i].text = "";
 o.options[i] = null;
 }
}
}
function chosejob(a){
var i = 0;
var f=document.getElementById(a);
if(f.options.length>2)
{alert("最多选择三个");
 return false;
 }
 else return true;
}

var jobs='';
var jobvalue=''
function choseend(a,b){
 jobs=" ";
 jobvalue="";
var i = 0;
var f=document.getElementById(a);
for(var i=0; i<f.options.length; i++)
{ 
    jobs=f.options[i].text+","+jobs;
    jobvalue=f.options[i].value+','+jobvalue;
 }
 document.form1.byjob.value=jobs;
 document.form1.byjobh.value=jobvalue;
 
 hidedivSimple(b)
}

var call="";
var callvalue="";

function chosecall(a,b){
 call="";
 callvalue="";
var i = 0;
var f=document.getElementById(a);
for(var i=0; i<f.options.length; i++)
{ 
    call=f.options[i].text+","+call;
    callvalue=f.options[i].value+','+callvalue;
 }
 document.form1.bycalling.value=call;
 document.form1.bycallingh.value=callvalue;
 
 hidedivSimple(b)
}

var address="";
var addressvalue="";

function choseaddrss(a,b){
 address="";
 addressvalue="";
var i = 0;
var f=document.getElementById(a);
for(var i=0; i<f.options.length; i++)
{ 
    address=f.options[i].text+","+address;
    addressvalue=f.options[i].value+","+addressvalue;
 }
 document.form1.byaddress.value=address;
 document.form1.byaddressh.value=addressvalue;
 
 hidedivSimple(b)
}
-->
</script>
		<script>


function simfindjob(form1){
   if(choose()){
	document.form1.operation.value="highfind";	
	document.form1.submit();
	}
}

function choose(){
if(document.form1.byjobh.value=="no"&&document.form1.byaddressh.value=="no"&&document.form1.keyname.value=="")
  {alert("请选择查询条件");
  return false;}
  else
  return true;
}


function showdiv(a){ 

  if(document.form1.isshow.value=="0"){
	 document.getElementById(a).style.display="";  
  document.getElementById(a).style.left=500;
  
	  
	  document.getElementById(a).style.width=560;
	  document.getElementById(a).style.height=250;
	  document.form1.isshow.value='1';
  }else{
 	 hidedivSimple();
 	 document.form1.isshow.value='0';
  }
}


function hidedivSimple(b){
  document.getElementById(b).style.display="none";
  document.form1.isshow.value='0';
   
}


</script>
		<style type="text/css">
<!--
.STYLE1 {
	font-size: 18px;
	font-weight: bold;
}
-->
        </style>
	</head>
	<%
		Object useid = session.getAttribute("userid");
		Object hrID = session.getAttribute("hrID");
	%>

	<%
	HashMap listjob = helper.getJobcomf();
	%>

	<body onkeydown="doKeyDown('1')">
		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/top.js"></script>
		</div>
		<form id="form1" name="form1" method="post" action="find.do">
			<input type="hidden" name="operation">
			<table width="776" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td>
						<table width="218" border="0" align="left" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
									<input type="hidden" name="pageNum" value="1">
									<%
									if (null != useid) {
									%>
									<iframe height="550" frameborder="0" scrolling="no"
										src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

									<%
									} else if (null != hrID) {
									%>
									<iframe height="550" frameborder="0" scrolling="no"
										src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
									<%
									}
									%>
								
							</tr>

						</table>
						<table width="558" border="0" align="right" cellpadding="0"
							cellspacing="0">
							<tr>
								<td>
									<table width="558" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td height="60" align="left" valign="top"
												background="<%=url%>/images/main_1.gif">
												<img src="<%=url%>/images/ba-zpxx.jpg" width="181"
													height="49">
											</td>
										</tr>
										<tr>
											<td background="<%=url%>/images/main_2.gif">
												<table width="500" border="0" align="center" cellpadding="4"
													cellspacing="0">
													<tr>
														<td width="25%">
															关 键 字:
														</td>
														<td>
 															<input type="text"  class="inputtype" style="width:240px;height:23px;"
																name="keyname" value="" />
														</td>
														<td></td>
													</tr>
													<tr>
														<td colspan="2" class="px12blue">
															<strong><img src="<%=url%>/images/icon-01.jpg" width="20" height="18" align="absmiddle"> 更多精确搜索条件：</strong>
														</td>
													</tr>
													<tr>
														<td>
															<div id='jobdiv'
																style='position:absolute;width:350;height:200;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
																<table width=100% align=left border=0 cellSpacing=0
																	cellPadding=0>
																	<tr>
																		<td>
																			选择职位类型
																		</td>
																	</tr>
																	<tr>
																		<td colspan＝2 align=left>

																			<table>
																				<tr>
																					<td>
																						<strong class="norTit">职位类型</strong>
																						<br />
																						<select id="SltAddrA" class="SltBar" name="alljob"
																							size="12" multiple="true">
																							<%
																								Iterator itjob = listjob.keySet().iterator();
																								while (itjob.hasNext()) {
																									Object key = itjob.next();
																							%>
																							<option value=<%=key.toString()%>>
																								<%=listjob.get(key).toString()%>
																							</option>
																							<%
																							}
																							%>
																						</select>
																					</td>
																					<td>
																						<input type="button" class="BtnA2w" name=""
																							value="添加" onClick="Mv('SltAddrA','SltAddrB');" />
																						<br />
																						<br />
																						<input type="button" class="BtnB2w" name=""
																							value="移除"
																							onClick="Mvout('SltAddrB','SltAddrA');" />
																						<br />
																						<br />
																						<input type=button value='确定' name="industry"
																							onclick="choseend('SltAddrB','jobdiv');">

																						<br />
																						<br />
																						<input type=button value='关闭' name="industry"
																							onclick="hidedivSimple('jobdiv');">
																					</td>

																					<td class="slt">
																						<strong class="norTit">选择职位</strong>
																						<br />
																						<select id="SltAddrB" class="SltBar"
																							name="choosejob" size="12" style="width:200 "
																							multiple="true">

																						</select>
																					</td>

																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</div>
															职位类型:
														</td>
														<td width="168">
															<input type="hidden" name="pageNum" value="1" />
															<input type="hidden" name="byjobh" value="no" />
															<input type="text"  class="inputtype" style="width:240px;"
																name="byjob" value="选择职位类型"
																onClick="javascript:showdiv('jobdiv')"
																readonly="readonly" />
															<input type=hidden name="isshow" value="0">
														</td>
														<td width="8"></td>
													</tr>
													<tr>
														<td>
															<div id='address'
																style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
																<table id=MovOpTB align="center" border=0 cellSpacing=0
																	cellPadding=0 width="400">
																	<tr>
																		<td>
																			<strong class="norTit">请选择地点</strong>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			省份
																			<select name="province" id="country"
																				onChange="change_region( &#13;&#10;       window.document.form1.city , &#13;&#10;       window.document.form1.country.options[selectedIndex].value );">
																				<option value="no" selected="selected">
																					请选择
																				</option>
																				<script language="javascript">
        set_select_options( window.document.form1.country, country, "" ) ;
						</script>
																			</select>
																		</td>
																		<td>
																		</td>
																	</tr>
																	<tr>

																		<td width="100">
																		</td>
																		<td width="50">
																		</td>
																		<td width="100">
																			选择城市
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<select id="city" name="city" size="12"
																				multiple="true" style="width: 100;">
																				<option value="no">
																					选择城市
																				</option>
																			</select>
																		</td>
																		<td>
																			<input type="button" value="添加"
																				onClick="Mv('city','cityB');" />
																			<br />
																			<br />
																			<input type="button" value="删除"
																				onclick="Mvout('cityB','city');" />
																			<br />
																			<br />
																			<input type=button value='确定' name="industry"
																				onclick="choseaddrss('cityB','address');">

																			<br />
																			<br />
																			<input type=button value='关闭' name="industry"
																				onclick="hidedivSimple('address');">
																		</td>
																		<td>
																			<select id="cityB" name="" size="12" multiple="true"
																				style="width: 100;">
																			</select>
																		</td>
																	</tr>

																</table>
															</div>
															工作地点:
														</td>
														<td>
															<input type="hidden" name="byaddressh" value="no" />
															<input type="text" style="width:240px;" style="width:240px;"
																name="byaddress" value="选择工作地点"
																onClick="javascript:showdiv('address')"
																readonly="readonly" />
														</td>
														<td></td>
													</tr>
													<tr>
														<td>
															行业类型:
														</td>
														<td>
															<div id='calldiv'
																style='position:absolute;width:400;height:200;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
																<table width=100% align=left border=0 cellSpacing=0
																	cellPadding=0>
																	<tr>
																		<td>
																			选择行业类型:
																		</td>
																	</tr>
																	<tr>
																		<td colspan＝2 align=left>

																			<table>
																				<tr>
																					<td>
																						<strong class="norTit">行业类型</strong>
																						<br />
																						<select id="calla" class="SltBar" name="alljob"
																							size="12" multiple="true">
																							<%
																								HashMap listc = helper.getCallingcomf();

																								Iterator itc = listc.keySet().iterator();
																								while (itc.hasNext()) {
																									Object key = itc.next();
																							%>
																							<option value=<%=key.toString()%>>
																								<%=listc.get(key).toString()%>
																							</option>

																							<%
																							}
																							%>
																						</select>
																					</td>
																					<td>
																						<input type="button" class="BtnA2w" name=""
																							value="添加" onClick="Mv('calla','callb');" />
																						<br />
																						<br />
																						<input type="button" class="BtnB2w" name=""
																							value="移除" onClick="Mvout('callb','calla');" />
																						<br />
																						<br />
																						<input type=button value='确定' name="industry"
																							onclick="chosecall('callb','calldiv');">

																						<br />
																						<br />
																						<input type=button value='关闭' name="industry"
																							onclick="hidedivSimple('calldiv');">
																					</td>

																					<td>
																						<strong class="norTit">选择行业</strong>
																						<br />
																						<select id="callb" class="SltBar" name="choosejob"
																							size="12" style="width:200 " multiple="true">

																						</select>
																					</td>

																				</tr>
																			</table>
																		</td>
																	</tr>
																</table>
															</div>

															<input type="hidden" name="bycallingh" value="no" />

															<input type="text" style="width:240px;" style="width:240px;"
																name="bycalling" value="选择行业类型"
																onClick="javascript:showdiv('calldiv')"
																readonly="readonly" />
														</td>
														<td></td>
													</tr>

												</table>
												<br>
												<br>
												<table border=0 cellspacing=0 cellpadding=0 width="500"
													class="small" align="center">

													<tr>
														<td>
															发布时间
														</td>
														<td>
															<select name="bytime" class="inputtype" style="width: 100">
																<option selected="selected" value="no" />
																	--请选择--
																</option>
																<option value="1">
																	近一天
																</option>
																<option value="3">
																	近三天
																</option>
																<option value="7">
																	近一周
																</option>
																<option value="14">
																	近二周
																</option>
																<option value="30">
																	近一月
																</option>
																<option value="90">
																	近三月
																</option>
															</select>
														<td>
															工作类型
														</td>
														<td>
															<select name="bykind" class="inputtype" style="width: 100">
																<option selected="selected" value="no">
																	--请选择--
																</option>
																<option value="0">
																	不限
																</option>
																<option value="1">
																	全职
																</option>
																<option value="2">
																	兼职
																</option>
															</select>
														</td>
														<td>
															学历要求
														</td>
														<td>
															<select name="bydegree"  class="inputtype" style="width: 100">
																<option selected="selected" value="no">
																	--请选择--
																</option>
																<option value="1">
																	初中
																</option>
																<option value="2">
																	中专
																</option>
																<option value="3">
																	高中
																</option>
																<option value="4">
																	大专
																</option>
																<option value="5">
																	本科
																</option>
																<option value="6">
																	硕士
																</option>
																<option value="7">
																	博士
																</option>
																<option value="0">
																	其他
																</option>
															</select>
														</td>
													<tr>
														<td>
															工作年限
														</td>
														<td>
															<select name="byyear" class="inputtype" style="width: 100">
																<option selected="selected" value="no">
																	--请选择--
																</option>
																<option value="1">
																	一年以上
																</option>
																<option value="2">
																	两年以上
																</option>
																<option value="3">
																	三年以上
																</option>
																<option value="4">
																	五年以上
																</option>
															</select>
														</td>
														<td>
															公司性质
														</td>
														<td>
															<select name="bycorpkind" class="inputtype" style="width: 100">
																<option selected="selected" value="no">
																	--请选择--
																</option>
																<option value="1">
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

														<td>
															预期薪水
														</td>
														<td>
															<select name="bywage" class="inputtype" style="width: 100">
																<option value="no">
																	--请选择--
																</option>
																<option value="0">
																	面议
																</option>
																<option value="1">
																	1000以下
																</option>
																<option value="2">
																	1000～2000
																</option>
																<option value="3">
																	2000～3000
																</option>
																<option value="4">
																	3000～4000
																</option>
																<option value="5">
																	4000～5000
																</option>
																<option value="6">
																	5000～6000
																</option>
																<option value="7">
																	6000～8000
																</option>
																<option value="8">
																	8000～10000
																</option>
																<option value="9">
																	12000～15000
																</option>
																<option value="10">
																	15000～18000
																</option>
																<option value="11">
																	18000～25000
																</option>
																<option value="12">
																	25000以上
																</option>
															</select>

														</td>

													</tr>
													<tr>
														<td>
															<br>
														</td>
													</tr>
													<tr>
														<td height="50" colspan="6" align="center">
															&nbsp;&nbsp;
															<input type="button" name="Submit3" value="·开始搜索·"
																class=btn1_mouseout
																onMouseOver="this.className='btn1_mouseover'"
																onmouseout="this.className='btn1_mouseout'"
																onClick="simfindjob()" />
														</td>
													</tr>
												</table>

												</form>
										<tr>
											<td>
												<img src="<%=url%>/images/main_3.gif" width="558"
													height="36" alt="" />
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table width="785" border="0" align="center" cellpadding="0"
				cellspacing="0">
			</table>
			<div align="center">
				<script language="javascript" type="text/javascript"
					src="<%=request.getContextPath()%>/js/down.js"></script>
			</div>
	</body>
</html>
