<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
		<%
String url = request.getContextPath();
%>
	<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
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
  if(document.checkform.place.value=="no"){
    alert("��ѡ��ְλ��");
    document.checkform.place.focus();
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

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	 <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
   </td><td width="558" valign="top">
		<form name="checkform" method="post" action="addproject.do">
			<table align="center" >
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">�����Ŀ����</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
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
						out.println(tb.getSelect("place", list, "��ѡ��","no"));
						%>
					</td>
				</tr>
				<tr>
					<td>
						��Ŀ���
					</td>
					<td>
						<textarea name="projectinfo" cols="50" rows="10"></textarea>
					</td>
				</tr>
				<tr><td></td>
					<td  >
						<input type="hidden" name="operation" value="addproject" />

						<input type=button name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="�ύ��Ŀ��Ϣ"  onClick="jscheckform();">
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
