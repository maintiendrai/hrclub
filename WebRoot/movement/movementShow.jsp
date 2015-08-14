<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ParamUtil.js"></script>
	<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

<title>活动管理</title>
<script>
function add(){
    if(document.getElementById('form').revID.value=="null")
    {
       alert("请选登陆!");
       return false;
    }
	document.form.action="FrontController.do?operation=movementactoradd&method=add";
	document.form.submit();
}

function return1(){
    
	document.form.action="FrontController.do?operation=movementlistlimt&pageNum=1";
	document.form.submit();
}
</script>
</head>

<body>

	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
 <%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
<%
    MovementTO to = (MovementTO)request.getAttribute("to");
    Object userid = session.getAttribute("userid");
    Object hrID = session.getAttribute("hrID");
    String revID=null;
    String revkind=null;
                                   
	if (null !=userid) {
		revID=session.getAttribute("userid").toString();
		revkind="2";
	}
	if (null !=hrID) {
		revID=session.getAttribute("hrID").toString();
		revkind="1";
	}

%>

  <table align="center" width="700">
   <tr>
   <td width="100" valign="top">
    <% if (null !=userid){ %>
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
     <%}else if(null!=hrID){ %><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe><%} %>
   </td><td width="558" valign="top">
   <table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">活动查看</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
<form id="form" name="form" method="post" action="">
<input type="hidden" name="status"  value="<%=to.getStatus()%>"/>
<input type="hidden" name="moveID"  value="<%=to.getMoveID()%>"/>
<div id="contentborder" align="center">

<table border=0 cellspacing=0 cellpadding=0  class="small">
    <tr>
      <td  width="130">活动主题</td>
      <td><%=to.getSubject()%></td>
    </tr>
    <tr>
      <td>活动所需积分数</td>
      <td><% switch (to.getIntegral())
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
      <td>活动开始时间</td>
      <td><%=to.getStarttime()%></td>
    </tr>
    <tr>
      <td>活动结束时间</td>
      <td><%=to.getEndtime()%></td>
    </tr>
    <tr>
      <td>活动状态</td>
      <td><% switch (to.getStatus())
             {
                    case 0:out.println("报名中");break;
                    case 1:out.println("已停止");break;
                    case 2:out.println("已删除");break;
              }%></td>
    </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0  class="small">  
    <tr>
      <td  width="130">活动内容</td>
      <td><%=to.getContext()%></td>
    </tr>
</table>
<table border=0 cellspacing=0 cellpadding=0  class="small">    
    <tr><td><br></td></tr>
	<tr>
      <td >
        <input type=button  value=" 报名 " onclick="add()" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
        <input type=button value=" 返回 " onclick="history.back();" onClick="itlogin()" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" />
        <input type="hidden" name="revID" id="revID" value="<%=revID%>">
        <input type="hidden" name="revkind" value="<%=revkind%>">
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
