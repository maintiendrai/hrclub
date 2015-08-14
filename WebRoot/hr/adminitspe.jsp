<%@ page language="java"
	import="java.util.*,com.hrclub.to.ITUserSpecialityTO"
	pageEncoding="gbk"%>
<%
String url = request.getContextPath();
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	    <link rel="stylesheet" type="text/css" href="../adminindex/table.css">
		<script src='<%=url%>/js/ParamUtil.js'> </script>
		<script language="javascript" type="text/javascript"
			src="<%=url%>/js/datepicker/WdatePicker.js"></script>
		<script src='<%=url%>/js/country/change_region.js'> </script>
		<title>显示专业信息</title>

	</head>

	<script> 
function jscheckform(){


 if(document.checkform.namekey.value==""){
    alert("请输入简历名称！");
    document.checkform.namekey.focus();
    return false;
  }

  if(document.checkform.school.value==""){
    alert("请输入毕业学校！");
    document.checkform.school.focus();
    return false;
  }
    if(document.checkform.specialityID.value=="no"){
    alert("请选择所修专业！");
    document.checkform.specialityID.focus();
    return false;
  }
   if(document.checkform.byjobh.value=="no"){
    alert("请选择意向职位！");
    document.checkform.byjobh.focus();
    return false;
  }
  if(document.checkform.byaddressh.value=="no"){
    alert("请选择意向工作地点！");
    document.checkform.byaddressh.focus();
    return false;
  }
    if(document.checkform.educate.value==""){
    alert("请输入教育情况");
    document.checkform.educate.focus();
    return false;
  } 
  if(document.checkform.hortation.value==""){
    alert("请输入奖励情况！");
    document.checkform.hortation.focus();
    return false;
  }
  if(document.checkform.train.value==""){
    alert("请输入培训经历情况");
    document.checkform.train.focus();
    return false;
  } 

  if(document.checkform.selfvalue.value==""){
    alert("请输入自我评价信息");
    document.checkform.selfvalue.focus();
    return false;
  } 
  
  if(confirm('您确定要提交信息么？')){
 	 document.checkform.submit();
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
 document.checkform.byaddress.value=address;
 document.checkform.byaddressh.value=addressvalue;
 
 hidedivSimple(b)
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
 document.checkform.byjob.value=jobs;
 document.checkform.byjobh.value=jobvalue;
 
 hidedivSimple(b)
}
-->
</script>
	<script>


function showdiv(a){ 

  if(document.checkform.isshow.value=="0"){
	 document.getElementById(a).style.display="";  
 document.getElementById(a).style.left=300;
	  document.getElementById(a).style.width=560;
	  document.getElementById(a).style.height=250;
	  document.checkform.isshow.value='1';
  }else{
 	 hidedivSimple();
 	 document.checkform.isshow.value='0';
  }
}


function hidedivSimple(b){
  document.getElementById(b).style.display="none";
  document.checkform.isshow.value='0';
   
}


</script>
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
						<b>推荐IT人才</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>


			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">

				<form name="checkform" method="post"
					action="speinfo.do?operation=commenditspe">
					<table border=0 cellspacing=0 cellpadding=0 width="98%"
						class="small">
						<tr>
							<td colspan="2">
								请填写专业信息 下一步填写工作经历
							</td>

						</tr>

						<tr>
							<td width="130">
								简历名称
							</td>

							<td>
								<input type="text" name="namekey" value="" style="width:156"/>
							</td>
						</tr>


						<tr>
							<td>
								学历
							</td>
							<td>
								<select name="degree">
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
									<option selected="selected" value="5">
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
								毕业院校
							</td>
							<td>
								<input type="text" name="school" value="" style="width:156"/>
							</td>
						</tr>
						<tr>
							<td>
								所修专业
							</td>
							<td>
									<%
									out.println(tb.getSelect("specialityID",
									helper.getSpecialitycomf(), "请选择","no"));
						%>
							</td>
						</tr>
						<tr>
							<td>
								意向职位
							</td>
							<td>
								<input type="hidden" name="pageNum" value="1" />
								<input type="hidden" name="byjobh" value="no" />
								<input type="text" style="width:156px;height:23px;" name="byjob"
									value="选择意向职位" onClick="javascript:showdiv('jobdiv')"
									readonly="readonly" />
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
														<td class="slt">
															<strong class="norTit">职位类型</strong>
															<br />
															<select id="SltAddrA" class="SltBar" name="alljob"
																size="12" multiple="true">
																<%
																	HashMap listjob = helper.getJobcomf();
																	Iterator itjob = listjob.keySet().iterator();
																	while (itjob.hasNext()) {
																%>
																<option value=<%=itjob.next().toString()%>>
																	<%=listjob.get(itjob.next()).toString()%>
																</option>
																<%
																}
																%>
															</select>
														</td>
														<td class="btn">
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

														<td class="slt">
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


							</td>

						</tr>
						<tr>
							<td>
								<div id='address'
									style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
									<table
										id="MovOpTB  align=left border=0 cellSpacing=0
											cellPadding=0">
										<tr>
											<td class="slt">
												<strong class="norTit">请选择地点</strong>
											</td>
											<td>
												省份
												<select name="province" id="country"
													onChange="change_region( &#13;&#10;       window.document.checkform.city , &#13;&#10;       window.document.checkform.country.options[selectedIndex].value );">
													<option value="no" selected="selected">
														请选择
													</option>
													<script language="javascript">
        set_select_options( window.document.checkform.country, country, "" ) ;
						</script>
												</select>
											</td>
											<td>
											</td>
										</tr>
										<tr>
											<td>
												城市
											</td>

											<td>
												<strong class="no Tit">选择城市</strong>
											</td>
											<td>
											</td>
											<td>
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
											<td class="btn">
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
											<td class="slt">
												<select id="cityB" name="" size="12" multiple="true"
													style="width: 100;">
												</select>
											</td>
										</tr>

									</table>
								</div>
								意向工作地点
							</td>

							<td>
								<input type=hidden name="isshow" value="0">
								<input type="hidden" name="byaddressh" value="no" />
								<input type="text" style="width:156px;height:23px;"
									name="byaddress" value="意向工作地点"
									onClick="javascript:showdiv('address')" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td>
								工作类型
							</td>
							<td>
								<select name="bykind">
									<option selected="selected" value="10">
										请选择
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
								预期薪水
							</td>
							<td>
								<select name="wage">
					<option value="13">请选择</option>
					<option value="0">面议</option>
					<option value="1">1000以下</option>
					<option value="2">1000～2000</option>
					<option value="3">2000～3000</option>
					<option value="4">3000～4000</option>
					<option value="5">4000～5000</option>
					<option value="6">5000～6000</option>
					<option value="7">6000～8000</option>
					<option value="8">8000～10000</option>
					<option value="9">12000～15000</option>
					<option value="10">15000～18000</option>
					<option value="11">18000～25000</option>
					<option value="12">25000以上</option>
					</select>
						元人民币
							</td>
						</tr>
						<tr>
							<td>
								工作年限
							</td>
							<td>
								<select name="workyear">
									<option selected="selected" value="0">
										请选择
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
								教育经历
							</td>
							<td>
								<textarea name="educate" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								奖励
							</td>
							<td>
								<textarea name="hortation" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								培训经历
							</td>
							<td colspan="2">
								<textarea name="train" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								自我评价
							</td>
							<td colspan="2">
								<textarea name="selfvalue" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr><td><br></td></tr>
						<tr>
							<td colspan="2">
								<div align="left">

									<input type=button name="Submit" value="提交信息" class="button"
										onClick="jscheckform();" />
									<input type="reset" name="Submit2" value=" 重置 " class="button"/>
								</div>
							</td>
						</tr>

					</table>
				</form>

			</table>
		</div>
	</body>
</html>
