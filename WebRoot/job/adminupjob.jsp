<%@ page language="java" import="java.util.*,com.hrclub.to.*;" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
    <base href="<%=basePath%>">
    	<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
<title>修改招聘信息</title>
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
    alert("请选择发布时间！");
    document.checkform.starttime.focus();
    return false;
  }
     if(document.checkform.endtime.value==""){
    alert("请选择截止时间！");
    document.checkform.endtime.focus();
    return false;
  }
  
    if(document.checkform.wage.value==""){
    alert("请输入参考月薪！");
    document.checkform.wage.focus();
    return false;
  }
  
 if(!isNum(document.checkform.wage.value)){
    alert("请输入数字！");
    document.form1.wage.focus();
    return false;
  }
  
      if(document.checkform.year.value==""){
    alert("请输入工作年限！");
    document.checkform.year.focus();
    return false;
  }
  
 if(!isNum(document.checkform.year.value)){
    alert("请输入数字！");
    document.form1.year.focus();
    return false;
  }
  
  if(confirm('您确定要修改职位信息么？')){

 	 document.checkform.submit();
  }
}


</script>
    
	<%
	
    JobinfoTO to = new JobinfoTO();   
     to=(JobinfoTO)request.getAttribute("to");
	HashMap listjob = helper.getJobcomf();
	%>
</head>
<body>

<form id="form1" name="checkform" method="post" action="adminupjob.do?operation=adminupjob">
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>修改招聘信息</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<input type="hidden" name="jobID" value="<%=to.getJobID()%>" />
   
    <tr>
      <td width="130">职位标题</td>
      <td><input type="text" name="jobtitle" value="<%=to.getJobtitle()%>" /></td>
    </tr>
    <tr>
      <td>职位类型</td>
      <td><%out.println(tb.getSelect("positiontype", listjob, helper.getJobcomf(to.getPositiontype()),to.getPositiontype()));%></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<tr>
      <td width="130">专业要求</td>
      <td><%out.println(tb.getSelect("specialityID", helper.getSpecialitycomf(),null));%></td>
	</tr>
	<tr>
      <td>学历要求 </td>
      <% int degree=to.getDegree(); %>
      <td><select name="degree">
        <option  <% if(degree==1) out.print("selected"); %> value="1">初中</option>
        <option <% if(degree==2) out.print("selected"); %> value="2">中专</option>
        <option <% if(degree==3) out.print("selected"); %> value="3">高中</option>
        <option <% if(degree==4) out.print("selected"); %> value="4">大专</option>
        <option<% if(degree==5) out.print("selected"); %> value="5">本科</option>
        <option <% if(degree==6) out.print("selected"); %> value="6">硕士</option>
        <option <% if(degree==7) out.print("selected"); %> value="7">博士</option>
        <option <% if(degree==0) out.print("selected"); %>>其他</option>
                        </select></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<tr>
      <td>招聘人数</td>
      <td><input type="text" name="num" value="<%=to.getNum()%>" size="4" />人</td>
    </tr>
	
    <tr>
      <td>生效时间</td>
      <td><input id="htEnd" name="starttime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)"  MAXDATE="$htEnd" 
							MAXDATE="2020-1-1"  value="<%=to.getStarttime()%>"/></td>
    </tr>
    <tr>
      <td>截止时间</td>
      <td><input id="htEnd" name="endtime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1"  value="<%=to.getEndtime()%>" /></td>
    </tr>
	 
	 <tr>
      <td>参考月薪</td>
      <td><input type="text" name="wage" value="<%=to.getWage()%>" size="6"  />元人民币
    </tr>
    <tr>
      <td width="130">最低工作年限</td>
      <td><input type="text" name="year" value="<%=to.getYear() %>" size="4" />年</td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">	
	<tr>
      <td width="130">工作城市</td>
      <td width="100">    
       <div id='address'
				style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
				<table id="MovOpTB  align=left border=0 cellSpacing=0
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
							城市</td>
							
							<td><strong class="no Tit">选择城市</strong>
							</td>
							<td>
							</td>
							<td>
							</td>
							</tr>
							<tr>
							<td>
							<select id="city" name="city" size="12" multiple="true" style="width: 100;">
							<option value="no">选择城市</option>
							</select>
						</td>
						<td class="btn">
							<input type="button" value="添加" onclick="Mv('city','cityB');" />
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
							<select id="cityB" name="" size="12" multiple="true" style="width: 100;">
							</select>
						</td>
					</tr>
					
				</table>
			</div><input type=hidden name="isshow" value="0">
									<input type="hidden" name="byaddressh" value=<%=to.getCity() %> />
									<input type="text" style="width:150px;height:23px;"
										name="byaddress" value=<%=helper.getCtiyname(to.getCity()) %> onClick="javascript:showdiv('address')"
										readonly="readonly" /></td>
	  
      <td width="130">工作类型</td>
      
       <% int kind=to.getKind(); %>
      <td><select name="kind">
        <option value="0" <% if(kind==0) out.print("selected"); %> >不限</option>
        <option <% if(kind==1) out.print("selected"); %> value="1">全职</option>
        <option <% if(kind==2) out.print("selected"); %> value="2">兼职</option>
      </select></td>
    </tr>
    <tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">	
    <tr>
      <td width="130">职位要求</td>
      <td><textarea name="request" cols="50" rows="3"><%=to.getRequest()%></textarea></td>
    </tr>
    <tr>
      <td>职位描述</td>
      <td><textarea name="explain" cols="50" rows="3"><%=to.getExplain()%></textarea></td>
    </tr>
	<tr>
      <td>待遇说明</td>
      <td><textarea name="deal" cols="50" rows="3"><%=to.getDeal()%></textarea></td>
    </tr>
    <tr>
      <td colspan="2">
          <input type="button" class="button" name="Submit" value=" 保存 " onclick="jscheckform()" />
      </td>
    </tr>
</table>
</form>

</body>
</html>
