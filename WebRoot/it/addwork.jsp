<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<%
String url = request.getContextPath();
%>	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	
		<title>��ӹ�������</title>
<script> 
function jscheckform(){

  if(document.checkform.address.value==""){
    alert("�����빤���ص㣡");
    document.checkform.address.focus();
    return false;
  }
 
  
  if(document.checkform.compname.value==""){
    alert("���������ڹ�˾���ƣ�");
    document.checkform.compname.focus();
    return false;
  }
  if(document.checkform.starttime.value==""){
    alert("�뿪ʼʱ�䣡");
    document.checkform.starttime.focus();
    return false;
  }
  if(document.checkform.levertime.value==""){
    alert("���뿪ʱ�䣡");
    document.checkform.levertime.focus();
    return false;
  }
  
    if(document.checkform.place.value=="no"){
    alert("��ѡ��ְλ��");
    document.checkform.place.focus();
    return false;
  }
  if(confirm('��ȷ��Ҫ����������Ϣ')){
 	
 	 document.checkform.submit();
  }
}

 </script>

	</head>

	<%
	HashMap list = helper.getJobcomf();
	%>
	<body>
		
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>

  <table align="center" width="700">
   <tr>
   <td width="100" valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td><td width="558" valign="top">
		<form  name="checkform" method="post" action="addwork.do">
			<table align="center">
					 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��ӹ�������</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
				<tr>
					<td >
						�����ص�
					</td>
					<td >
						<input type="text" name="address" />
					</td>
				</tr>
				<tr>
					<td >
						���ڹ�˾����
					</td>
					<td >
						<input type="text" name="compname" />
					</td>
				</tr>
				<tr>
					<td>
						���ڹ�˾����
					</td>
					<td>
						<select name="comkind">
							<option selected="selected" value="1">
								������ҵ
							</option>
							<option value="2">
								˽Ӫ��ҵ
							</option>
							<option value="3">
								���ʶ�����ҵ
							</option>
							<option value="4">
								���������ҵ
							</option>
							<option value="0">
								����
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						����ְλ
					</td>
					<td>
						<%
						out.println(tb.getSelect("place", list, "��ѡ��","no"));
						%>

					</td>
				</tr>
				<tr>
					<td>
						��ʼʱ��
					</td>
					<td>
						<input id="htStart" name="starttime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MAXDATE="$htEnd" />
					</td>
				</tr>
				<tr>
					<td>
						��ְʱ��
					</td>
					<td>
						<input id="htEnd" name="levertime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1" />
					</td>
				</tr>
				<tr>
					<td>
						�������
					</td>
					<td>
						<textarea name="info" rows="10" cols="50"></textarea>
					</td>
				</tr>
				<tr>
				<td>
				</td>
					<td>
					
						
								<input type="hidden" name="operation" value="addwork" />
								<input type=button name="Submit" value="���ӹ�������"class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" onClick="jscheckform();" />
						
					</td>
				</tr>
			</table>
			
				  <tr>
        <td><img src="<%=url %>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
      	</table>
		</form>
		</td>
		</tr>
		</table>
		

 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
