<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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
		<base href="<%=basePath%>">
		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=path%>/js/basicinfo.js'> </script>
		<link href="<%=request.getContextPath()%>/css/index.css"
			rel="stylesheet" type="text/css" />
	


		<title>发布职位</title>
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

function jscheckform(){

  if(document.checkform.jobtitle.value==""){
    alert("请输入标题名！");
    document.checkform.jobtitle.focus();
    return false;
  }
   if(document.checkform.positiontype.value=="no"){
    alert("请选择职位！");
    document.checkform.positiontype.focus();
    return false;
  }
   if(document.checkform.specialityID.value=="no"){
    alert("请选择专业！");
    document.checkform.specialityID.focus();
    return false;
  }


  
  
    if(document.checkform.byaddressh.value=="no"){
    alert("请选择工作地点！");
    document.checkform.city.focus();
    return false;
  }

  
    if(document.checkform.city.value=="no"){
    alert("请选择城市！");
    document.checkform.city.focus();
    return false;
  }
  
    if(document.checkform.num.value==""){
    alert("请输入招聘人数！");
    document.checkform.num.focus();
    return false;
  }
  
 if(!isNum(document.checkform.num.value)){
    alert("请输入数字！");
    document.form1.num.focus();
    return false;
  }
  
   if(document.checkform.starttime.value==""){
    alert("请选择生效时间！");
    document.checkform.starttime.focus();
    return false;
  }
     if(document.checkform.endtime.value==""){
    alert("请选择截止时间！");
    document.checkform.endtime.focus();
    return false;
  }
  
    if(document.checkform.wage.value=="no"){
    alert("请输入参考月薪！");
    document.checkform.wage.focus();
    return false;
  }
  
 if(!isNum(document.checkform.wage.value)){
    alert("请输入数字！");
    document.form1.wage.focus();
    return false;
  }
  
   
  
 if(!isNum(document.checkform.year.value)){
    alert("请输入数字！");
    document.form1.year.focus();
    return false;
  }
  
  if(confirm('您确定要发布职位么？')){

 	 document.checkform.submit();
  }
}



</script>




		<%
		HashMap listjob = helper.getJobcomf();
		%>

	</head>
	<%
		String hrID = (String) session.getAttribute("hrID");
		if (null == hrID) {

			response.sendRedirect("../hr/hrlogin.jsp");

		} else {
	%>
	<body topmargin="0" leftmargin="0">
		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/top.js"></script>
		</div>
			<form id="form1" name="checkform" method="post"
				action="putjob.do?operation=putjob">
		<table width="776" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td>
					<table width="218" border="0" align="left" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<iframe height="550" frameborder="0" scrolling="no"
									src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
							</td>

						</tr>

					</table>
					<table width="558" border="0" align="right" cellpadding="0"
						cellspacing="0">
						<tr>
							<td>
								<table width="558" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td height="60" align="left" valign="top"
											background="<%=request.getContextPath()%>/images/main_1.gif">
											<img src="<%=request.getContextPath()%>/images/ba-fbzw.jpg"
												width="181" height="49">
										</td>
									</tr>
									<tr>
										<td
											background="<%=request.getContextPath()%>/images/main_2.gif">
											<table width="500" border="0" align="center" cellpadding="4"
												cellspacing="0">
												<tr>
													<td width="158">
														职位标题
													</td>
													<td width="334">
														<input type="text" name="jobtitle" style="width=190" />
														<span class="star">*</span>
													</td>
												</tr>
												<tr>
													<td width="158">
														职位类型
													</td>
													<td width="334">
														<table>
															<tr>
																<td>
																	<%
																			out.println(tb.getSelect("positiontype", listjob,
																			"---------------请选择----------------", "no"));
																	%>
																</td>
																<td>
																	<span class="star">*</span>
																</td>
															</tr>
														</table>
													</td>

												</tr>
												<tr>
													<td width="158">
														专业要求
													</td>
													<td width="334">
														<table>
															<tr>
																<td>
																	<%
																			out.println(tb.getSelect("specialityID", helper
																			.getSpecialitycomf(), "---------请选择---------", "no"));
																	%>
																</td>
																<td>
																	<span class="star">*</span>
																</td>
															</tr>
														</table>
													</td>
												</tr>
												<tr>
													<td>
														<div id='address'
															style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
															<table id=MovOpTB align="center" border=0 cellSpacing=0
																cellPadding=0 width="400">
																<tr>
																	<td class="slt">
																		请选择地点
																	</td>
																</tr>
																<tr>
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



																	<td>
																		<strong class="no Tit">选择城市</strong>
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
														<input type=hidden name="isshow" value="0">
														<input type="hidden" name="byaddressh" value="no" />
														<input type="text" style="width:150px;height:23px;"
															name="byaddress" value="选择工作地点"
															onClick="javascript:showdiv('address')"
															readonly="readonly" />
														<span class="star">*</span>
													</td>
												</tr>
												<tr>
													<td>
														学历要求
													</td>
													<td>
														<select name="degree" style="width: 100">
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
														<span class="star">*</span>
													</td>
												</tr>

												<tr>
													<td width="158">
														招聘人数
													</td>
													<td width="334">
														<input type="text" name="num" size="4" style="width=100" />
														人
														<span class="star">*</span>
													</td>
												</tr>

												<tr>
													<td>
														生效时间
													</td>
													<td>
														<input name="starttime" type="text" class="Wdate"
															onfocus="new WdatePicker(this)" MINDATE="$htStart"
															MAXDATE="2020-1-1" />
													</td>
												</tr>
												<tr>
													<td>
														截止时间
													</td>
													<td>
														<input name="endtime" type="text" class="Wdate"
															onfocus="new WdatePicker(this)" MINDATE="$htStart"
															MAXDATE="2020-1-1" />
													</td>
												</tr>

												<tr>
													<td width="158">
														参考月薪
													</td>
													<td width="334">
														<select name="wage" style="width: 100">
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
														元人民币
														<span class="star">*</span>
													</td>
												</tr>


												<tr>
													<td>
														工作类型
													</td>
													<td>
														<select name="kind" style="width: 100">
															<option value="0">
																不限
															</option>
															<option selected="selected" value="1">
																全职
															</option>
															<option value="2">
																兼职
															</option>
														</select>
														<span class="star">*</span>
													</td>
												</tr>
												<tr>
													<td width="158">
														最低工作年限
													</td>
													<td width="334">
														<input type="text" name="year" size="4" style="width=100" />
														年
													
													</td>
												</tr>
												<tr>
													<td width="158" valign="top">
														职位要求
													</td>
													<td width="334">
														<textarea name="request" cols="40" rows="8"></textarea>
													</td>
												</tr>
												<tr>
													<td width="158" valign="top">
														职位描述
													</td>
													<td width="334">
														<textarea name="explain" cols="40" rows="8"></textarea>
													</td>
												</tr>
												<tr>
													<td width="158" valign="top">
														待遇说明
													</td>
													<td width="334">
														<textarea name="deal" cols="40" rows="8"></textarea>
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<div>
															<input type="button" name="Submit" class=btn1_mouseout
																onmouseover="this.className='btn1_mouseover'"
																onmouseout="this.className='btn1_mouseout'"
																value=" 发 布 " onclick="jscheckform()" />
														</div>
													</td>
												</tr>

											</table>
									<tr>
										<td>
											<img src="/hrclub/images/main_3.gif" width="558" height="36"
												alt="" />
										</td>
									</tr>
								
								 </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<table width="785" border="0" align="center" cellpadding="0" cellspacing="0">
</table>
								</form>
					
			<%
			}
			%>


			<div align="center">
				<script language="javascript" type="text/javascript"
					src="<%=request.getContextPath()%>/js/down.js"></script>
			</div>
	</body>

</html>
