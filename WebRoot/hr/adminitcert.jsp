<%@ page language="java"
	import="java.util.*,com.hrclub.to.CertificateTO" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	  <script src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>

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
function tocert(){
	window.location.href='adminitlang.jsp';
}

 </script>

<script type="text/javascript">


function change()
{
   var kind = document.checkform.kind.value;

   
	var map;
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

		<title>��ʾ֤����Ϣ</title>

	</head>
	<body>
		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
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
						<b>֤����Ϣ</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>

  
		<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	<tr>
					<td  colspan="2">
						��������֤����Ϣ 	��һ�����������Ϣ		</td>
				 
				</tr>
			<%
				String userid = (String) session.getAttribute("useridc");
				List listc = new ArrayList();
				listc = helper.getCertificate(userid);
				HashMap list = helper.getCertificateComf();
			%>
			<tr>
				<td >
					֤������				</td>
				<td >
					
						֤������
					
			  </td>
				<td>
					֤�����				</td>
				<td>
					�ɼ�				</td>
				
			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>
			
			<tr>
				<td>
					
					
							<%int kind=((CertificateTO) listc.get(i)).getKind();
						if(kind==1)out.print("�����");
						if(kind==2)out.print("����");
						if(kind==3)out.print("����");
						if(kind==4)out.print("ְ��");
						if(kind==0)out.print("����");
						%>
					
					
				</td>
				<td>
					
						<%=list.get(Integer.parseInt(((CertificateTO) listc
								.get(i)).getCrertname()))%>
					
				</td>
				<td>
					
						<%=((CertificateTO) listc.get(i)).getNumber()%>
					
				</td>
				<td>
					
						<%=((CertificateTO) listc.get(i)).getGrade()%>
					
					
				</td>
				
			</tr>


			<%
			}
			%>

	</table>
		<form  name="checkform" method="post"
			action="commenditcert.do?operation=commenditcert">
			<table align="left" >
			<tr>
					<td colspan="2">
					  <div align="center">���֤��			</div></td>
				</tr>
				<tr>
					<td>
						֤������					</td>
					<td>
						<select name="kind" onchange="change()">
							<option selected="selected" value="no" >
								��ѡ��
							</option>
							<option value="1">
								�����
							<option value="2">
								����							</option>
							<option value="3">
								����							</option>
							<option value="4">
								ְ��							</option>
							<option value="0">
								����							</option>
						</select>					</td>
				</tr>
				<tr>
					<td>
						֤������					</td>
					<td style="display:;" id="chose">
						<select name="choses">
							<option selected="selected" value="no">
								��ѡ��
							</option>

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
						֤����					</td>
					<td>
						<input type="text" name="number" />					</td>
				</tr>
				<tr>
					<td>
						�ɼ�					</td>
					<td>
						<input type="text" name="grade" />					</td>
				</tr>
				<tr><td>
					<input type=button  value="�ύ֤��" onclick="jscheckform()" class="button" />
				<input type=button name="Submit" value="��һ��"
					onClick="tocert()"  class="button"/></td>
				</tr>
		  </table>

			

		</form>
	
	</body>
</html>
