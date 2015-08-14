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
    
    <title>修改职位信息</title>
    
	<%
	JobinfoTO to=(JobinfoTO)request.getAttribute("to");
	
	%>

  </head>
<body>
  <table width="502" height="451" border="0">
    <tr>
      <td width="158">修改招聘信息</td>
     
    </tr>
    <tr>
      <td width="158">职位类型</td>
      <td width="334"><%= to.getPositiontype()
						%>     </td>
    </tr>
	 <tr>
      <td width="158">专业要求</td>
      <td width="334"><%=to.getSpecialityID()
						%>   </td>
	 </tr>
    <tr>
      <td width="158">职位标题</td>
      <td width="334"><%=to.getJobtitle() %></td>
    </tr>
	<tr>
      <td>学历要求 </td>
      <td><%=to.getDegree()%></td>
    </tr>
	<tr>
      <td width="158">职位要求</td>
      <td width="334"> <%=to.getRequest() %></td>
    </tr>
    <tr>
      <td width="158">职位描述</td>
      <td width="334"><%=to.getExplain() %></td>
    </tr>
	<tr>
      <td width="158">待遇说明</td>
      <td width="334"><%=to.getDeal() %></td>
    </tr>
	<tr>
      <td width="158">招聘人数</td>
      <td width="334"><%=to.getNum() %></td>
    </tr>
	
    <tr>
      <td>生效时间</td>
      <td>  <%=to.getStarttime()%></td>
    </tr>
    <tr>
      <td>截止时间</td>
      <td>  <%=to.getEndtime() %> </td>
    </tr>
	 
	 <tr>
      <td width="158">参考月薪</td>
      <td width="334"> <%=to.getWage()%> </td>
    </tr>
	<tr>
      <td>工作省份</td>
      <td><%=to.getProvince() %></td>
    </tr>
    <tr>
      <td>工作城市</td>
      <td><%=to.getCity() %></td>
    </tr>
	<tr>
      <td>工作类型</td>
      <td><% int kind=to.getKind();
       if(kind==0) out.print("不限");
        if(kind==1) out.print("全职");
        
         if(kind==2) out.print("兼职"); %>
    </tr>
	 <tr>
      <td width="158">最低工作年限</td>
      <td width="334"><%=to.getYear() %></td>
    </tr>
    <tr>
      <td colspan="2"><input type="reset" name="reset" value=" 返回 " class="button" onclick="history.back();">
    </tr>
  </table>

</body>
</html>
