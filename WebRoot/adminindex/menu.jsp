<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>

<head>
<script type="text/javascript" src="dtree.js"></script>
<link rel="styleSheet" href="dtree.css" type="text/css" />
<link rel="stylesheet" type="text/css" href="global.css">
</head>
<% String role = (String)session.getAttribute("adminrole");%>
<body>

<div id="contentborder">
	<hr style="HEIGHT: 2px;COLOR:#BED3DF">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="javascript: d.openAll();">功能展开</a> &nbsp;|&nbsp; <a href="javascript: d.closeAll();">功能折叠</a>
	<hr style="HEIGHT: 2px;COLOR:#BED3DF">
	<script type="text/javascript">
		d = new dTree('d');
		d.add(0,-1,'我的菜单');
		d.add(1,0,'邮件管理','','test','wndMain');
		d.add(2,0,'信息管理','','test','wndMain');
		d.add(3,0,'服务管理','','test','wndMain');
		d.add(4,0,'积分管理','','test','wndMain');
		d.add(5,0,'活动管理','','test','wndMain');
		d.add(6,0,'用户管理','','test','wndMain');
		d.add(7,0,'单位管理','','test','wndMain');
		d.add(8,0,'职位管理','','test','wndMain');
		d.add(9,0,'资料管理','','test','wndMain');
		d.add(10,0,'配置管理','','test','wndMain');
		d.add(11,10,'行业类型配置','callingcomf.do?operation=callingcomflist&pageNum=1','test','wndMain');
		d.add(12,10,'证书类型配置','certificatecomf.do?operation=certificatecomflist&pageNum=1','test','wndMain');
		d.add(13,10,'职位类型配置','jobcomf.do?operation=jobcomflist&pageNum=1','test','wndMain');
		d.add(14,10,'技能类型配置','skillcomf.do?operation=itskillcomflist&pageNum=1','test','wndMain');
		d.add(15,10,'专业类型配置','specialitycomf.do?operation=specialitycomflist&pageNum=1','test','wndMain');	
		d.add(16,1,'站内邮件','mail.do?operation=maillist&pageNum=1','test','wndMain');
		d.add(17,1,'站外邮件','../mail/mailoutside.jsp','test','wndMain');
		d.add(18,7,'合作单位管理','cooperateutil.do?operation=cooperateutillist&pageNum=1','test','wndMain');
		d.add(19,5,'活动管理','movement.do?operation=movementlist&pageNum=1','test','wndMain');
		d.add(20,6,'HR管理','HR.do?operation=showhr&pageNum=1','test','wndMain');
		d.add(21,6,'人才管理','IT.do?operation=showit&pageNum=1','test','wndMain');
<%if (role.equals("0")) {%>		
		d.add(22,6,'管理管理员','admininfo.do?operation=admininfolist&pageNum=1','test','wndMain');
<% }%>
		d.add(23,4,'HR积分管理','integral.do?operation=integrallist&pageNum=1','test','wndMain');
		d.add(24,2,'信息管理','message.do?operation=messagelist&pageNum=1','test','wndMain');
		d.add(25,3,'服务管理','serverorder.do?operation=serverorderlist&pageNum=1','test','wndMain');
		d.add(26,8,'职位搜索','../job/findjoball.jsp','test','wndMain');
		d.add(28,8,'招聘职位管理','job.do?operation=adminshowjob&pageNum=1','test','wndMain');
		d.add(29,9,'管理文件','document.do?operation=documentlist&pageNum=1','test','wndMain');
		d.add(30,5,'参与者管理','movementactor.do?operation=movementactorlist&pageNum=1','test','wndMain');
		d.add(31,6,'人才推荐','../hr/adminit.jsp','test','wndMain');
		d.add(32,8,'发布招聘职位','../job/putjoball.jsp','test','wndMain');
		d.add(33,6,'人才搜索','../it/adminfindit.jsp','test','wndMain');
		d.add(35,0,'退出系统','admininfo.do?operation=adminloginout','test','_top','image/file.gif');
		d.add(36,6,'修改个人密码','admininfo.do?operation=admininfoquery&method=editmima','test','wndMain');
		d.add(37,2,'广告管理','advert.do?operation=advertlist&pageNum=1','test','wndMain');
		d.add(38,6,'核心人才','admininfo.do?operation=coreit&pageNum=1','test','wndMain');
		d.add(39,6,'未审核HR','admininfo.do?operation=hrauditing&pageNum=1','test','wndMain');
		d.add(50,4,'IT人才积分管理','itintegral.do?operation=itintegrallist&pageNum=1','test','wndMain');
		document.write(d);
	</script>

</div>

</body>

</html>