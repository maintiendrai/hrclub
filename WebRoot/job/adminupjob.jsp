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
  
    if(document.checkform.wage.value==""){
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
		<td colspan="2"  class="dvInnerHeader"><b>�޸���Ƹ��Ϣ</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<input type="hidden" name="jobID" value="<%=to.getJobID()%>" />
   
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
      <td><select name="degree">
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
      <td><input type="text" name="num" value="<%=to.getNum()%>" size="4" />��</td>
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
      <td><input type="text" name="wage" value="<%=to.getWage()%>" size="6"  />Ԫ�����
    </tr>
    <tr>
      <td width="130">��͹�������</td>
      <td><input type="text" name="year" value="<%=to.getYear() %>" size="4" />��</td>
    </tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">	
	<tr>
      <td width="130">��������</td>
      <td width="100">    
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
						<td class="btn">
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
	  
      <td width="130">��������</td>
      
       <% int kind=to.getKind(); %>
      <td><select name="kind">
        <option value="0" <% if(kind==0) out.print("selected"); %> >����</option>
        <option <% if(kind==1) out.print("selected"); %> value="1">ȫְ</option>
        <option <% if(kind==2) out.print("selected"); %> value="2">��ְ</option>
      </select></td>
    </tr>
    <tr><td><br></td></tr>
</table> 
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">	
    <tr>
      <td width="130">ְλҪ��</td>
      <td><textarea name="request" cols="50" rows="3"><%=to.getRequest()%></textarea></td>
    </tr>
    <tr>
      <td>ְλ����</td>
      <td><textarea name="explain" cols="50" rows="3"><%=to.getExplain()%></textarea></td>
    </tr>
	<tr>
      <td>����˵��</td>
      <td><textarea name="deal" cols="50" rows="3"><%=to.getDeal()%></textarea></td>
    </tr>
    <tr>
      <td colspan="2">
          <input type="button" class="button" name="Submit" value=" ���� " onclick="jscheckform()" />
      </td>
    </tr>
</table>
</form>

</body>
</html>
