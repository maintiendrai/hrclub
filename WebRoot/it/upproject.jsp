<%@ page language="java" import="com.hrclub.to.ProjectTO,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
	<html>

<head>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
	<title>�༭������������</title>
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
  if(confirm('��ȷ��Ҫ�޸���Ŀ��Ϣ')){
 	 document.checkform.submit();
  }
}

 </script>
</head>
<%	HashMap list= helper.getJobcomf();

String projectIDs = request.getParameter("projectID");
	
	int projectID=Integer.parseInt(projectIDs);

	ProjectTO to=new ProjectTO();
	to = helper.getProjectTO(projectID);
%>
<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	 <table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>

   </td><td width="558"  valign="top">
    <table  align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">��Ŀ�༭</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  height="192" border="0" align="center">
   
<form  name="checkform" method="post" action="upproject.do">
  <table align="center" >
    <tr>
      <td >��Ŀ����</td>
      <td ><input type="text" name="projectname" value="<%=to.getProjectname() %>" /></td>
    </tr>
    <tr>
      <td>��ʼʱ��</td>
      <td><input id="htStart" name="starttime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MAXDATE="$htEnd" value="<%=to.getStarttime() %>" /></td>
    </tr>
    <tr>
      <td>���ʱ��</td>
      <td><input id="htEnd" name="endtime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1" value="<%=to.getEndtime()%>" /></td>
    </tr>
	 <tr>
      <td >Ӳ������</td>
      <td ><input type="text" name="hardware" value="<%=to.getHardware()%>" /></td>
    </tr>
	 <tr>
      <td >�������</td>
      <td ><input type="text" name="software" value="<%=to.getSoftware() %>" /></td>
    </tr>
	 <tr>
      <td>��Ŀ��ģ</td>
      <td><input type="text" name="projectsize" value="<%=to.getProjectsize() %>" /></td>
    </tr>
	 <tr>
      <td>����ְλ</td>
      <td><% out.println(tb.getSelect("place",list,helper.getJobcomf(to.getPlace()),to.getPlace())); %>
      </td>
	 </tr>
    <tr>
      <td>��Ŀ���</td>
      <td><textarea name="projectinfo" cols="50" rows="10" ><%=to.getProjectinfo()%></textarea></td>
    </tr>
    <tr>
    <td>
    </td>
      <td>
        <input type="hidden" name="projectID" value="<%=projectID %>" />
        <input type="hidden" name="operation" value="upproject" />
           <input type=button name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="�ύ��Ŀ����" onClick="jscheckform();"/>
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
