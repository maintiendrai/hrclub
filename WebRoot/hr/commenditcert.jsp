<%@ page language="java"
	import="java.util.*,com.hrclub.to.CertificateTO" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	  <script src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>

	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	


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
function tocert(){
	window.location.href='commenditlang.jsp';
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
	<body>
	
		<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
		<% Object hr=session.getAttribute("hrID"); %>
	<%if(null!=hr){ %>

		<%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
					<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">证书信息</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
   <%} %>
		<table>
	<tr>
					<td  colspan="2">
						请添加添加证书信息 	下一步添加外语信息		</td>
				 
				</tr>
			<%
				String userid = (String) session.getAttribute("useridc");
				List listc = new ArrayList();
				listc = helper.getCertificate(userid);
				HashMap list = helper.getCertificateComf();
			%>
			<tr>
				<td >
					证书类型				</td>
				<td >
					
						证书名称
					
			  </td>
				<td>
					证书编码				</td>
				<td>
					成绩				</td>
				
			</tr>
			<%
			for (int i = 0; i < listc.size(); i++) {
			%>
			
			<tr>
				<td>
					
							<%int kind=((CertificateTO) listc.get(i)).getKind();
						if(kind==1)out.print("计算机");
						if(kind==2)out.print("外语");
						if(kind==3)out.print("管理");
						if(kind==4)out.print("职称");
						if(kind==0)out.print("其他");
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
		<tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
	</table>
		<form  name="checkform" method="post"
			action="commenditcert.do?operation=commenditcert">
			<table width="558"  border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">	添加证书	</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
			   
		<tr>
					<td>
						证书类型					</td>
					<td>
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
						成绩					</td>
					<td>
						<input type="text" name="grade" />					</td>
				</tr>
				<tr><td>	<input type=button  value="提交证书" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onclick="jscheckform()" />
				<input type=button name="Submit"  class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="下一步"
					onClick="tocert()" />
				
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
		</td>
		</tr>
		</table>
		
		 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
