<%@ page language="java" pageEncoding="GBK"
	contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		<script type="text/javascript" src="../js/ParamUtil.js"></script>
		<link href="<%=request.getContextPath()%>/css/index.css"
			rel="stylesheet" type="text/css" />
		

		<title>资料管理</title>
	</head>
	<body>
		<%
			Object hrID = session.getAttribute("hrID");
			Page mypage = (Page) request.getAttribute("mypage");
			String nameIDs = (String) request.getAttribute("nameIDs");
			String kinds = (String) request.getAttribute("kinds");
			List data = mypage.getData();
			IntegralTO to = (IntegralTO)request.getAttribute("to");
		%>
		  <%   String msgerror=(String)request.getAttribute("msgerror");
                                       if(null!=msgerror){
                                      out.print(tb.getalert(msgerror));
                                      } %>
		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/top.js"></script>
		</div>
		<form name="form" action="" method=post>
			<table align="center" width="700">
				<tr>
					<td width="80" valign="top">
						<%
						if (null != hrID) {
						%>
						<iframe height="550" frameborder="0" scrolling="no"
							src="<%=request.getContextPath()%>/hrforntop.jsp"></iframe>
						<%
						}
						%>

					</td>
					<td width="100%" valign="top">
					<table border="0" align="center" width=100%>
						<tr>
							<td height="60" valign="middle" class="top01">
								<table  border="0" cellpadding="0" cellspacing="0">
									<tr>
										<td height="36" valign="top" class="titile">
											资料列表
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td class="text">
								<table  border="0">

									<tr>
										<td width="80">
											上传者ID
										</td>
										<td width="110">
											<input type="text" name="nameIDs" style="width:100px" />
										</td>
										<td width="90">
											上传者类型
										</td>
										<td width="90">
											<select name="kinds">
												<option value="">
													请选择
												</option>
												<option value="1">
													HR
												</option>
												<option value="3">
													管理员
												</option>
											</select>
										</td>
										<td>
											<input type="button" value=" 查询 " class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" 
												onclick="search()">
										</td>
									<tr>
										<td>
											您当前所剩积分为<%=to.getNum()%>
											<input type="hidden" name="totlenum" value="<%=to.getNum()%>">
										</td>
									</tr>
									</tr>
								</table>
								<table border=0 cellspacing=0 cellpadding=0 
									class="small">
									<tr>
									
										<td width="175">
											<b>资料名称</b>
										</td>
										<td width="75">
											<b>上传者ID</b>
										</td>
										<td width="100">
											<b>上传者类型</b>
										</td>
										<td width="75">
											<b>消耗积分</b>
										</td>
										<td width="75">
											<b>文件大小</b>
										</td>
										<td width="50">
											<b>下载</b>
										</td>

									</tr>
									<%
										Iterator it = data.iterator();

										while (it.hasNext()) {
											DocumentTO u = (DocumentTO) it.next();
									%>
									<tr>
									
										<td>
											<li><a
												href="FrontController.do?operation=documentquery&method=showone&documentID=<%=u.getDocumentID()%>"><%=u.getDocumentname()%>
											</a>
										</td>
										<td>
											<%=u.getNameID()%>
										</td>
										<td>
											<%
													switch (u.getKind()) {
													case 1:
														out.println("HR");
														break;
													case 2:
														out.println("IT人才");
														break;
													case 3:
														out.println("管理员");
														break;
													}
											%>
										</td>
										<td>
											<%
													switch (u.getIntegral()) {
													case 5:
														out.println("5");
														break;
													case 10:
														out.println("10");
														break;
													case 15:
														out.println("15");
														break;
													case 20:
														out.println("20");
														break;
													case 25:
														out.println("25");
														break;
													case 30:
														out.println("30");
														break;
													}
											%>
										</td>
										<td>
											<%=u.getSize()%>
											KB
										</td>
										<td>
											<a
												href="FrontController.do?operation=documentdown&url=<%=u.getUrl()%>&totlenum=<%=to.getNum()%>&num=<%=u.getIntegral()%>">下载</a>
										</td>
									</tr>
									<tr> <td colspan="8"><hr></td></tr>
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
											当前没有记录
										</td>
										<%
										} else {
										%>
										<td colspan=6 align="center">
											第
											<%=mypage.getPageNum()%>
											/
											<%=mypage.getPageCount()%>
											页 共
											<%=mypage.getRecordNum()%>
											条记录
											<%
										if (mypage.getPageNum() == 1) {
										%>
											首页&nbsp;&nbsp; 上页&nbsp;&nbsp;
											<%
											} else {
											%>
											<a
												href='documentList.do?operation=documentlisthrall&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=1&pageLength=<%=mypage.getPageLength()%>'>首页</a>&nbsp;&nbsp;
											<a
												href='documentList.do?operation=documentlisthrall&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum() - 1%>&pageLength=<%=mypage.getPageLength()%>'>上页</a>&nbsp;&nbsp;
											<%
											}
											%>



											<%
											if (mypage.getPageNum() == mypage.getPageCount()) {
											%>
											下页&nbsp;&nbsp; 末页&nbsp;&nbsp;
											<%
											} else {
											%>
											<a
												href='documentList.do?operation=documentlisthrall&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageNum() + 1%>&pageLength=<%=mypage.getPageLength()%>'>下页</a>&nbsp;&nbsp;
											<a
												href='documentList.do?operation=documentlisthrall&nameIDs=<%=nameIDs%>&kinds=<%=kinds%>&pageNum=<%=mypage.getPageCount()%>&pageLength=<%=mypage.getPageLength()%>'>末页</a>
											<%
												}
												}
											%>

										</td>
									</tr>
								</table>
						<tr>
							<td>
								<img src="<%=request.getContextPath()%>/images/main_3.gif"
									width="558" height="36" alt="" />
							</td>
						</tr>
					</table>
		

		</form>
		</td>
		</tr>

		</table>


		<div align="center">
			<script language="javascript" type="text/javascript"
				src="<%=request.getContextPath()%>/js/down.js"></script>
		</div>
		<script>
function add(){
	document.form.action="FrontController.do?operation=documentadd&method=addItem";
	document.form.submit();
}
function edit(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要修改的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=edit";
	document.form.submit();
}
function show(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要查看的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentquery&method=show";
	document.form.submit();
}
function showhr(){
	
	document.form.action="FrontController.do?operation=documentquery&method=showhr&pageNum=1";
	document.form.submit();
}
function del(){
	if(!isChecked(document.form.documentID)){
		alert("请选择要删除的信息！");
		return false;
	}
	document.form.action="FrontController.do?operation=documentdelete&method=delall";
	document.form.submit();
}
function search(){

	document.form.action="document.do?operation=documentlisthrall&pageNum=1";                     
	document.form.submit();
}
</script>
	</body>
</html>
