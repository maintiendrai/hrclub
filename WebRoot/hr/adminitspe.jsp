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
		<title>��ʾרҵ��Ϣ</title>

	</head>

	<script> 
function jscheckform(){


 if(document.checkform.namekey.value==""){
    alert("������������ƣ�");
    document.checkform.namekey.focus();
    return false;
  }

  if(document.checkform.school.value==""){
    alert("�������ҵѧУ��");
    document.checkform.school.focus();
    return false;
  }
    if(document.checkform.specialityID.value=="no"){
    alert("��ѡ������רҵ��");
    document.checkform.specialityID.focus();
    return false;
  }
   if(document.checkform.byjobh.value=="no"){
    alert("��ѡ������ְλ��");
    document.checkform.byjobh.focus();
    return false;
  }
  if(document.checkform.byaddressh.value=="no"){
    alert("��ѡ���������ص㣡");
    document.checkform.byaddressh.focus();
    return false;
  }
    if(document.checkform.educate.value==""){
    alert("������������");
    document.checkform.educate.focus();
    return false;
  } 
  if(document.checkform.hortation.value==""){
    alert("�����뽱�������");
    document.checkform.hortation.focus();
    return false;
  }
  if(document.checkform.train.value==""){
    alert("��������ѵ�������");
    document.checkform.train.focus();
    return false;
  } 

  if(document.checkform.selfvalue.value==""){
    alert("����������������Ϣ");
    document.checkform.selfvalue.focus();
    return false;
  } 
  
  if(confirm('��ȷ��Ҫ�ύ��Ϣô��')){
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
						<b>�Ƽ�IT�˲�</b>
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
								����дרҵ��Ϣ ��һ����д��������
							</td>

						</tr>

						<tr>
							<td width="130">
								��������
							</td>

							<td>
								<input type="text" name="namekey" value="" style="width:156"/>
							</td>
						</tr>


						<tr>
							<td>
								ѧ��
							</td>
							<td>
								<select name="degree">
									<option value="1">
										����
									</option>
									<option value="2">
										��ר
									</option>
									<option value="3">
										����
									</option>
									<option value="4">
										��ר
									</option>
									<option selected="selected" value="5">
										����
									</option>
									<option value="6">
										˶ʿ
									</option>
									<option value="7">
										��ʿ
									</option>
									<option value="0">
										����
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								��ҵԺУ
							</td>
							<td>
								<input type="text" name="school" value="" style="width:156"/>
							</td>
						</tr>
						<tr>
							<td>
								����רҵ
							</td>
							<td>
									<%
									out.println(tb.getSelect("specialityID",
									helper.getSpecialitycomf(), "��ѡ��","no"));
						%>
							</td>
						</tr>
						<tr>
							<td>
								����ְλ
							</td>
							<td>
								<input type="hidden" name="pageNum" value="1" />
								<input type="hidden" name="byjobh" value="no" />
								<input type="text" style="width:156px;height:23px;" name="byjob"
									value="ѡ������ְλ" onClick="javascript:showdiv('jobdiv')"
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
												ѡ��ְλ����
											</td>
										</tr>
										<tr>
											<td colspan��2 align=left>

												<table>
													<tr>
														<td class="slt">
															<strong class="norTit">ְλ����</strong>
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
															<input type="button" class="BtnA2w" name="" value="���"
																onclick="Mv('SltAddrA','SltAddrB');" />
															<br />
															<br />
															<input type="button" class="BtnB2w" name="" value="�Ƴ�"
																onclick="Mvout('SltAddrB','SltAddrA');" />
															<br />
															<br />
															<input type=button value='ȷ��' name="industry"
																onclick="choseend('SltAddrB','jobdiv');">

															<br />
															<br />
															<input type=button value='�ر�' name="industry"
																onclick="hidedivSimple('jobdiv');">
														</td>

														<td class="slt">
															<strong class="norTit">ѡ��ְλ</strong>
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
												����
											</td>

											<td>
												<strong class="no Tit">ѡ�����</strong>
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
														ѡ�����
													</option>
												</select>
											</td>
											<td class="btn">
												<input type="button" value="���"
													onclick="Mv('city','cityB');" />
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
												<select id="cityB" name="" size="12" multiple="true"
													style="width: 100;">
												</select>
											</td>
										</tr>

									</table>
								</div>
								�������ص�
							</td>

							<td>
								<input type=hidden name="isshow" value="0">
								<input type="hidden" name="byaddressh" value="no" />
								<input type="text" style="width:156px;height:23px;"
									name="byaddress" value="�������ص�"
									onClick="javascript:showdiv('address')" readonly="readonly" />
							</td>
						</tr>
						<tr>
							<td>
								��������
							</td>
							<td>
								<select name="bykind">
									<option selected="selected" value="10">
										��ѡ��
									</option>
									<option value="0">
										����
									</option>
									<option value="1">
										ȫְ
									</option>
									<option value="2">
										��ְ
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								Ԥ��нˮ
							</td>
							<td>
								<select name="wage">
					<option value="13">��ѡ��</option>
					<option value="0">����</option>
					<option value="1">1000����</option>
					<option value="2">1000��2000</option>
					<option value="3">2000��3000</option>
					<option value="4">3000��4000</option>
					<option value="5">4000��5000</option>
					<option value="6">5000��6000</option>
					<option value="7">6000��8000</option>
					<option value="8">8000��10000</option>
					<option value="9">12000��15000</option>
					<option value="10">15000��18000</option>
					<option value="11">18000��25000</option>
					<option value="12">25000����</option>
					</select>
						Ԫ�����
							</td>
						</tr>
						<tr>
							<td>
								��������
							</td>
							<td>
								<select name="workyear">
									<option selected="selected" value="0">
										��ѡ��
									</option>
									<option value="1">
										��Уѧ��
									</option>
									<option value="2">
										һ������
									</option>
									<option value="3">
										һ������
									</option>
									<option value="4">
										��������
									</option>
									<option value="5">
										��������
									</option>
									<option value="6">
										��������
									</option>
								</select>
							</td>
						</tr>



						<tr>
							<td>
								��������
							</td>
							<td>
								<textarea name="educate" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								����
							</td>
							<td>
								<textarea name="hortation" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								��ѵ����
							</td>
							<td colspan="2">
								<textarea name="train" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr>
							<td>
								��������
							</td>
							<td colspan="2">
								<textarea name="selfvalue" value="" cols="50" rows="3"></textarea>
							</td>
						</tr>
						<tr><td><br></td></tr>
						<tr>
							<td colspan="2">
								<div align="left">

									<input type=button name="Submit" value="�ύ��Ϣ" class="button"
										onClick="jscheckform();" />
									<input type="reset" name="Submit2" value=" ���� " class="button"/>
								</div>
							</td>
						</tr>

					</table>
				</form>

			</table>
		</div>
	</body>
</html>
