<%@ page language="java" import="java.util.*,com.hrclub.to.JobinfoTO" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    	<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
		<script src='<%=request.getContextPath()%>/js/encryption.js'> </script>
    
    <title>�޸�ְλ��Ϣ</title>
    
	<%
	JobinfoTO to=(JobinfoTO)request.getAttribute("to");
	
	%>

  </head>
<body>
  <table width="502" height="451" border="0">
    <tr>
      <td width="158">�޸���Ƹ��Ϣ</td>
     
    </tr>
    <tr>
      <td width="158">ְλ����</td>
      <td width="334"><%= to.getPositiontype()
						%>     </td>
    </tr>
	 <tr>
      <td width="158">רҵҪ��</td>
      <td width="334"><%=to.getSpecialityID()
						%>   </td>
	 </tr>
    <tr>
      <td width="158">ְλ����</td>
      <td width="334"><%=to.getJobtitle() %></td>
    </tr>
	<tr>
      <td>ѧ��Ҫ�� </td>
      <td><%=to.getDegree()%></td>
    </tr>
	<tr>
      <td width="158">ְλҪ��</td>
      <td width="334"> <%=to.getRequest() %></td>
    </tr>
    <tr>
      <td width="158">ְλ����</td>
      <td width="334"><%=to.getExplain() %></td>
    </tr>
	<tr>
      <td width="158">����˵��</td>
      <td width="334"><%=to.getDeal() %></td>
    </tr>
	<tr>
      <td width="158">��Ƹ����</td>
      <td width="334"><%=to.getNum() %></td>
    </tr>
	
    <tr>
      <td>��Чʱ��</td>
      <td>  <%=to.getStarttime()%></td>
    </tr>
    <tr>
      <td>��ֹʱ��</td>
      <td>  <%=to.getEndtime() %> </td>
    </tr>
	 
	 <tr>
      <td width="158">�ο���н</td>
      <td width="334"> <%=to.getWage()%> </td>
    </tr>
	<tr>
      <td>����ʡ��</td>
      <td><%=to.getProvince() %></td>
    </tr>
    <tr>
      <td>��������</td>
      <td><%=to.getCity() %></td>
    </tr>
	<tr>
      <td>��������</td>
      <td><% int kind=to.getKind();
       if(kind==0) out.print("����");
        if(kind==1) out.print("ȫְ");
        
         if(kind==2) out.print("��ְ"); %>
    </tr>
	 <tr>
      <td width="158">��͹�������</td>
      <td width="334"><%=to.getYear() %></td>
    </tr>
    <tr>
      <td colspan="2"><input type="reset" name="reset" value=" ���� " class="button" onclick="history.back();">
    </tr>
  </table>

</body>
</html>
