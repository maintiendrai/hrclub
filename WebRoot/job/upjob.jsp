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
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

    <base href="<%=basePath%>">
    	<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
<title>�޸���Ƹ��Ϣ</title>
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
{alert("���ѡ������");
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

   if(document.checkform.positiontype.value=="no"){
    alert("��ѡ��ְλ��");
    document.checkform.positiontype.focus();
    return false;
  }
   if(document.checkform.specialityID.value=="no"){
    alert("��ѡ��רҵ��");
    document.checkform.specialityID.focus();
    return false;
  }
  if(document.checkform.jobtitle.value==""){
    alert("�������������");
    document.checkform.jobtitle.focus();
    return false;
  }
  
  
    if(document.checkform.byaddressh.value=="no"){
    alert("��ѡ�����ص㣡");
    document.checkform.city.focus();
    return false;
  }

  
    if(document.checkform.city.value=="no"){
    alert("��ѡ����У�");
    document.checkform.city.focus();
    return false;
  }
  
    if(document.checkform.num.value==""){
    alert("��������Ƹ������");
    document.checkform.num.focus();
    return false;
  }
  
 if(!isNum(document.checkform.num.value)){
    alert("���������֣�");
    document.form1.num.focus();
    return false;
  }
  
   if(document.checkform.starttime.value==""){
    alert("��ѡ�񷢲�ʱ�䣡");
    document.checkform.starttime.focus();
    return false;
  }
     if(document.checkform.endtime.value==""){
    alert("��ѡ���ֹʱ�䣡");
    document.checkform.endtime.focus();
    return false;
  }
     if(document.checkform.wage.value=="no"){
    alert("������ο���н��");
    document.checkform.wage.focus();
    return false;
  }
  
 if(!isNum(document.checkform.wage.value)){
    alert("���������֣�");
    document.form1.wage.focus();
    return false;
  }
  
      if(document.checkform.year.value==""){
    alert("�����빤�����ޣ�");
    document.checkform.year.focus();
    return false;
  }
  
 if(!isNum(document.checkform.year.value)){
    alert("���������֣�");
    document.form1.year.focus();
    return false;
  }
  
  if(confirm('��ȷ��Ҫ�޸�ְλ��Ϣô��')){

 	 document.checkform.submit();
  }
}


</script>
    
	<%
	String jobID=request.getParameter("jobID");
    JobinfoTO to = new JobinfoTO();   
     to=helper.selectJobinfo(jobID);
	HashMap listjob = helper.getJobcomf();
	%>
</head>
<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�޸���Ƹ��Ϣ</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
<form id="form1" name="checkform" method="post" action="putjob.do?operation=putjob&sign=upjob">
<div id="contentborder" align="center">
 
<table border=0 cellspacing=0 cellpadding=0  class="small">
<input type="hidden" name="jobID" value="<%=jobID%>" />
   
    <tr>
      <td width="130">ְλ����</td>
      <td><input type="text" name="jobtitle" value="<%=to.getJobtitle()%>" /></td>
    </tr>
    <tr>
      <td>ְλ����</td>
      <td><%out.println(tb.getSelect("positiontype", listjob, helper.getJobcomf(to.getPositiontype()),to.getPositiontype()));%></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<tr>
      <td width="130">רҵҪ��</td>
      <td><%out.println(tb.getSelect("specialityID", helper.getSpecialitycomf(),null));%></td>
	</tr>
	<tr>
      <td>ѧ��Ҫ�� </td>
      <% int degree=to.getDegree(); %>
      <td><select name="degree" style="width: 100">
        <option  <% if(degree==1) out.print("selected"); %> value="1">����</option>
        <option <% if(degree==2) out.print("selected"); %> value="2">��ר</option>
        <option <% if(degree==3) out.print("selected"); %> value="3">����</option>
        <option <% if(degree==4) out.print("selected"); %> value="4">��ר</option>
        <option<% if(degree==5) out.print("selected"); %> value="5">����</option>
        <option <% if(degree==6) out.print("selected"); %> value="6">˶ʿ</option>
        <option <% if(degree==7) out.print("selected"); %> value="7">��ʿ</option>
        <option <% if(degree==0) out.print("selected"); %>>����</option>
                        </select></td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<tr>
      <td>��Ƹ����</td>
      <td><input type="text" name="num" value="<%=to.getNum()%>" /></td>
    </tr>
	
    <tr>
      <td>��Чʱ��</td>
      <td><input id="htEnd" name="starttime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)"  MAXDATE="$htEnd" 
							MAXDATE="2020-1-1"  value="<%=to.getStarttime()%>"/></td>
    </tr>
    <tr>
      <td>��ֹʱ��</td>
      <td><input id="htEnd" name="endtime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1"  value="<%=to.getEndtime()%>" /></td>
    </tr>
	 
	 <tr>
      <td>�ο���н</td>
      <td><% int wagekind=to.getWage();%>
      <select name="wage" style="width: 100">
					<option value="0" <%if(wagekind==0)out.print("selected"); %>>����</option>
					<option value="1"  <%if(wagekind==1)out.print("selected"); %>>1000����</option>
					<option value="2" <%if(wagekind==2)out.print("selected"); %>>1000��2000</option>
					<option value="3" <%if(wagekind==3)out.print("selected"); %>>2000��3000</option>
					<option value="4" <%if(wagekind==4)out.print("selected"); %>>3000��4000</option>
					<option value="5" <%if(wagekind==5)out.print("selected"); %>>4000��5000</option>
					<option value="6" <%if(wagekind==6)out.print("selected"); %>>5000��6000</option>
					<option value="7" <%if(wagekind==7)out.print("selected"); %>>6000��8000</option>
					<option value="8" <%if(wagekind==8)out.print("selected"); %>>8000��10000</option>
					<option value="9" <%if(wagekind==9)out.print("selected"); %>>12000��15000</option>
					<option value="10" <%if(wagekind==10)out.print("selected"); %>>15000��18000</option>
					<option value="11"  <%if(wagekind==11)out.print("selected"); %>>18000��25000</option>
					<option value="12" <%if(wagekind==12)out.print("selected"); %>>25000����</option>
					</select>Ԫ�����</td>
    </tr>
    <tr>
      <td width="130">��͹�������</td>
      <td><input type="text" name="year" size=4 value="<%=to.getYear() %>" />��</td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">	
	<tr>
      <td width="130">��������</td>
    
      
      <td>    
       <div id='address'
				style='position:absolute;width:400;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);'>
				<table id="MovOpTB  align=left border=0 cellSpacing=0
											cellPadding=0">
					<tr>
						<td class="slt">
							<strong class="norTit">��ѡ��ص�</strong>
							</td>
						<td>
							ʡ��
							<select name="province" id="country"
								onChange="change_region( &#13;&#10;       window.document.checkform.city , &#13;&#10;       window.document.checkform.country.options[selectedIndex].value );">
								<option value="no" selected="selected">
									��ѡ��
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
							����</td>
							
							<td><strong class="no Tit">ѡ�����</strong>
							</td>
							<td>
							</td>
							<td>
							</td>
							</tr>
							<tr>
							<td>
							<select id="city" name="city" size="12" multiple="true" style="width: 100;">
							<option value="no">ѡ�����</option>
							</select>
						</td>
						<td >
							<input type="button" value="���" onclick="Mv('city','cityB');" />
							<br />
							<br />
							<input type="button" value="ɾ��"
								onclick="Mvout('cityB','city');" />
							<br />
							<br />
							<input type=button value='ȷ��' name="industry"
								onclick="choseaddrss('cityB','address');">

							<br />
							<br />
							<input type=button value='�ر�' name="industry"
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
	  </tr>
	  <tr>
      <td >��������</td>
      
       <% int kind=to.getKind();  %>
      <td><select name="kind" style="width: 100">
        <option value="0" <% if(kind==0) out.print("selected"); %> >����</option>
        <option <% if(kind==1) out.print("selected"); %> value="1">ȫְ</option>
        <option <% if(kind==2) out.print("selected"); %> value="2">��ְ</option>
      </select></td>
    </tr>
    <tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0  class="small">	
    <tr>
      <td width="130"  valign="top">ְλҪ��</td>
      <td><textarea name="request" cols="50" rows="6"><%=to.getRequest()%></textarea></td>
    </tr>
    <tr>
      <td  valign="top">ְλ����</td>
      <td><textarea name="explain" cols="50" rows="6"><%=to.getExplain()%></textarea></td>
    </tr>
	<tr>
      <td  valign="top">����˵��</td>
      <td><textarea name="deal" cols="50" rows="6"><%=to.getDeal()%></textarea></td>
    </tr>
    <tr>
    <td>
    </td>
      <td >
          <input type="button" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit" value=" ���� " onclick="jscheckform()" />
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
 

 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>
