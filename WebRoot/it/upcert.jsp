<%@ page language="java"
	import="java.util.*,com.hrclub.to.CertificateTO" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
		<title>�޸�֤����Ϣ</title>

	</head>
	<script> 
function jscheckform(){

  if(document.checkform.kind.value=="no"){
    alert("��ѡ��֤�飡");
    document.checkform.kind.focus();
    return false;
  }
   if(document.checkform.number.value==""){
    alert("������֤���ţ�");
    document.checkform.number.focus();
    return false;
  }
   if(document.checkform.grade.value==""){
    alert("������ɼ���");
    document.checkform.grade.focus();
    return false;
  }

   if(!IsNumber(document.checkform.grade.value)){
    alert("������ɼ����Ϸ�");
    document.checkform.age.focus();
    return false;
  } 
  
 	 document.checkform.submit();
}

 </script>
	<script type="text/javascript">


function change()
{
   var kind = document.checkform.kind.value;
   document.checkform.cert.value="";
 // alert(document.checkform.cert.value);
	if(kind==1){
	document.getElementById('chose').style.display="none";
	document.getElementById('threeid').style.display="none";
     	document.getElementById('fourid').style.display="none";
   		document.getElementById('zeroid').style.display="none";
        document.getElementById('twoid').style.display="none";
	document.getElementById('oneid').style.display="";
   }
   	if(kind==2){
   	    document.getElementById('chose').style.display="none";
   	 	document.getElementById('oneid').style.display="none";	
   		document.getElementById('threeid').style.display="none";
     	document.getElementById('fourid').style.display="none";
   		document.getElementById('zeroid').style.display="none";
        document.getElementById('twoid').style.display="";
  }
   	if(kind==3){
   		document.getElementById('chose').style.display="none";
   			document.getElementById('fourid').style.display="none";
   		document.getElementById('zeroid').style.display="none";
        document.getElementById('twoid').style.display="none";
	document.getElementById('oneid').style.display="none";
  document.getElementById('threeid').style.display="";
  }
   	if(kind==4){
   		document.getElementById('chose').style.display="none";
   			document.getElementById('zeroid').style.display="none";
        document.getElementById('twoid').style.display="none";
	document.getElementById('oneid').style.display="none";
  document.getElementById('threeid').style.display="none";
  document.getElementById('fourid').style.display="";}
   	if(kind==0){
   		document.getElementById('chose').style.display="none";
   	  document.getElementById('twoid').style.display="none";
	document.getElementById('oneid').style.display="none";
  document.getElementById('threeid').style.display="none";
  document.getElementById('fourid').style.display="none";
  document.getElementById('zeroid').style.display="";}

if(kind=="no"){
document.getElementById('chose').style.display="";
   	  document.getElementById('twoid').style.display="none";
	document.getElementById('oneid').style.display="none";
  document.getElementById('threeid').style.display="none";
  document.getElementById('fourid').style.display="none";
  document.getElementById('zeroid').style.display="none";
}
 
}

</script>
	<%
		String certificateIDs = request.getParameter("certificateID");
		int certificateID = Integer.parseInt(certificateIDs);
	
		CertificateTO certTO = new CertificateTO();
		certTO = helper.getCertificate(certificateID);
	%>
	<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
		
		 	<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

				</td>
				<td width="558" valign="top">
				<table  align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">֤��༭</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  height="192" border="0" align="center">
					<form name="checkform" method="post"
						action="upcert.do?operation=upcert">
						<table align="center" width="400">
							<tr>
								<td width="100">
									֤������
								</td>
								<td width="300">
									<select name="kind" onchange="change()">
										<%
										int i = certTO.getKind();
										%>

										<option <%if(i==1)out.print("selected"); %> value="1">
											�����
										<option <%if(i==2)out.print("selected"); %> value="2">
											����
										</option>
										<option <%if(i==3)out.print("selected"); %> value="3">
											����
										</option>
										<option <%if(i==4)out.print("selected"); %> value="4">
											ְ��
										</option>
										<option <%if(i==0)out.print("selected"); %> value="0">
											����
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									֤������
								</td>
								<td style="display:;" id="chose">

									<select id="cert" name="cert">
										<%
										HashMap map = helper.getCertListComf(i);
										%>
										<%
											Iterator itjob = map.keySet().iterator();
											while (itjob.hasNext()) {
												Object key = itjob.next();
										%>
										<option value=<%=key.toString()%>
											<% if(key.toString().equals(certTO
				     .getCrertname())) {out.print("selected");}%>>
											<%=map.get(key).toString()%>
										</option>
										<%
										}
										%>
									</select>

								</td>
								<td style="display:none;" id="oneid">
									<%
												out.println(tb.getSelect("crertnameone", helper.getCertListComf(1),
												"��ѡ��",""));
									%>
								</td>
								<td style="display:none;" id="twoid">
									<%
												out.println(tb.getSelect("crertnametwo", helper.getCertListComf(2),
												"��ѡ��",""));
									%>
								</td>
								<td style="display:none;" id="threeid">
									<%
												out.println(tb.getSelect("crertnamethree", helper.getCertListComf(3),
												"��ѡ��",""));
									%>
								</td>
								<td style="display:none;" id="fourid">
									<%
												out.println(tb.getSelect("crertnamefour", helper.getCertListComf(4),
												"��ѡ��",""));
									%>
								</td>
								<td style="display:none;" id="zeroid">
									<%
												out.println(tb.getSelect("crertnamezero", helper.getCertListComf(0),
												"��ѡ��",""));
									%>
								</td>
							</tr>
							<tr>
								<td>
									֤����
								</td>
								<td>
									<input type="text" name="number"
										value="<%=certTO.getNumber()%>" />
								</td>
							</tr>
							<tr>
								<td>
									��&nbsp;&nbsp;&nbsp;&nbsp;��
								</td>
								<td>
									<input type="text" name="grade" value="<%=certTO.getGrade()%>" />
								</td>
							</tr>
							<tr>
							<td></td>
								<td>
									<input type="hidden" name="certificateID"
										value="<%=certificateID%>" />
									<input type="submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" name="Submit" value="�ύ֤��" />
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
