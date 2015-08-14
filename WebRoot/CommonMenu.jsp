<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%> 
<link rel="StyleSheet" href="css/dtree.css" type="text/css" />
<script type="text/javascript" src="js/dtree.js"></script>
 
<table width=170 cellSpacing=0 cellPadding=0 border=1	borderColorDark=#ffffff borderColorLight=#999999 >
				<tr>
					<td>
						<table width=100% cellSpacing=1 cellPadding=2 border=0 >
<tr  ><td  background='image/cb_blue.gif'>  欢迎您！ </td></tr>
<tr><td >
<div class="dtree"> 
	<a href="javascript: d.openAll();">展开</a> | 
	<a href="javascript: d.closeAll();">收起</a> <br>
	<script type="text/javascript">
		<!--
		d = new dTree('d');
		d.add(0,-1,'我的菜单');
		
		d.add(1,0,'工作区首页','workMain.jsp','test','_self'); 
		d.add(11,0,'系统公告','qy.act?operation=notice','test','_self'); 
		
		d.add(3,0,'专家机构信息','','test','_self');
		d.add(4,3,'基本信息','qy.act?operation=expertinfo&editType=1','test','_self');
		d.add(5,3,'专业信息','qy.act?operation=expertinfo&editType=2','test','_self'); 
		d.add(7,3,'修改密码','changePassword.jsp','test','_self'); 
		d.add(8,3,'修改头像图片','uploadImg2.jsp','test','_self');  
		
		d.add(10,0,'消息管理','','test','_self');
		
		d.add(12,10,'发送离线消息','sendMessage.jsp','test','_self');
		d.add(13,10,'我收到的消息','qy.act?operation=listmessage&direction=false','test','_self');
		d.add(14,10,'我发送的消息','qy.act?operation=listmessage&direction=true','test','_self');
		
		d.add(15,0,'培训课程','','test','_self');
		d.add(16,15,'添加新的培训课程','qy.act?operation=trainingdetail&action=add','test','_self');
		d.add(17,15,'我的培训课程','qy.act?operation=traininglist','test','_self'); 
		 
		
		d.add(25,0, '行业作品','','test','_self');
		d.add(26,25,'添加新的作品','qy.act?operation=workdetail&action=add','test','_self');
		d.add(27,25,'我提供的作品','qy.act?operation=worklist','test','_self');
		 
		
		d.add(35,0,'委托管理','','test','_self');   
		 
		d.add(44,0,'我的收入帐单','qy.act?operation=outbilllist','','_self');
		
		d.add(45,0,'建议或投诉','sendSysMessage.jsp','','_self','');
		d.add(46,0,'帮助信息','help.jsp','','_self','');
		d.add(47,0,'联系网站管理员','mailto:qunyingnet@gmail.com','','_self','');
			
		d.add(48,0,'退出系统','qy.act?operation=logout','','_top','image/trash.gif');
		document.write(d);
		 
		 
		//-->
	</script> 
</div>

</td></tr> 
</table>
</td>
				</tr>
			</table>
 
   
 