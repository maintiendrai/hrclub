<%@ page language="java" import="java.util.*,com.hrclub.to.*;"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<script type="text/javascript"
	src='<%=request.getContextPath()%>/js/ParamUtil.js'></script>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<head>
	<script language="javascript" type="text/javascript"
			src="<%=request.getContextPath()%>/js/datepicker/WdatePicker.js"></script>
		<script src="<%=request.getContextPath()%>/js/country/change_region.js"></script>
		
		<script  src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
<script  src='<%=request.getContextPath()%>/js/encryption.js'> </script>
<script  src='<%=request.getContextPath()%>/js/basicinfo.js'> </script>
		
		
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/adminindex/table.css">
	<title>�˲Ź������</title>
</head>
<%
	Page mypage = (Page) request.getAttribute("mypage");
	List data = mypage.getData();
%>

<body>
	<form name="form1" method="post" action="itmanger.do">
		<div id="contentborder" align="center">
		<table align="left">
		<tr>
		<td>
			<table align="left">
			 <tr><td><br></td></tr>
			<tr>
				<td colspan="2" class="dvInnerHeader">
						<b>�˲��б�</b>
					</td>
					</tr>
					<tr><td><br></td></tr>
				<tr>
					<td>
						����
					</td>
					<td>
						<input type="text" name="name">
					</td>
					<td>
						״̬
					</td>
					<td>
						<select name="status">
						<option value="no" >��ѡ��</option>
						<option value="0" >����</option>
						<option value="1" >����</option>
						</select>
					</td>
				
				
					<td>
						����ʡ��
					</td>
					<td>
						<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.form1.city , &#13;&#10;       window.document.form1.country.options[selectedIndex].value );">
							<option selected="selected" value="no"> ��ѡ��</option>
							<script language="javascript">
        set_select_options( window.document.form1.country, country, "" ) ;
						</script>
						</select> 
					</td>
				
					<td>
						���ڳ���
					</td>
					<td>
						<select name="city"
							onChange="change_region( &#13;&#10;        window.document.form1.city , &#13;&#10;        window.document.form1.state.options[selectedIndex].value );">
						
						<option selected="selected" value="no"> ��ѡ��</option>
						</select>	
					</td>
				<td>
				<input type=button name="button" value="��ѯ"
											class="button" onclick="" />
				</td>
				</tr>
				 <tr><td><br></td></tr>
			</table>
		</td>
	</tr>
	<tr>
	<td>
			
			<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
	         
				<tr>
					<td width="49">
						ѡ��
					</td>
					<td width="143">
						IT�˲��˺�
					</td>
					<td width="109">
						IT�˲�״̬
					</td>
					<td width="109">
						�Ƿ�����˲�
					</td>
					<td width="152">
						�鿴��Ϣ
					</td>
				</tr>
				<%
					Iterator it = data.iterator();

					while (it.hasNext()) {
						ITUserTO u = (ITUserTO) it.next();
				%>

				<tr>

					<td>
						<input type="checkbox" name="userid" value=<%=u.getUserid()%>>
					</td>
					<td>
						<%=u.getUserid()%>
					</td>
					<td>
						<%
								int status = u.getStatus();
								if (status == 0)
									out.println("����");
								if (status == 1)
									out.println("�Ѷ���");
						%>
					</td>
					<td>
						<%
								int core = u.getCore();
								if (core == 0)
									out.println("��");
								if (core == 1)
									out.println("��");
						%>
					</td>
					<td>
						<input type="hidden" name="useridh" value=<%=u.getUserid()%>��>
						<a
							href="it/itbaseinfo.do?operation=itbaseinfo&sign=sign&userid=<%=u.getUserid()%>">�鿴��Ϣ</a>
					</td>
				</tr>
				<%
				}
				%>

				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<%
					if (mypage.getPageCount() == 0) {
					%>
					<td colspan=6 align="center">
						��ǰû�м�¼
					</td>
					<%
					} else {
					%>
					<td colspan=6 align="center">
						��
						<%=mypage.getPageNum()%>
						/
						<%=mypage.getPageCount()%>
						ҳ ��
						<%=mypage.getRecordNum()%>
						����¼
						<%
					if (mypage.getPageNum() == 1) {
					%>
						��ҳ&nbsp;&nbsp; ��ҳ&nbsp;&nbsp;
						<%
						} else {
						%>
						<a
							href='showit.do?operation=showit&pageNum=1&pageLength=<%=mypage.getPageLength()%>'>��ҳ</a>&nbsp;&nbsp;
						<a
							href='showit.do?operation=showit&pageNum=<%=mypage.getPageNum() - 1%>&pageLength=<%=mypage.getPageLength()%>'>��ҳ</a>&nbsp;&nbsp;
						<%
						}
						%>

						<%
						if (mypage.getPageNum() == mypage.getPageCount()) {
						%>
						��ҳ&nbsp;&nbsp; ĩҳ&nbsp;&nbsp;
						<%
						} else {
						%>
						<a
							href='showit.do?operation=showit&pageNum=<%=mypage.getPageNum() + 1%>&pageLength=<%=mypage.getPageLength()%>'>��ҳ</a>&nbsp;&nbsp;
						<a
							href='showit.do?operation=showit&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>ĩҳ</a>
						<%
							}
							}
						%>
					</td>
				</tr>
				<tr>
					<td>
						<br>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<input type=button value=" ���� " class="button"
							onClick="stopstate()" />
						<input type=button value=" ���� " class="button"
							onClick="startstate()" />
						<input type=button value="���Ŀ���" class="button"
							onClick="changecore()" />
						<input type=button value="���Ĺر�" class="button" onClick="offcore()" />
					</td>
				</tr>
			</table>
			</td>
			</tr>
	</form>
	<script>
function stopstate(){
	if(!isChecked(document.form1.userid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=stop";
	document.form1.submit();
}
function startstate(){
	if(!isChecked(document.form1.userid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=open";
	document.form1.submit();
}
function changecore(){
	if(!isChecked(document.form1.userid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=tocore";
	document.form1.submit();
}
function offcore(){
	if(!isChecked(document.form1.userid)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=offcore";
	document.form1.submit();
}

function find(){
	if(!isChecked(document.form1.name)){
		alert("��ѡ��Ҫ�޸ĵ���Ϣ��");
		return false;
	}
	document.form1.action="FrontController.do?operation=stopstate&sign=offcore";
	document.form1.submit();
}
</script>
</body>


