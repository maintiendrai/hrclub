
<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />

<html>
<head>
<%
	String url = request.getContextPath();
	%>
	
	
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>人才网站</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/css.css">
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />


<script src='<%=url %>/js/country/change_region.js'> </script>
<script src='<%=url %>/js/ParamUtil.js'> </script>
		<script src='<%=url %>/js/encryption.js'> </script>
 <script type="text/javascript">
 <!--

function doKeyDown(chose)
{
  if(event.keyCode==13)
    {
    if(chose=="1")
       itlogin();
      if(chose=="2")
     simfindjob();
 }
}



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
 
  document.form1.bycalling.focus();
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
-->
</script>
		<script>
	function itlogin(form1){
	 if(document.form1.userid.value==""){
		alert("请输入IT账号!");document.form1.userid.focus();return false;
	}
	if(document.form1.password.value==""){
		alert("请输入密码");document.form1.password.focus();return false;
	}
	 document.form1.password.value=hex_md5(document.form1.password.value)
	document.form1.operation.value="itlogin";	
	document.form1.submit();
}
function regedit(form1){
	window.location.href='it/itregedit.jsp';
}
function hrregedit(form1){
	window.location.href='hr/hrregedit.jsp';
}
function hrlogin(form1){
	window.location.href='hr/hrlogin.jsp';
}
function simfindjob(form1){
   if(choose()){
	document.form1.operation.value="simfindjob";	
	document.form1.submit();
	}
}

function choose(){
if(document.form1.keyname.value==""&&document.form1.byjobh.value=="no"&&document.form1.byaddressh.value=="no")
  {alert("请选择查询条件");
  return false;}
  else
  return true;
}

function highfindjob(form1){
	window.location.href='job/findjob.jsp';
}

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
		List movelist = helper.getMovement(10);
		List messageall = helper.getMessage(10,"1");
		List messageit = helper.getMessage(10,"3");
		List messagehr = helper.getMessage(10,"2");

		List joblist = helper.getJob(10);
		HashMap listjob = helper.getJobcomf();
			Object userid = session.getAttribute("userid");
                                        Object hrID = session.getAttribute("hrID");
                                        Object HRstatus = session.getAttribute("HRstatus");
	%>
</head>

<body  >


<div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/top.js"></script></div>

	<form action="index.do" name="form1">
			<input type="hidden" name="operation">
			
<table width="779" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top" >
   

       <%
									
										if (null !=userid) {
									%>
								
					
						
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
						
						<%
						} else if(null !=hrID){ %>
						<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
				
						<%} 
						
						else {%>
						
<table width="218" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="81" height="56" background="<%=url %>/images/login-top-01.gif"></td>
    <td width="137" height="56" background="<%=url %>/images/login-top-02.gif"></td>
  </tr>
  <tr>
    <td height="11" colspan="2" background="<%=url %>/images/login-bg-01.gif"></td>
  </tr>
  <tr>
    <td colspan="2" background="<%=url %>/images/login-bg-02.gif"><table width="75%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="30%" height="25" class="px12white"><strong>帐 号:</strong></td>
            <td width="70%"><span class="px12">
              <input type="text" name="userid" class="inputtype" size="17" onkeydown="doKeyDown('1')"></span></td>
          </tr>
          <tr>
            <td height="25" class="px12white"><strong>密 码：</strong></td>
            <td><span class="px12">
              <input type="password" name="password" class="inputtype" size="18" onkeydown="doKeyDown('1')">
            </span></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="30" align="center"><a href='#' onClick="itlogin()"><img border=0 src="images/button-01.gif" width="63" height="24"></a></td>
          <td height="30" align="center"><a href='#'  onClick="regedit()" ><img  border=0 src="<%=url %>/images/button-02.gif" width="63" height="24"></a></td>
        </tr>
      </table>
      <table width="70%" border="0" align="center" cellpadding="4" cellspacing="0">
        <tr>
          <td width="25%" align="center"><img src="<%=url %>/images/icon-1.gif" width="25" height="25"></td>
          <td width="75%" class="px12"><strong><a href="<%=url %>/hr/hrlogin.jsp" class="L1" target="_top" >HR经理人登陆</a></strong></td>
        </tr>
        <tr>
          <td align="center"><img src="<%=url %>/images/icon-2.gif" width="25" height="25"></td>
          <td class="px12"><strong><a href="<%=url %>/hr/hrregedit.jsp" class="L1" target="_top" >HR经理人注册</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="14" colspan="2" background="<%=url %>/images/login-bg-03.gif"></td>
  </tr>
</table>
<table width="218" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="64" height="61" background="<%=url %>/images/login1-top-01.gif"></td>
    <td width="154" height="61" background="<%=url %>/images/login1-top-02.gif"></td>
  </tr>
  <tr>
    <td colspan="2" background="<%=url %>/images/login1-bg-01.gif">
     <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr class="h22">
        <td background="<%=url %>/images/d02.gif"  class="h22">
           <%
											for (int i = 0; i < movelist.size(); i++) {
							%>
	       · <A href="FrontController.do?operation=movementquery&method=show&moveID=<%=((MovementTO) movelist.get(i)).getMoveID()%>" target="_top" > 
	      <%=((MovementTO) movelist.get(i)).getSubject()%></A><br >
	      <%} %>
          
		  </td>
      </tr>
        <tr class="h22"> <td align="right"><a href="FrontController.do?operation=movementlistlimt&pageNum=1" target="_top"> 更多>></a> </td>
        </tr>
    </table>
      <table width="90%" border="0" align="right" cellpadding="0" cellspacing="0">
        
    </table></td>
  </tr>
  <tr>
    <td height="31" colspan="2" background="<%=url %>/images/login1-bg-02.gif"></td>
  </tr>
  <tr>
    <td height="33" colspan="2" background="<%=url %>/images/login1-bg-03.jpg"></td>
  </tr>
</table>
						
						<%} %>
						
     </td>
  
    <td valign="top"><table width="558" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td valign="top"><table width="287" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="<%=url %>/images/lf_1_1_1.gif" width="287" height="24" alt="" /></td>
          </tr>
          <tr>
            <td class="search"><table width="100%" border="0" cellspacing="0" cellpadding="3">
              <tr>
                <td width="25%">职位类型: <div id='jobdiv'
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
  <td >职位类型<br /><select id="SltAddrA" class="SltBar" name="alljob" size="12"  multiple="true">
    <%  
    
    	Iterator itjob = listjob.keySet().iterator();
						while (itjob.hasNext()) {
							Object key=itjob.next();
               %>
    <option  value=<%=key.toString()%> >	<%=listjob.get(key).toString()%></option>
   <%} %>
  </select>
  </td>
  <td>
  <input type="button" class="BtnA2w" name="" value="添加" onclick="Mv('SltAddrA','SltAddrB');" /><br />
  <br /><input type="button" class="BtnB2w" name="" value="移除" onclick="Mvout('SltAddrB','SltAddrA');" />
    <br />
  <br /><input type=button value='确定' name="industry"onclick="choseend('SltAddrB','jobdiv');">

  <br />
  <br /><input type=button value='关闭' name="industry"onclick="hidedivSimple('jobdiv');">
  </td>
  
  <td ><strong class="norTit">选择职位</strong><br />
  <select  id="SltAddrB" class="SltBar" name="choosejob" size="12"  style="width:200 "  multiple="true" >
 
  </select></td>
  
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</div></td>
                <td width="75%"><input type="hidden" name="pageNum" value="1" />
									<input type="hidden" name="byjobh" value="no" />
									<input type="text" style="width:150px;height:23px;"
										name="byjob" value="选择职位类型" onClick="javascript:showdiv('jobdiv')"
										readonly="readonly"  onkeydown="doKeyDown('2')" />
									<input type=hidden name="isshow" value="0"></td>
              </tr>
              <tr>
                <td>工作地点: <div id='address'
				style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
				<table id=MovOpTB  align="center" border=0 cellSpacing=0
											cellPadding=0 width="380">
				
						<tr>
						<td>
							<select name="province" id="country"
								onChange="change_region(window.document.form1.city ,  window.document.form1.country.options[selectedIndex].value );">
								<option value="no" selected="selected">
									请选择省份
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
							<select id="city" name="city" size="12" multiple="true" style="width: 100;">
							<option value="no">选择城市</option>
							</select>
						</td>
						<td>
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
			</div></td>
                <td>	<input type="hidden" name="byaddressh" value="no" />
									<input type="text" style="width:150px;height:23px;"
										name="byaddress" value="选择工作地点" onClick="javascript:showdiv('address')"
										readonly="readonly"  onkeydown="doKeyDown('2')"  /></td>
              </tr>
              <tr>
                <td>关 键 字:</td>
                <td>
									<input type="text" style="width:150px;height:23px;"
										name="keyname" value=""  onkeydown="doKeyDown('2')"  /></td>
              </tr>
              <tr>
                <td colspan="2"><div align="center"><img src="<%=url %>/images/btn_05.gif" width="66" height="19" onClick="simfindjob()"  />&nbsp;<img src="<%=url %>/images/btn_06.gif" width="65" height="19" onClick="highfindjob()"  /></div></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td><img src="<%=url %>/images/lf_1_1_3.gif" width="287" height="18" alt="" /></td>
          </tr>
        </table></td>
        <td valign="top"><table width="271" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><img src="<%=url %>/images/lf_1_2_1.gif" width="271" height="61" alt="" /></td>
          </tr>
          <tr>

            <td height="100" class="news">
		  <marquee direction="up" onMouseOver=this.stop() onMouseOut=this.start() scrolldelay="150" height="117" scrollamount="2">			                
                  
                   <% if(null!=hrID) {
                                        for (int i = 0; i < messagehr.size(); i++) {
									
										%>
                              
										<img src="<%=url %>/images/2.gif" width="7" height="7" />【HR公告】<A
											href="messagequery.do?operation=messagequery&method=show&messageID=<%=((MessageTO) messagehr.get(i)).getMessageID()%>" target="_top">
											<%=((MessageTO) messagehr.get(i)).getSubject()%>
										</A><br />
										<%
											}}
										%>
                                         <% if(null!=userid) {
                                        for (int i = 0; i < messageit.size(); i++) {
									
										%>
										<img src="<%=url %>/images/2.gif" width="7" height="7" />【IT公告】<A
											href="messagequery.do?operation=messagequery&method=show&messageID=<%=((MessageTO) messageit.get(i)).getMessageID()%>" target="_top">
											<%=((MessageTO) messageit.get(i)).getSubject()%>
										</A><br />
										<%
											}}
										%>
										<%
												for (int i = 0; i < messageall.size(); i++) {
										%>
										<img src="<%=url %>/images/2.gif" width="7" height="7" />【公告】<A
											href="messagequery.do?operation=messagequery&method=show&messageID=<%=((MessageTO) messageall.get(i)).getMessageID()%>" target="_top">
											<%=((MessageTO) messageall.get(i)).getSubject()%>
										</A><br />
										<%
											}
										%>
										
                  </marquee> </td>
          </tr>
          <tr><td class="news" align="right"><a  href="FrontController.do?operation=messagelistlimt&pageNum=1" target="_top">更多>> </a></td>
          </tr>
          <tr>
            <td><img src="<%=url %>/images/lf_1_2_3.gif" width="271" height="23" alt="" /></td>
          </tr>
        </table></td>
      </tr>
    </table>
      <table width="558" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="<%=url %>/images/lf_2_1.gif" width="558" height="36" alt="" /></td>
        </tr>
        <tr>
          <td height="100" class="gedi" valign=top><span id="blue">华北-东北</span> <a href="byaddress.do?operation=byaddress&pageNum=1&city=0">北京</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=2">天津</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=231">大连</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=222">沈阳</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=212">长春</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=61">哈尔滨</a><br />
            <span id="blue">华东-地区</span> <a href="byaddress.do?operation=byaddress&pageNum=1&city=1">上海</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=185">南京</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=197">苏州</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=366">杭州</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=370">宁波</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=196">无锡</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=22">福州</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=27">厦门</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=272">青岛</a> <br />
            <span id="blue">华南-华中</span> <a href="byaddress.do?operation=byaddress&pageNum=1&city=75">广州</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=86">深圳</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=85">东莞</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=142">武汉</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=160">长沙</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=123">郑州</a> <br />
          <span id="blue">西北-西南</span>  <a
													href="byaddress.do?operation=byaddress&pageNum=1&city=294">西安</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=305">成都</a>
												<a href="byaddress.do?operation=byaddress&pageNum=1&city=3">重庆</a>
												<a
													href="byaddress.do?operation=byaddress&pageNum=1&city=349">昆明</a>
												<a href="/hrclub/job/simresult.do?operation=showalljob&pageNum=1">全国/其他</a></td>
        </tr>
        <tr>
          <td><img src="<%=url %>/images/lf_2_3.gif" width="558" height="18" alt="" /></td>
        </tr>
      </table>
      <table width="558" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td><img src="<%=url %>/images/lf_3_1.gif" width="558" height="35" alt="" /></td>
        </tr>
        <tr>
          <td height="152" class="gedi" valign=top><table width="80%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><b>招聘标题</b></td>
              <td><b>HR账号</b></td>
                <td><b>发布时间</b></td>
            </tr>
           	<%
										for (int i = 0; i < joblist.size(); i++) {
										%>
										<tr>
											<td>
												<a
													href="queryjob.do?operation=queryjob&jobID=<%=((JobinfoTO) joblist.get(i)).getJobID()%>" target="_top">
													<%
													out.print(((JobinfoTO) joblist.get(i)).getJobtitle());
													%> </a>
											</td>
											<td>
												<%=((JobinfoTO) joblist.get(i)).getHrID()%>
											</td>
												<td>
												<%=((JobinfoTO) joblist.get(i)).getPuttime()%>
											</td>
											<%
											}
											%>
											</tr>
											<tr><td align="right" colspan="3"><a href="simresult.do?operation=showalljob&pageNum=1" target="_top">更多>> </a> </td>
										
											</tr>
            
            
          </table></td>
        </tr>
        <tr>
          <td><img src="<%=url %>/images/lf_3_3.gif" width="558" height="36" alt="" /></td>
        </tr>
      </table></td>
  </tr>
</table>
<div align="center"><script language="javascript" type="text/javascript" src="<%=url %>/js/down.js"></script></div>
</body>
</html>
