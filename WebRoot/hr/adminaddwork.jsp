<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
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
		<jsp:include page="../fromtop.jsp" flush="true" />
  <table align="center" width="700">
   <tr>
   <td width="100" valign="top"><jsp:include page="../itforntop.jsp" flush="true" />
   </td><td width="600">
		<form  name="checkform" method="post" action="addwork.do">
			<table width="600" align="center">
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
						<textarea name="info" cols="50" rows="3">></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<label>
							<div align="center">
								<input type="hidden" name="operation" value="addwork" />
								<input type=button name="Submit" value="���ӹ�������" onClick="jscheckform();" />
							</div>
						</label>
					</td>
				</tr>
			</table>
		</form>
		</td>
		</tr>
		</table>
	</body>
</html>
