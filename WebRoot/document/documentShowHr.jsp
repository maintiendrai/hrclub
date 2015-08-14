<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>信息管理</title>
</head>

<body>
<%DocumentTO to = (DocumentTO)request.getAttribute("to");%>

<% Object hrID=session.getAttribute("hrID");
 %>
<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
		<table align="center" width="700">
			<tr>
				<td width="100" valign="top">
				<%if(null!=hrID){ %>
						<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
					<%} %>
				</td>
				<td width="558" valign="top">
				<table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">查看资料</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
			   
<form id="form" name="form" method="post" action="">
<div id="contentborder" align="center">
  
<table border=0 cellspacing=0 cellpadding=0  class="small">
    <tr>
      <td width="130">资料名称</td>
      <td><%=to.getDocumentname()%></td>
    </tr>
    <tr>
      <td width="130">上传者ID</td>
      <td><%=to.getNameID()%></td>
    </tr>
    <tr>
      <td>上传者类型</td>
      <td><%   switch (to.getKind())
               {
                  case 1:out.println("HR");break;
                  case 2:out.println("IT人才");break;
                  case 3:out.println("管理员");break;
               }%></td>
    </tr>
    <tr>
    <td>资料URL</td>
      <td><%=to.getUrl()%></td>
    </tr>
    <tr>
    <td>下载所需积分</td>
      <td><%   switch (to.getIntegral())
               {
                    case 5:out.println("5");break;
                    case 10:out.println("10");break;
                    case 15:out.println("15");break;
                    case 20:out.println("20");break;
                    case 25:out.println("25");break;
                    case 30:out.println("30");break;
               }%></td>
    </tr>
    <tr>
    <td>文件大小</td>
      <td><%=to.getSize()%></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>   
      <td colspan="2">
        
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

 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></di
</body>
<script>
function return1(){
    
	document.form.action="FrontController.do?operation=documentquery&method=showhr&pageNum=1";
	document.form.submit();
}
</script>
</html>
