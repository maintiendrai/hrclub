<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
	<%
	String path = request.getContextPath();
	%>
 <link rel="stylesheet" type="text/css" href="../adminindex/table.css">
		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	

		<title>�����Ŀ����</title>

<script> 
function jscheckform(){

  if(document.checkform.projectname.value==""){
    alert("��������Ŀ���ƣ�");
    document.checkform.projectname.focus();
    return false;
  }
  if(document.checkform.starttime.value==""){
    alert("��ѡ����Ŀ��ʼʱ�䣡");
    document.checkform.starttime.focus();
    return false;
  }
  if(document.checkform.endtime.value==""){
    alert("��ѡ����Ŀ����ʱ�䣡");
    document.checkform.endtime.focus();
    return false;
  }
  
   if(document.checkform.hardware.value==""){
    alert("������Ӳ��������");
    document.checkform.hardware.focus();
    return false;
  }
  if(document.checkform.software.value==""){
    alert("���������������");
    document.checkform.software.focus();
    return false;
  }

   if(!isNum(document.checkform.projectsize.value)){
    alert("����������");
    document.checkform.age.focus();
    return false;
  } 
  if(confirm('��ȷ��Ҫ�ύ��Ŀ��Ϣ')){
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
						<b>��Ŀ����</b>
					</td>
					<td colspan="4" align="right" class="dvInnerHeader">
						&nbsp;
					</td>
				</tr>
				<tr><td><br></td></tr>
			</table>

		<form name="checkform" method="post" action="addproject.do">
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
			<tr>
					<td  colspan="2">
						����д��Ŀ����	    <a href="<%=path%>/hr/adminitskill.jsp">��һ�����IT����</a>	</td>
				 
				</tr>
				<tr>
					<td>
						��Ŀ����
					</td>
					<td >
						<input type="text" name="projectname" />
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
						���ʱ��
					</td>
					<td>
						<input id="htEnd" name="endtime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1" />
					
					</td>
				</tr>
				<tr>
					<td >
						Ӳ������
					</td>
					<td >
						<input type="text" name="hardware" />
					</td>
				</tr>
				<tr>
					<td >
						�������
					</td>
					<td >
						<input type="text" name="software" />
					</td>
				</tr>
				<tr>
					<td >
						��Ŀ��ģ
					</td>
					<td >
						<input type="text" name="projectsize" /> ��/��
					</td>
				</tr>
				<tr>
					<td >
						����ְλ
					</td>
					<td >
						<%
						out.println(tb.getSelect("place", list, null));
						%>
					</td>
				</tr>
				<tr>
					<td>
						��Ŀ���
					</td>
					<td>
						<textarea name="projectinfo" cols="50" rows="3"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="operation" value="commenditpro"  class="button"/>

						<input type=button name="Submit" value="�ύ"  onClick="jscheckform();" class="button">
					</td>
				</tr>
			</table>
		</form>

	</body>
</html>
