<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
		<%
	String path = request.getContextPath();
	%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
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
						<b>��������</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>

		<form  name="checkform" method="post" action="commenditwork.do">
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
				<tr>
					<td  colspan="2">
						����д��������	 <a href="<%=path%>/hr/adminitpro.jsp">��һ�������Ŀ</a>	</td>
				 
				</tr>
				<tr>
					<td width="130">
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
					<td>
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
						out.println(tb.getSelect("place", list, null));
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
						<textarea name="info" rows="10" cols="40"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>
							<div align="left">
								<input type="hidden" name="operation" value="commenditwork" class="button" />
								<input type=button name="Submit" value="���ӹ�������" onClick="jscheckform();" class="button" />
							</div>
						</label>
					</td>
				</tr>
			</table>
		</form>
	
	</body>
</html>
