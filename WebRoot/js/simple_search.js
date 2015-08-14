
function buildDiv(){
	var argArr = buildDiv.arguments;
	var htmlDiv = '';
	var text = '';

	for(var i=0;i<argArr.length;i++){
		if(argArr[i] == 'popupArea'){
			text = "地区";
		}else if(argArr[i] == 'popupFuntype'){
			text = "职能";
		}else if(argArr[i] == 'popupSubfuntype'){
			text = "职位";
		}else if(argArr[i] == 'popupIndustry'){
			text = "行业";
		}else{
			text = "发布日期";
		}
		
    	htmlDiv = '<div id="'+argArr[i]+'" width="645" style="position:absolute;left:10px;top:-165px;visibility:hidden;z-index:100;filter:progid:DXImageTransform.Microsoft.DropShadow(Color=#949694,OffX=4,OffY=4);">';
    	htmlDiv = htmlDiv + '<table width="645" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">';
    	htmlDiv = htmlDiv + '<tr><td align="left" valign="middle" width="599" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'">&nbsp;&nbsp;<img src="'+php_imgpath+'/im/search/'+php_arrow+'">&nbsp;<span style="color:#FFFFFF">请选择'+text+'</span></td><td align="left" valign="middle" width="50" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'"><span><a onclick="javascript:hiddenLayer('+argArr[i]+')" style="color:#FFFFFF;cursor:hand;">[关闭]</a></span></td></tr>';
    	htmlDiv = htmlDiv + '<tr><td colspan="2" width="645" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
    	
    	if(argArr[i] == 'popupArea'){
    		var j = (6 - jobarea_s.length%6) == 6 ? 0 : (6 - jobarea_s.length%6);

    		htmlDiv = htmlDiv + '<tr>';
    		for(var k=0;k<jobarea_s.length;k++){
	    		
	    		htmlDiv = htmlDiv + '<td height="20" align="center"><a style="cursor:hand" onclick="showSubjobarea(\''+jobarea_s[k]+'\',\''+jobarea_v[k]+'\',\''+k+'\')">'+jobarea_s[k]+'</a></td>';
	    		htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
	    		if(k%6 == 5){
	    			htmlDiv = htmlDiv + '</tr><tr>';
	    		}
    		}
    		if(j > 0){
				for(var l=1;l<=j;l++){
					htmlDiv = htmlDiv + '<td height="20">&nbsp;</td>';
	    			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
				}
				htmlDiv = htmlDiv + '</tr>';
    		}
    	}
    	
    	if(argArr[i] == 'popupFuntype'){
    		var j = (3 - func_s.length%3) == 0 ? 0 : (3 - func_s.length%3);

    		htmlDiv = htmlDiv + '<tr>';
    		for(var k=0;k<func_s.length;k++){
	    		
	    		htmlDiv = htmlDiv + '<td height="20" align="center"><a style="cursor:hand" onclick="sltFuntype(\''+func_s[k]+'\',\''+func_v[k]+'\',\''+k+'\')">'+func_s[k]+'</a></td>';
	    		htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
	    		if(k%3 == 2){
	    			htmlDiv = htmlDiv + '</tr><tr>';
	    		}
    		}
    		if(j > 0){
				for(var l=1;l<=j;l++){
					htmlDiv = htmlDiv + '<td height="20">&nbsp;</td>';
	    			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
				}
				htmlDiv = htmlDiv + '</tr>';
    		}
    	}
    	
    	if(argArr[i] == 'popupSubfuntype'){
    		
    	}
    	
    	if(argArr[i] == 'popupIndustry'){
    		var j = (3 - ind_s.length%3) == 0 ? 0 : (3 - ind_s.length%3);
			
			htmlDiv = htmlDiv + '<tr><td height="20" align="center"><a onclick="sltIndustry(\'不限\',\'00\')" style="cursor:hand">不限</a></td><td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td><td height="20" align="center"></td><td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td><td height="20" align="center"></td><td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td></tr>';
    		htmlDiv = htmlDiv + '<tr>';
    		for(var k=0;k<ind_s.length;k++){
	    		
	    		htmlDiv = htmlDiv + '<td height="20" align="center"><a style="cursor:hand" onclick="sltIndustry(\''+ind_s[k]+'\',\''+ind_v[k]+'\')">'+ind_s[k]+'</a></td>';
	    		htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
	    		if(k%3 == 2){
	    			htmlDiv = htmlDiv + '</tr><tr>';
	    		}
    		}
    		if(j > 0){
				for(var l=1;l<=j;l++){
					htmlDiv = htmlDiv + '<td height="20">&nbsp;</td>';
	    			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
				}
				htmlDiv = htmlDiv + '</tr>';
    		}
    	}
    	
    	if(argArr[i] == 'popupIssuedate'){
    		var j = (3 - pubschedule_show.length%3) == 0 ? 0 : (3 - pubschedule_show.length%3);

    		htmlDiv = htmlDiv + '<tr>';
    		for(var k=0;k<pubschedule_show.length;k++){
	    		htmlDiv = htmlDiv + '<td height="20" align="center"><a style="cursor:hand" onclick="sltIssuedate(\''+pubschedule_show[k]+'\',\''+pubschedule_value[k]+'\')">'+pubschedule_show[k]+'</a></td>';
	    		htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
	    		if(k%3 == 2){
	    			htmlDiv = htmlDiv + '</tr><tr>';
	    		}
    		}
    		if(j > 0){
				for(var l=1;l<=j;l++){
					htmlDiv = htmlDiv + '<td height="20">&nbsp;</td>';
	    			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
				}
				htmlDiv = htmlDiv + '</tr>';
    		}
    	}
    	htmlDiv = htmlDiv + '</table></td></tr><tr><td colspan="2" height="4" bgcolor="'+php_bgColor+'"></td></tr></table>';
    	htmlDiv = htmlDiv + '</div>';
    	document.write(htmlDiv);
	}
}



function displayLayer(obj,layerID){
    //mod by wendy 2007-04-23 
    //当只有一个层的时候，不需要隐藏其他层，所以加一个参数标识是否需要隐藏其他层
    if( 3 != arguments.length ){
        hiddenLayer('popupArea','popupFuntype','popupSubfuntype','popupIndustry','popupIssuedate');
    }
    //end mod
	//hiddenLayer('popupArea','popupFuntype','popupSubfuntype','popupIndustry','popupIssuedate');
	
	var dv = document.getElementById(layerID);
	
	GetCenterXY_ForLayer(dv);
	DivSetVisible(dv);
	dv.style.visibility = "visible";
}

function hiddenLayer(){
	var argArr = hiddenLayer.arguments;
	
	showElementAll();

	for(var i=0;i<argArr.length;i++){
		eval(argArr[i]).style.visibility = "hidden";
	}
}

//将悬浮层的位置定位在屏幕中央
function GetCenterXY_ForLayer(objdiv){
	x = document.body.scrollLeft;
	y = document.body.scrollTop;
	
	//获取屏幕宽度
	availWidth = parseInt(window.screen.availWidth);
	availHeight = parseInt(window.screen.availHeight);
	
	tblWidth = parseInt(objdiv.width);
	
		
	y = y + availHeight/4;
	x = (availWidth - tblWidth)/2;
	
	objdiv.style.top = y;
	objdiv.style.left = x;
}

function GetLength(strTemp){
	var i,sum;
	sum=0;
	for(i=0;i<strTemp.length;i++){
		if ((strTemp.charCodeAt(i)>=0) && (strTemp.charCodeAt(i)<=255)) 
			sum = sum + 1;
		else 
			sum=sum + 2;
	}
	return sum;
}

function subStringPro(str, length){
	var stri = '';
	for(i=0,j=0; j<length;){
		if ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255)) {
			stri += str.charAt(i);
			j++;
		} else {
			stri += str.charAt(i);
			j += 2;
		}
		i++;
	}
	return stri;
}

function sltFuntype(show,value,k){
	//document.freshlist.funtype_big.value = value;
	eval( "document."+php_form_name+".funtype_big.value=value;" );
	
	var strName = show;
	var lengthStr = GetLength(strName);
	
	if(lengthStr>17) strName=subStringPro(strName,15)+'...';
	document.all("btnSltFuntype").value = strName;
	//每次选择大类，重置小类里面的值
	var strName = subfunc_s[k][0];
	var lengthStr = GetLength(strName);

	if(lengthStr>17) strName=subStringPro(strName,15)+'...';
	document.all("btnSltPosition").value = strName;
	//document.freshlist.funtype.value = subfunc_v[k][0];
	eval( "document."+php_form_name+".funtype.value=subfunc_v[k][0];" );
	
	buildJobtype(k);
	
	document.all("btnSltPosition").disabled = false;
	hiddenLayer("popupFuntype");
}

function showSubjobarea(show,value,tag){
	var htmlDiv = '';
	var htmlDiv1 = '';
	
	
	if(subarea_s[tag].length == 1){
		sltJobarea(show,value);
	}else{
		var j = (6 - jobarea_s.length%6) == 6 ? 0 : (6 - jobarea_s.length%6);
		
		htmlDiv = htmlDiv + '<table width="645" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">';
	    htmlDiv = htmlDiv + '<tr><td align="left" valign="middle" width="599" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'">&nbsp;&nbsp;<img src="'+php_imgpath+'/im/search/'+php_arrow+'">&nbsp;<span style="color:#FFFFFF">请选择工作地点</span></td><td align="left" valign="middle" width="50" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'"><span><a onclick="javascript:hiddenLayer(popupArea)" style="color:#FFFFFF;cursor:hand;">[关闭]</a></span></td></tr>';
	    htmlDiv = htmlDiv + '<tr><td colspan="2" width="645" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
		
		//Modified by Ryan Gao  2007-05-10 增加取消所选地区的设置
		htmlDiv = htmlDiv + '<tr><td width="100" height="20" align="center"><a onclick="javascript:sltJobarea(\'选择/修改\',\'\')" style="cursor:hand;">全部</a></td><td colspan="5"></td></tr>' + '<tr>';
		for(var k=0;k<jobarea_s.length;k++){
			
			htmlDiv = htmlDiv + '<td width="100" height="20" align="center"><a style="cursor:hand" onclick="showSubjobarea(\''+jobarea_s[k]+'\',\''+jobarea_v[k]+'\',\''+k+'\')">'+jobarea_s[k]+'</a></td>';
			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			if(k%6 == 5){
				htmlDiv = htmlDiv + '</tr><tr>';
			}
		}
		if(j > 0){
			for(var l=1;l<=j;l++){
				htmlDiv = htmlDiv + '<td width="100" height="20">&nbsp;</td>';
				htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			}
			htmlDiv = htmlDiv + '</tr>';
		}
		htmlDiv = htmlDiv + '</table>';
		
		var j = (6 - subarea_s[tag].length%6) == 6 ? 0 : (6 - subarea_s[tag].length%6);
	
		htmlDiv1 = htmlDiv1 + '<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
		htmlDiv1 = htmlDiv1 + '<tr><td colspan="6" align="left">&nbsp;&nbsp;请选择城市</td></tr>';
		htmlDiv1 = htmlDiv1 + '<tr>';
		
		for(var k=0;k<subarea_s[tag].length;k++){
			
			htmlDiv1 = htmlDiv1 + '<td width="100" height="20" align="center"><a style="cursor:hand" onclick="sltJobarea(\''+subarea_s[tag][k]+'\',\''+subarea_v[tag][k]+'\')">'+subarea_s[tag][k]+'</a></td>';
			htmlDiv1 = htmlDiv1 + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			if(k%6 == 5){
				htmlDiv1 = htmlDiv1 + '</tr><tr>';
			}
		}
		if(j > 0){
			for(var l=1;l<=j;l++){
				htmlDiv1 = htmlDiv1 + '<td width="100" height="20">&nbsp;</td>';
				htmlDiv1 = htmlDiv1 + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			}
			htmlDiv1 = htmlDiv1 + '</tr>';
		}
		htmlDiv1 = htmlDiv1 + '</table></td></tr><tr><td colspan="2" height="4" bgcolor="'+php_bgColor+'"></td></tr></table>';
	
		var dv = document.getElementById('popupArea');
		
		dv.innerHTML = htmlDiv + htmlDiv1;
		DivSetVisible(dv);
	}
}

function sltJobarea(show,value){
	//document.freshlist.jobarea.value = value;
	eval( "document."+php_form_name+".jobarea.value=value;" );
	document.all("btnSltArea").value = show;
 	hiddenLayer("popupArea");
}

function buildJobtype(tag){
	var htmlDiv = '';

	var j = (3 - subfunc_s[tag].length%3) == 3 ? 0 : (3 - subfunc_s[tag].length%3);

	htmlDiv = htmlDiv + '<table width="645" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">';
    htmlDiv = htmlDiv + '<tr><td align="left" valign="middle" width="599" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'">&nbsp;&nbsp;<img src="'+php_imgpath+'/im/search/'+php_arrow+'">&nbsp;<span style="color:#FFFFFF">请选择职位</span></td><td align="left" valign="middle" width="50" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'"><span><a onclick="javascript:hiddenLayer(popupSubfuntype)" style="color:#FFFFFF;cursor:hand;">[关闭]</a></span></td></tr>';
    htmlDiv = htmlDiv + '<tr><td colspan="2" width="645" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
	
	htmlDiv = htmlDiv + '<tr>';
	for(var k=0;k<subfunc_s[tag].length;k++){
		
		htmlDiv = htmlDiv + '<td height="20" align="center"><a style="cursor:hand" onclick="sltSubfuntype(\''+subfunc_s[tag][k]+'\',\''+subfunc_v[tag][k]+'\')">'+subfunc_s[tag][k]+'</a></td>';
		htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
		if(k%3 == 2){
			htmlDiv = htmlDiv + '</tr><tr>';
		}
	}
	if(j > 0){
		for(var l=1;l<=j;l++){
			htmlDiv = htmlDiv + '<td height="20">&nbsp;</td>';
			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
		}
		htmlDiv = htmlDiv + '</tr>';
	}
	htmlDiv = htmlDiv + '</table></td></tr><tr><td colspan="2" height="4" bgcolor="'+php_bgColor+'"></td></tr></table>';

	var dv = document.getElementById('popupSubfuntype');
	
	dv.innerHTML = htmlDiv;
	
}

function sltSubfuntype(show,value){
	//document.freshlist.funtype.value = value;
	eval( "document."+php_form_name+".funtype.value=value;" );
	
	var strName = show;
	var lengthStr = GetLength(strName);

	if(lengthStr>17) strName=subStringPro(strName,15)+'...';
	document.all("btnSltPosition").value = strName;
 	
	hiddenLayer("popupSubfuntype");
}

function sltIssuedate(show,value){
	//document.freshlist.issuedate.value = value;
	eval( "document."+php_form_name+".issuedate.value=value;" );
	document.all("btnSltIssuedate").value = show;
 	
	hiddenLayer("popupIssuedate");
}

function sltIndustry(show,value){
	//document.freshlist.industrytype.value = value;
	eval( "document."+php_form_name+".industrytype.value=value;" );
	var strName = show;
	var lengthStr = GetLength(strName);

	if(lengthStr>17) strName=subStringPro(strName,15)+'...';
	document.all("btnSltIndustry").value = strName;
 	
	hiddenLayer("popupIndustry");
}

function initJobtype(){
	var htmlDiv = '';
	var tag = 0;
	
	//取得tag
	for(var k=0;k<func_v.length;k++){
		if(func_v[k] == php_funtype_big ){
			tag = k;
			break;
		}
	}
	if('0000' != php_funtype_big ){
		var j = (3 - subfunc_s[tag].length%3) == 3 ? 0 : (3 - subfunc_s[tag].length%3);
	
		htmlDiv = htmlDiv + '<table width="645" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">';
	    htmlDiv = htmlDiv + '<tr><td align="left" valign="middle" width="599" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'">&nbsp;&nbsp;<img src="'+php_imgpath+'/im/search/'+php_arrow+'">&nbsp;<span style="color:#FFFFFF">请选择职位</span></td><td align="left" valign="middle" width="50" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'"><span><a onclick="javascript:hiddenLayer(popupSubfuntype)" style="color:#FFFFFF;cursor:hand;">[关闭]</a></span></td></tr>';
	    htmlDiv = htmlDiv + '<tr><td colspan="2" width="645" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
		
		htmlDiv = htmlDiv + '<tr>';
		for(var k=0;k<subfunc_s[tag].length;k++){
			
			htmlDiv = htmlDiv + '<td height="20" align="center"><a style="cursor:hand" onclick="sltSubfuntype(\''+subfunc_s[tag][k]+'\',\''+subfunc_v[tag][k]+'\')">'+subfunc_s[tag][k]+'</a></td>';
			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			if(k%3 == 2){
				htmlDiv = htmlDiv + '</tr><tr>';
			}
		}
		if(j > 0){
			for(var l=1;l<=j;l++){
				htmlDiv = htmlDiv + '<td height="20">&nbsp;</td>';
				htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			}
			htmlDiv = htmlDiv + '</tr>';
		}
		htmlDiv = htmlDiv + '</table></td></tr><tr><td colspan="2" height="4" bgcolor="'+php_bgColor+'"></td></tr></table>';
	
		var dv = document.getElementById('popupSubfuntype');
		
		dv.innerHTML = htmlDiv;
	}
}

function DivSetVisible(objDiv){
	hideElementAll();
	objDiv.style.visibility = "visible";
}

function initJobArea(){
	var htmlDiv = '';
	var htmlDiv1 = '';
	var tag = 0;
	
	//取得tag
	/*
	for(var k=0;k<jobarea_v.length;k++){
		if(jobarea_v[k] == document.all("jobarea").value.substring(0,2)+'00'){
			tag = k;
			break;
		}
	}
    */
	var j = (6 - jobarea_s.length%6) == 6 ? 0 : (6 - jobarea_s.length%6);
		
	htmlDiv = htmlDiv + '<table width="645" border="0" cellspacing="0" cellpadding="0" bgcolor="#999999">';
    htmlDiv = htmlDiv + '<tr><td align="left" valign="middle" width="599" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'">&nbsp;&nbsp;<img src="'+php_imgpath+'/im/search/'+php_arrow+'">&nbsp;<span style="color:#FFFFFF">请选择工作地点</span></td><td align="left" valign="middle" width="50" height="27" background="'+php_imgpath+'/im/search/'+php_bgPicture+'"><span><a onclick="javascript:hiddenLayer(popupArea)" style="color:#FFFFFF;cursor:hand;">[关闭]</a></span></td></tr>';
    htmlDiv = htmlDiv + '<tr><td colspan="2" width="645" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
	
	//Modified by Ryan Gao  2007-05-10 增加取消所选地区的设置
	htmlDiv = htmlDiv + '<tr><td width="100" height="20" align="center"><a onclick="javascript:sltJobarea(\'选择/修改\',\'\')" style="cursor:hand;">全部</a></td><td colspan="5"></td></tr>' + '<tr>';
	for(var k=0;k<jobarea_s.length;k++){
		
		htmlDiv = htmlDiv + '<td width="100" height="20" align="center"><a style="cursor:hand" onclick="showSubjobarea(\''+jobarea_s[k]+'\',\''+jobarea_v[k]+'\',\''+k+'\')">'+jobarea_s[k]+'</a></td>';
		htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
		if(k%6 == 5){
			htmlDiv = htmlDiv + '</tr><tr>';
		}
	}

	if(j > 0){
		for(var l=1;l<=j;l++){
			htmlDiv = htmlDiv + '<td width="100" height="20">&nbsp;</td>';
			htmlDiv = htmlDiv + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
		}
		htmlDiv = htmlDiv + '</tr>';
	}
	htmlDiv = htmlDiv + '</table>';
	
	if(subarea_s[tag].length >1){
		var j = (6 - subarea_s[tag].length%6) == 6 ? 0 : (6 - subarea_s[tag].length%6);
		
		htmlDiv1 = htmlDiv1 + '<table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">';
		htmlDiv1 = htmlDiv1 + '<tr><td colspan="6" align="left">&nbsp;&nbsp;请选择城市</td></tr>';
		htmlDiv1 = htmlDiv1 + '<tr>';
		
		for(var k=0;k<subarea_s[tag].length;k++){
			
			htmlDiv1 = htmlDiv1 + '<td width="100" height="20" align="center"><a style="cursor:hand" onclick="sltJobarea(\''+subarea_s[tag][k]+'\',\''+subarea_v[tag][k]+'\')">'+subarea_s[tag][k]+'</a></td>';
			htmlDiv1 = htmlDiv1 + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			if(k%6 == 5){
				htmlDiv1 = htmlDiv1 + '</tr><tr>';
			}
		}
		if(j > 0){
			for(var l=1;l<=j;l++){
				htmlDiv1 = htmlDiv1 + '<td width="100" height="20">&nbsp;</td>';
				htmlDiv1 = htmlDiv1 + '<td width="1" height="20" align="center" valign="middle"><img src="'+php_imgpath+'/im/line_bg.gif"></td>';
			}
			htmlDiv1 = htmlDiv1 + '</tr>';
		}
		htmlDiv1 = htmlDiv1 + '</table>';
	}
	
	htmlDiv = htmlDiv+htmlDiv1+'</td></tr><tr><td colspan="2" height="4" bgcolor="'+php_bgColor+'"></td></tr></table>';
	
	var dv = document.getElementById('popupArea');
	dv.innerHTML = htmlDiv;
}

function HideElement(strElementTagName){
	try{
		for(i=0;i<window.document.all.tags(strElementTagName).length; i++){
			var objTemp = window.document.all.tags(strElementTagName)[i];
			objTemp.style.visibility = "hidden";
		}
	}catch(e){
		alert(e.message);
	}
}

function ShowElement(strElementTagName){
	try{
		for(i=0;i<window.document.all.tags(strElementTagName).length; i++){
			var objTemp = window.document.all.tags(strElementTagName)[i];
			objTemp.style.visibility = "visible";
		}
	}catch(e){
		alert(e.message);
	}
}

function hideElementAll(){
	HideElement("SELECT");
	HideElement("OBJECT");
	HideElement("IFRAME");
}

function showElementAll(){
	ShowElement("SELECT");
	ShowElement("OBJECT");
	ShowElement("IFRAME");
}
