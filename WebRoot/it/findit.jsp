<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />

<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<base href="<%=basePath%>">
		<script src='<%=path%>/js/country/change_region.js'> </script>
		<title>IT人才搜索界面</title>
		<script>
  function doKeyDown(chose)
{
  if(event.keyCode==13)
    {
    if(chose=="1")
    simfindit(form1)
      if(chose=="2")
    highfindit(form1)
 }
}
  
function simfindit(form1){
  if(choose()){
	document.form1.operation.value="findit";	
	document.form1.sign.value="sim";
	document.form1.submit();
}}


function highfindit(form1){


	document.form1.operation.value="findit";	
	document.form1.sign.value="high";
	document.form1.submit();

}
function choose(){
if(document.form1.byjobh.value=="no"&&document.form1.byaddressh.value=="no"&&document.form1.speh.value=="no"&&document.form1.finkey.value=="")
  {alert("请选择查询条件");
  return false;}
  else
  return true;
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
  document.form1.byjob.focus();
 hidedivSimple(b)
}

var call="";
var callvalue="";

function chosespe(a,b){
 call="";
 callvalue="";
var i = 0;
var f=document.getElementById(a);
for(var i=0; i<f.options.length; i++)
{ 
    call=f.options[i].text+","+call;
    callvalue=f.options[i].value+','+callvalue;
 }
 document.form1.spe.value=call;
 document.form1.speh.value=callvalue;
  document.form1.spe.focus();
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
   document.form1.byaddress.focus();
 hidedivSimple(b)
}


var skill="";
var skillvalue="";

function choseskill(a,b){
 skill="";
 skillvalue="";
var i = 0;
var f=document.getElementById(a);
for(var i=0; i<f.options.length; i++)
{ 
    skill=f.options[i].text+","+skill;
    skillvalue=f.options[i].value+","+skillvalue;
 }
 document.form1.byitskill.value=skill;
 document.form1.byitskillh.value=skillvalue;
   document.form1.byitskill.focus();
 hidedivSimple(b)
}
-->
</script>
		<script>




function showdiv(a){ 

  if(document.form1.isshow.value=="0"){
	 document.getElementById(a).style.display="";  

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
		<%
			HashMap list = helper.getJobcomf();
			HashMap map = helper.getLanguage();
		%>
	</head>
	<%
		String hrID = (String) session.getAttribute("hrID");
		if (null == hrID) {

			response.sendRedirect("../hr/hrlogin.jsp");

		} else {
	%>
	<body topmargin="0" leftmargin="0">
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	 <table width="776" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table width="218" border="0" align="left" cellpadding="0" cellspacing="0">
      <tr>
        <td>
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
				</td>
				
			</tr>
			  </table>
       
					
					
      <table width="558" border="0" align="right" cellpadding="0" cellspacing="0">
      <form name="form1" method="post" action="findit.do">
						<input type="hidden" name="operation">
						<input type="hidden" name="sign">
						<input type="hidden" name="pageNum" value="1">
        <tr>
          <td><table width="558" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="60" valign="top" background="<%=request.getContextPath()%>/images/main_1.gif"><img src="<%=request.getContextPath()%>/images/ba-rcss.jpg" width="181" height="49"></td>
            </tr>
            <tr>
              <td background="<%=request.getContextPath()%>/images/main_2.gif"><table width="500" border="0" align="center" cellpadding="4" cellspacing="0">
                <tr>
                  <td class="px12blue"><strong><img src="<%=request.getContextPath()%>/images/icon-01.jpg" width="20" height="18" align="absmiddle"> 简单搜索</strong></td>
                </tr>

							<tr>
								<td width="100">
									<div id='jobdiv'
										style='position:absolute;width:350;height:200;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
										<table width=100% align="center" border=0 cellSpacing=0
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
																			HashMap listjob = helper.getJobcomf();
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
																<input type="button" class="BtnA2w" name="" value="添加"
																	onclick="Mv('SltAddrA','SltAddrB');" />
																<br />
																<br />
																<input type="button" class="BtnB2w" name="" value="移除"
																	onclick="Mvout('SltAddrB','SltAddrA');" />
																<br />
																<br />
																<input type=button value='确定' name="industry"
																	onclick="choseend('SltAddrB','jobdiv');">

																<br />
																<br />
																<input type=button value='关闭' name="industry"
																	onclick="hidedivSimple('jobdiv');">
															</td>

															<td>
																<strong class="norTit">选择职位</strong>
																<br />
																<select id="SltAddrB" class="SltBar" name="choosejob"
																	size="12" style="width:200 " multiple="true">

																</select>
															</td>

														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
									意向职位
								</td>
								<td width="300">
									<input type="hidden" name="pageNum" value="1" />
									<input type="hidden" name="byjobh" value="no" />
									<input type="text" style="width:150px;height:23px;"
										name="byjob" value="选择意向职位"
										onClick="javascript:showdiv('jobdiv')" readonly="readonly"  onkeydown="doKeyDown('1')"/>
									<input type=hidden name="isshow" value="0">
								</td>
							</tr>
							<tr>
								<td>
									<div id='address'
										style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
										<table id=MovOpTB align="center" border=0 cellSpacing=0
											cellPadding=0 width="400">
											<tr>
												<td>
													请选择地点
												</td>
											</tr>
											<tr>
												<td>
													<strong> 省份</strong>
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
											
						
												<td width="100">
												<td>
													<strong>选择城市</strong>
												</td>
                         
											</tr>
											<tr>
												<td>
													<select id="city" name="city" size="12" multiple="true"
														style="width: 100;">
														<option value="no">
															选择城市
														</option>
													</select>
												</td>
												<td>
													<input type="button" value="添加"
														onclick="Mv('city','cityB');" />
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
							工作地点
							</td>
							<td>
								<input type="hidden" name="byaddressh" value="no" />
								<input type="text" style="width:150px;height:23px;"
									name="byaddress" value="选择工作地点"
									onClick="javascript:showdiv('address')" readonly="readonly" onkeydown="doKeyDown('1')" />
							</td>
							</tr>
							<tr>
								<td>
									<div id='spediv'
										style='position:absolute;width:350;height:200;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
										<table width=100% align="center" border=0 cellSpacing=0
											cellPadding=0>
											<tr>
												<td>
													选择专业类型
												</td>
											</tr>
											<tr>
												<td colspan＝2 align=left>

													<table>
														<tr>
															<td>
																<strong>专业类型</strong>
																<br />
																<select id="speA" class="SltBar" name="alljob" size="12"
																	multiple="true">
																	<%
																			HashMap listspe = helper.getSpecialitycomf();

																			Iterator listspejob = listspe.keySet().iterator();
																			while (listspejob.hasNext()) {
																				Object key = listspejob.next();
																	%>
																	<option value=<%=key.toString()%>>
																		<%=listspe.get(key).toString()%>
																	</option>
																	<%
																	}
																	%>
																</select>
															</td>
															<td>
																<input type="button" class="BtnA2w" name="" value="添加"
																	onclick="Mv('speA','speB');" />
																<br />
																<br />
																<input type="button" class="BtnB2w" name="" value="移除"
																	onclick="Mvout('speB','speA');" />
																<br />
																<br />
																<input type=button value='确定' name="industry"
																	onclick="chosespe('speB','spediv');">

																<br />
																<br />
																<input type=button value='关闭' name="industry"
																	onclick="hidedivSimple('spediv');">
															</td>

															<td>
																<strong class="norTit">选择专业</strong>
																<br />
																<select id="speB" class="SltBar" size="12"
																	style="width:200 " multiple="true">

																</select>
															</td>

														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
									专业信息
								</td>
								<td>
									<input type="hidden" name="speh" value="no" />
									<input type="text" style="width:150px;height:23px;" name="spe"
										value="选择专业信息" onClick="javascript:showdiv('spediv')"
										readonly="readonly"  onkeydown="doKeyDown('1')"/>
								</td>
							</tr>
							<tr>
								<td>
									关键字
								</td>
								<td>
									<input type="text" name="finkey" onkeydown="doKeyDown('1')"/>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<div>
										<input type=button name="Submit" value="开始搜索"
											onclick="simfindit(form1)" class=btn1_mouseout
											onmouseover="this.className='btn1_mouseover'"
											onmouseout="this.className='btn1_mouseout'"  />
									</div>
								</td>
							</tr>
							<tr><td><br></td></tr>
						</table>
						<table width="500" border="0" align="center" cellpadding="4" cellspacing="0">
							 <tr>
                    <td class="px12blue"><strong><img src="<%=request.getContextPath()%>/images/icon-01.jpg" width="20" height="18" align="absmiddle"> 高级搜索</strong></td>
                  </tr>
							<tr>
								<td width="100">
									是否核心人才
								</td>
								<td width="300">
									<input type="radio" name="core" value="0" checked="checked" />
									否
									<input type="radio" name="core" value="1" />
									是
								</td>
							</tr>
							<tr>
								<td>
									<div id='itskilldiv'
										style='position:absolute;width:350;height:200;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
										<table width=100% align=left border=0 cellSpacing=0
											cellPadding=0>
											<tr>
												<td>
													选择IT技能类型
												</td>
											</tr>
											<tr>
												<td colspan＝2 align=left>

													<table>
														<tr>
															<td >
																<strong class="norTit">IT技能类型</strong>
																<br />
																<select id="itskillA" class="SltBar" name="alljob"
																	size="12" multiple="true" >
																	<%
																			HashMap listit = helper.getITskillcomf();

																			Iterator skillit = listspe.keySet().iterator();
																			while (skillit.hasNext()) {
																				Object key = skillit.next();
																	%>
																	<option value=<%=key.toString()%>>
																		<%=listit.get(key).toString()%>
																	</option>
																	<%
																	}
																	%>
																</select>
															</td>
															<td >
																<input type="button" class="BtnA2w" name="" value="添加"
																	onclick="Mv('itskillA','itskillB');" />
																<br />
																<br />
																<input type="button" class="BtnB2w" name="" value="移除"
																	onclick="Mvout('itskillB','itskillA');" />
																<br />
																<br />
																<input type=button value='确定' name="industry"
																	onclick="choseskill('itskillB','itskilldiv');">

																<br />
																<br />
																<input type=button value='关闭' name="industry"
																	onclick="hidedivSimple('itskilldiv');">
															</td>

															<td >
																<strong class="norTit">选择IT技能</strong>
																<br />
																<select id="itskillB" class="SltBar" size="12"
																	style="width:200 " multiple="true">

																</select>
															</td>

														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div>
									IT技能
								</td>
								<td>
									<input type="hidden" name="byitskillh" value="no">
									<input type="text" style="width:150px;height:23px;"
										name="byitskill" value="选择IT技能"
										onClick="javascript:showdiv('itskilldiv')" readonly="readonly" onkeydown="doKeyDown('2')" />
								</td>
							</tr>

							<tr>
								<td>
									工作类型
								</td>
								<td>
									<select name="bykind" class="inputtype"  style="width: 100" onkeydown="doKeyDown('2')">
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

							</tr>
							<tr>
								<td>
									学历要求
								</td>
								<td>
									<select name="degree" class="inputtype"  style="width: 100" onkeydown="doKeyDown('2')">
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
							</tr>
							<tr>
								<td>
									证书
								</td>
								<td>

									<%
											out.println(tb.getSelect("crertname", helper
											.getCertificateComf(), "------------请选择------------", "no"));
									%>
								</td>
							</tr>
							<tr>
								<td>
									工作年限

								</td>
								<td>
									<select name="workyear" class="inputtype"  style="width: 100" onkeydown="doKeyDown('2')">
										<option selected="selected" value="no">
											--请选择--
										</option>
										<option value="1">
											在校学生
										</option>
										<option value="2">
											一年以内
										</option>
										<option value="3">
											一年以上
										</option>
										<option value="4">
											两年以上
										</option>
										<option value="5">
											三年以上
										</option>
										<option value="6">
											五年以上
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									预期薪水

								</td>
								<td>

									<select name="bywage" class="inputtype"  style="width: 100" onkeydown="doKeyDown('2')">
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
									毕业院校
								</td>
								<td>
									<input type="text" name="school" onkeydown="doKeyDown('2')"/>
								</td>
							</tr>
							<tr>
								<td>
									外语
								</td>
								<td>
									<%
									out.println(tb.getSelect("languagename", map, "---请选择---", "no"));
									%>
								</td>
							</tr>
							<tr>
								<td colspan="4">
									<div>
										<input type=button name="Submit2" value="开始搜索"
											onclick="highfindit(form1)" class=btn1_mouseout
											onmouseover="this.className='btn1_mouseover'"
											onmouseout="this.className='btn1_mouseout'" />
									</div>
								</td>
							</tr>
						</table>
	<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif"  height="36" alt="" /></td>
       </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="785" border="0" align="center" cellpadding="0" cellspacing="0">
</table>
			<%
	}
	%>

 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>

</html>
