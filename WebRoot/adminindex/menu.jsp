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
	<a href="javascript: d.openAll();">����չ��</a> &nbsp;|&nbsp; <a href="javascript: d.closeAll();">�����۵�</a>
	<hr style="HEIGHT: 2px;COLOR:#BED3DF">
	<script type="text/javascript">
		d = new dTree('d');
		d.add(0,-1,'�ҵĲ˵�');
		d.add(1,0,'�ʼ�����','','test','wndMain');
		d.add(2,0,'��Ϣ����','','test','wndMain');
		d.add(3,0,'�������','','test','wndMain');
		d.add(4,0,'���ֹ���','','test','wndMain');
		d.add(5,0,'�����','','test','wndMain');
		d.add(6,0,'�û�����','','test','wndMain');
		d.add(7,0,'��λ����','','test','wndMain');
		d.add(8,0,'ְλ����','','test','wndMain');
		d.add(9,0,'���Ϲ���','','test','wndMain');
		d.add(10,0,'���ù���','','test','wndMain');
		d.add(11,10,'��ҵ��������','callingcomf.do?operation=callingcomflist&pageNum=1','test','wndMain');
		d.add(12,10,'֤����������','certificatecomf.do?operation=certificatecomflist&pageNum=1','test','wndMain');
		d.add(13,10,'ְλ��������','jobcomf.do?operation=jobcomflist&pageNum=1','test','wndMain');
		d.add(14,10,'������������','skillcomf.do?operation=itskillcomflist&pageNum=1','test','wndMain');
		d.add(15,10,'רҵ��������','specialitycomf.do?operation=specialitycomflist&pageNum=1','test','wndMain');	
		d.add(16,1,'վ���ʼ�','mail.do?operation=maillist&pageNum=1','test','wndMain');
		d.add(17,1,'վ���ʼ�','../mail/mailoutside.jsp','test','wndMain');
		d.add(18,7,'������λ����','cooperateutil.do?operation=cooperateutillist&pageNum=1','test','wndMain');
		d.add(19,5,'�����','movement.do?operation=movementlist&pageNum=1','test','wndMain');
		d.add(20,6,'HR����','HR.do?operation=showhr&pageNum=1','test','wndMain');
		d.add(21,6,'�˲Ź���','IT.do?operation=showit&pageNum=1','test','wndMain');
<%if (role.equals("0")) {%>		
		d.add(22,6,'�������Ա','admininfo.do?operation=admininfolist&pageNum=1','test','wndMain');
<% }%>
		d.add(23,4,'HR���ֹ���','integral.do?operation=integrallist&pageNum=1','test','wndMain');
		d.add(24,2,'��Ϣ����','message.do?operation=messagelist&pageNum=1','test','wndMain');
		d.add(25,3,'�������','serverorder.do?operation=serverorderlist&pageNum=1','test','wndMain');
		d.add(26,8,'ְλ����','../job/findjoball.jsp','test','wndMain');
		d.add(28,8,'��Ƹְλ����','job.do?operation=adminshowjob&pageNum=1','test','wndMain');
		d.add(29,9,'�����ļ�','document.do?operation=documentlist&pageNum=1','test','wndMain');
		d.add(30,5,'�����߹���','movementactor.do?operation=movementactorlist&pageNum=1','test','wndMain');
		d.add(31,6,'�˲��Ƽ�','../hr/adminit.jsp','test','wndMain');
		d.add(32,8,'������Ƹְλ','../job/putjoball.jsp','test','wndMain');
		d.add(33,6,'�˲�����','../it/adminfindit.jsp','test','wndMain');
		d.add(35,0,'�˳�ϵͳ','admininfo.do?operation=adminloginout','test','_top','image/file.gif');
		d.add(36,6,'�޸ĸ�������','admininfo.do?operation=admininfoquery&method=editmima','test','wndMain');
		d.add(37,2,'������','advert.do?operation=advertlist&pageNum=1','test','wndMain');
		d.add(38,6,'�����˲�','admininfo.do?operation=coreit&pageNum=1','test','wndMain');
		d.add(39,6,'δ���HR','admininfo.do?operation=hrauditing&pageNum=1','test','wndMain');
		d.add(50,4,'IT�˲Ż��ֹ���','itintegral.do?operation=itintegrallist&pageNum=1','test','wndMain');
		document.write(d);
	</script>

</div>

</body>

</html>