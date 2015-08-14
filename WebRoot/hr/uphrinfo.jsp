<%@ page language="java"  import="com.hrclub.to.*,java.util.*" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	
	
     <script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>
<title>添加HR详细信息</title>
</head>
<%  HashMap listcall = helper.getCallingcomf();
    HRinfoTO to=(HRinfoTO)request.getAttribute("to");
%>
<body>
	<div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/top.js"></script></div>
	<table align="center" width="700">
   <tr>
   <td width="100"  valign="top"><iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table   border="0" align="center">
			 <tr>
        <td height="60" valign="middle" class="top01" ><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">信息编辑</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table   border="0" align="center">
<form  name="form1" method="post" action="hraddinfo.do?operation=hraddinfo" >
 
   <table  height="192" border="0">
    <tr>
      <td width="102">真实姓名</td>
      <td width="231"><input type="text" name="name" value="<%=to.getName()%>" /></td>
    </tr>
    <tr>
					<td>
						性&nbsp;&nbsp;&nbsp;&nbsp;别
					</td>
					<td>
						<% int sex=to.getSex(); %>
							<input type="radio" name="sex" value="male" <%if(sex==0) out.print("checked");%> >
							男
						
							<input type="radio" name="sex" value="woman" <%if(sex==1) out.print("checked");%>>
							女
						
					</td>
	</tr>
    <tr>
					<td>
						出生日期
					</td>
					<td>
						<input type="text" name="born" class="Wdate"
							onfocus="new WdatePicker(this)" value="<%=to.getBorn() %>" />
					</td>
	</tr>
				
    <tr>
					<td>
						所在省份
					</td>
					<td>
						<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.form1.city , &#13;&#10;       window.document.form1.country.options[selectedIndex].value );">
							<option selected="selected" value=<%=to.getProvince() %>> <%=helper.getProvince(to.getProvince())	%></option>
							<script language="javascript">
        set_select_options( window.document.form1.country, country, "" ) ;
						</script>
						</select>
					</td>
	</tr>
				<tr>
					<td>
						所在城市
					</td>
					<td>
						<select name="city"
							onChange="change_region( &#13;&#10;        window.document.form1.city , &#13;&#10;        window.document.form1.state.options[selectedIndex].value );">
						<option selected="selected" value=<%=to.getCity() %>> <%=helper.getCity(to.getProvince(),to.getCity())%></option>
							
						</select>
					</td>
				</tr>
	<tr>
      <td>行&nbsp;&nbsp;&nbsp;&nbsp;业</td>
      <td><%
						out.println(tb.getSelect("calling", listcall, helper.getCallingcomf(to.getCalling()),String.valueOf(to.getCalling())));
						%></td>
    </tr>
    <tr>
      <td>联系地址</td>
      <td><input type="text" name="address" value="<%=to.getAddress() %>" /></td>
    </tr>
   
    <tr>
      <td>固定电话</td>
      <td><input type="text" name="telephone" value="<%=to.getTelephone() %>" /></td>
    </tr>
    <tr>
      <td>移动电话</td>
      <td><input type="text" name="mobilephone" value="<%=to.getMobilephone() %>" /></td>
    </tr>
    <tr>
      <td>邮件</td>
      <td><input type="text" name="email" value="<%=to.getEmail() %>" /></td>
    </tr>
    <tr>
      <td>公司名称</td>
      <td><input type="text" name="corporation" value="<%=to.getCorporation() %>" /></td>
	</tr>
	<tr>
      <td >公司性质</td>
      <td >
      <select name="corpkind">
       <% int kind=to.getCorpkind(); %>
        <option <% if(kind==1) out.print("select");%> value="1">国有企业</option>
        <option <% if(kind==2) out.print("select");%> value="2">私营企业</option>
        <option <% if(kind==3) out.print("select");%> value="3">外资独资企业</option>
        <option <% if(kind==4) out.print("select");%> value="4">中外合资企业</option>
        <option <% if(kind==0) out.print("select");%> value="0">其他</option>
      </select> </td>
    </tr>
	<tr>
      <td>公司网站</td>
      <td><input type="text" name="website" value="<%=to.getWebsite() %>" /></td>
    </tr>
    <tr>
      <td valign="top">公司简介</td>
      <td><textarea name="corinfo" cols="50" rows="10"><%=to.getCorinfo() %></textarea></td>
	</tr>
    <tr>
      <td colspan="2" align="left">
        <input type="submit" name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
        value=" 提 交 " />
        <input type="reset" name="Submit2" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'"
         value=" 重 置 " /> 
      </td>
    </tr>
    
  </table>
  	<tr>
        <td><img src="/hrclub/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
 </form></td>
</tr>
</table>
 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
</body>
</html>
