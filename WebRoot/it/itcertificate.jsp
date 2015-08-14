<%@ page language="java"
	import="java.util.*,com.hrclub.to.CertificateTO" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
<% String url=request.getContextPath(); %>		
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	  <script src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>

		<title>添加证书信息</title>

<script> 
function jscheckform(){

  if(document.checkform.kind.value=="no"){
    alert("请选择证书！");
    document.checkform.kind.focus();
    return false;
  }
  
   if(document.checkform.number.value==""){
    alert("请输入证书编号！");
    document.checkform.number.focus();
    return false;
  }
   if(document.checkform.grade.value==""){
    alert("请输入成绩！");
    document.checkform.grade.focus();
    return false;
  }

   if(!IsNumber(document.checkform.grade.value)){
    alert("请输入成绩不合法");
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
		<title>显示证书信息</title>

	</head>
		<%String userid = (String) session.getAttribute("userid");
				
				if(null==userid) {
	
	response.sendRedirect("../it/itlogin.jsp");

   }else{ %>
	<body>

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
</div>
	 	<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	 <table align="center" width="800">
   <tr>
   <td width="100" valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td><td width="558"  valign="top">
		<table  align="center">
					 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">证书信息</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
			<%
				
				List listc = new ArrayList();
				listc = helper.getCertificate(userid);
				HashMap list = helper.getCertificateComf();
			%>
			<tr class="titlename">
				<td width="10%" >
					类型				</td>
				<td width="35%">
					
						证书名称
					
			  </td>
				<td width="15%">
					证书编码				</td>
				<td width="10%">
					成绩				</td>
				<td width="10%">
					修改			</td>
				<td width="10%">
					删除			</td>
			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>
			
			<tr >
				<td class="small">
					
						<%int kind=((CertificateTO) listc.get(i)).getKind();
						if(kind==1)out.print("计算机");
						if(kind==2)out.print("外语");
						if(kind==3)out.print("管理");
						if(kind==4)out.print("职称");
						if(kind==0)out.print("其他");
						%>
					
				</td>
				<td class="small">
					
						<%=list.get(new Integer(((CertificateTO) listc
								.get(i)).getCrertname()))%>
					
				</td>
				<td class="small">
					
						<%=((CertificateTO) listc.get(i)).getNumber()%>
					
				</td>
				<td class="small">
					
						<%=((CertificateTO) listc.get(i)).getGrade()%>
						<input type="hidden" name="operation2" value="delcert" />
						<input type="hidden" name=certificateID&quot;2
							value=<%=((CertificateTO) listc.get(i)).getCertificateID()%> />
					
				</td>
				<td class="small">
					<a
						href="upcert.jsp?certificateID=<%=((CertificateTO) listc.get(i)).getCertificateID()%>">
						修改 </a>
				</td>
				<td class="small">
					<a
						href="FrontController.do?operation=delcert&certificateID=<%=((CertificateTO) listc.get(i)).getCertificateID()%>">
						删除 </a>
				</td>
			</tr>


			<%
			}
			%>

	</table>
						  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
	</table>
		
		<form  name="checkform" method="post"
			action="addcert.do?operation=addcert">
			<table align="center" width="400">
		
					 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">添加证书</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table width="500"  border="0" align="center">
		
				<tr>
					<td width="100">
						证书类型					</td>
					<td  width="300">
						<select name="kind" onchange="change()">
							<option selected="selected" value="no" >
								请选择
							</option>
							<option value="1">
								计算机
							<option value="2">
								外语							</option>
							<option value="3">
								管理							</option>
							<option value="4">
								职称							</option>
							<option value="0">
								其他							</option>
						</select>					</td>
				</tr>
				<tr>
					<td>
						证书名称					</td>
					<td style="display:;" id="chose">
						<select name="choses">
							<option selected="selected" value="no">
								请选择
							</option>

						</select>
					</td>
					<td style="display:none;" id="oneid">
						<%
									out.println(tb.getSelect("crertnameone", helper.getCertListComf(1),
									"请选择",""));
						%>
					</td>
					<td style="display:none;" id="twoid">
						<%
									out.println(tb.getSelect("crertnametwo", helper.getCertListComf(2),
									"请选择",""));
						%>
					</td>
					<td style="display:none;" id="threeid">
						<%
									out.println(tb.getSelect("crertnamethree", helper.getCertListComf(3),
									"请选择",""));
						%>
					</td>
					<td style="display:none;" id="fourid">
						<%
									out.println(tb.getSelect("crertnamefour", helper.getCertListComf(4),
									"请选择",""));
						%>
					</td>
					<td style="display:none;" id="zeroid">
						<%
									out.println(tb.getSelect("crertnamezero", helper.getCertListComf(0),
									"请选择",""));
						%>
					</td>
				</tr>
				<tr>
					<td>
						证书编号					</td>
					<td>
						<input type="text" name="number" />					</td>
				</tr>
				<tr>
					<td>
						成&nbsp;&nbsp;&nbsp;&nbsp;绩					</td>
					<td>
						<input type="text" name="grade" />					</td>
				</tr>
				<tr>
				<td>
				</td>
					<td >
						<input type=button class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="提交证书" onclick="jscheckform()" />	</td>
				</tr>	  </table>
									  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
		  </table>



		</form>
		</td>
		</tr>
		
		</table>
		
		<%} %>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
	
</html>
