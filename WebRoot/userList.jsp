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
			n1.setName("��ҳ");
			n1.setUrl("indexMain.jsp");
			Navigator n2 = new Navigator();
			n2.setName("�û��б�");
			n2.setUrl("qy.act?operation=userlist");
			n1.setNext(n2);
%>

<body topmargin=0 leftmargin=0>
	<%@include file="Common.jsp"%>
		<table valign=top align=center width=870 cellSpacing=0 cellPadding=1
			border=0>

			<tr>
				<!-- ��1�У�����ҳ��logo������ -->
				<td>
					<%@include file="title.html"%>

				</td>
			</tr>
			<tr>
				<!-- ���������� -->
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
					�û��ʺţ�<input type=text name="likeuserID" value="">
					�û����ƣ�<input type=text name="userName" value="">
					�û�״̬��
					<select name="status">
						<option value="1">����</option>
						<option value="0">ͣ��</option>
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
					<input type=submit value="��ѯ">
					</td>
				</tr>
			</table>
			</form>
		</td>
	</tr>
	<tr>
		<td><%tb.buildTitle("�û��б�");
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
				tempList.add("�û��ʺ�");
				sortList.add("String");
				tempList.add("�û�����");
				sortList.add("String"); 
				
				tempList.add("�û�����");
				sortList.add("Number");
				tempList.add("���ֵȼ�");
				sortList.add("String");
				tempList.add("ʡ��");
				sortList.add("String");
				tempList.add("����");
				sortList.add("String");
				 
				tempList.add("״̬");
				sortList.add("String");
				tempList.add("��������");
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
					tempList.add((obj.getType()==1)?"����":"��˾");
					tempList.add("<a href='qy.act?operation=userlevel&userID="+obj.getUserid()+"'>���ֵȼ�</a>");
					tempList.add(obj.getProvName());
					tempList.add(obj.getCityName());
					
					 
					int s=obj.getStatus();
					String temp= (s==1) ?"ͣ��":"����";
					int newstatus= (s==1)?0:1;
					tempList.add("<input type=button value='"+temp+"' onclick=\"javascript:if(confirm('ȷ��"+temp+"���û�"+obj.getUserid()+"��')){window.location.href='qy.act?operation=useredit&action=updateStatus&status="+newstatus+"&userID="+obj.getUserid()+"';}\">");
					tempList.add("<input type=button value='��������' onclick=\"javascript:if(confirm('ȷ��������û�"+obj.getUserid()+"������ô��')){window.location.href='resetPassword.jsp?accountID="+obj.getUserid()+"&accountType="+Command.USER+"';}\">");


					data = (String[]) tempList.toArray(new String[0]);
					datalist.add(data);
				}
				tb.buildBody(datalist);
				tb.buildFoot(thispage, prop);
				
			} else {
				tb.buildErrorBody("Zero record found: û�з��������Ĳ�ѯ���");

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
				<!-- ��4�У���Ȩ��ע�� -->
				<td>
					<%@include file="foot.html"%>
				</td>
			</tr>
		</table>
	</body>
 
</html>
 
 