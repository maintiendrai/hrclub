<%@ page language="java"
	import="java.util.*,com.hrclub.to.*,com.hrclub.model.*,com.hrclub.view.Navigator"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet" type="text/css">

</head> 
<% 
			Properties prop = new Properties();
			prop.setProperty("operation", request.getParameter("operation"));
			
			String userID = request.getParameter("likeuserID");
			if(userID!=null){
				prop.setProperty("likeuserID", userID);
			}
			String userName= request.getParameter("userName");
			if(userName!=null){
				prop.setProperty("userName", userName);
			}
			String status= request.getParameter("status"); 
			if(status!=null){
				prop.setProperty("status", status);
			}else{
				status="-1";
			}
			
			Page thispage = (Page) request.getAttribute("page");

			Navigator n1 = new Navigator();
			n1.setName("首页");
			n1.setUrl("indexMain.jsp");
			Navigator n2 = new Navigator();
			n2.setName("用户列表");
			n2.setUrl("qy.act?operation=userlist");
			n1.setNext(n2);
%>

<body topmargin=0 leftmargin=0>
	<%@include file="Common.jsp"%>
		<table valign=top align=center width=870 cellSpacing=0 cellPadding=1
			border=0>

			<tr>
				<!-- 第1行：标题页：logo和索引 -->
				<td>
					<%@include file="title.html"%>

				</td>
			</tr>
			<tr>
				<!-- 工作区主体 -->
				<td>
				
				<table width=100%>
					<tr>
						<td  valign=top> 
							<%@include file="CommonMenu.jsp"%>
						</td>
						<td valign=top>
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
	 
	<tr>
		<td>
			<form name="searchuser" action="qy.do?operation=userlist" method=post>
			<table>
				<tr>
					<td>
					用户帐号：<input type=text name="likeuserID" value="">
					用户名称：<input type=text name="userName" value="">
					用户状态：
					<select name="status">
						<option value="1">正常</option>
						<option value="0">停用</option>
					</select>
					<script>
			 
			    	for(var i=0;i<document.searchuser.status.length;i++)
			  		{
			   	     	if(document.searchuser.status.options[i].value==<%=status%>)
			         	{
			            	document.searchuser.status.options[i].selected=true;
			            	break;
			        	}
			    	}
					</script>
					<input type=submit value="查询">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td><%tb.buildTitle("用户列表");
			tb.setTableBorder(1);
			tb.setTitleColor("#eff7ff");
			tb.setRowcolor1("#CCDAE3");
			tb.setRowcolor2("#DFE8EE");

			// tb.setToExcel(true);
			if (thispage.getPageCount() > 0) {
				List objList = (List) thispage.getData();
				//tb.setSelectEnabled(true);
			    //tb.setSelectIdName("userID");
				String[] heads = null;
				ArrayList tempList = new ArrayList();
				ArrayList sortList = new ArrayList();
				tempList.add("用户帐号");
				sortList.add("String");
				tempList.add("用户名称");
				sortList.add("String"); 
				
				tempList.add("用户类型");
				sortList.add("Number");
				tempList.add("积分等级");
				sortList.add("String");
				tempList.add("省份");
				sortList.add("String");
				tempList.add("城市");
				sortList.add("String");
				 
				tempList.add("状态");
				sortList.add("String");
				tempList.add("重设密码");
				sortList.add("String");
				
				heads = (String[]) tempList.toArray(new String[0]);
				String[] sortTypes = (String[]) sortList.toArray(new String[0]);
				tb.setSortable(true, "js/sortabletable.js", sortTypes);

				tb.buildHead(heads);
				ArrayList datalist = new ArrayList();
				Iterator it = objList.iterator();

				while (it.hasNext()) {
					tempList = new ArrayList();
					UserTO obj = (UserTO) it.next();
					String[] data = null;
					tempList.add(null);

					tempList.add("<a href='qy.act?operation=userdetail&action=update&userID="+obj.getUserid()+"'>"+obj.getUserid()+"</a>");
					tempList.add(obj.getUsername());  
					tempList.add((obj.getType()==1)?"个人":"公司");
					tempList.add("<a href='qy.act?operation=userlevel&userID="+obj.getUserid()+"'>积分等级</a>");
					tempList.add(obj.getProvName());
					tempList.add(obj.getCityName());
					
					 
					int s=obj.getStatus();
					String temp= (s==1) ?"停用":"启用";
					int newstatus= (s==1)?0:1;
					tempList.add("<input type=button value='"+temp+"' onclick=\"javascript:if(confirm('确定"+temp+"该用户"+obj.getUserid()+"？')){window.location.href='qy.act?operation=useredit&action=updateStatus&status="+newstatus+"&userID="+obj.getUserid()+"';}\">");
					tempList.add("<input type=button value='重设密码' onclick=\"javascript:if(confirm('确定重设该用户"+obj.getUserid()+"的密码么？')){window.location.href='resetPassword.jsp?accountID="+obj.getUserid()+"&accountType="+Command.USER+"';}\">");


					data = (String[]) tempList.toArray(new String[0]);
					datalist.add(data);
				}
				tb.buildBody(datalist);
				tb.buildFoot(thispage, prop);
				
			} else {
				tb.buildErrorBody("Zero record found: 没有符合条件的查询结果");

			}
			out.print(tb.getTable());

		%></td>
	</tr>
</table>
						</td>
					</tr>
				</table>
				
				
				</td>
			</tr>

			<tr>
				<!-- 第4行：版权等注脚 -->
				<td>
					<%@include file="foot.html"%>
				</td>
			</tr>
		</table>
	</body>
 
</html>
 
 