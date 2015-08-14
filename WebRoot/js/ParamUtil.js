<!--


function fnRemoveBrank(strSource)
{
 return strSource.replace(/^\s*/,'').replace(/\s*$/,'');
}

function pwdMatch(pwd1,pwd2){
	if( pwd1.value != pwd2.value){
		
		return false;
	}else{
		return true;
	}
}



//***********************************************************************
//????????isNum		              ????????????????????????????????
//????????????????????????       ????????????????????????true,????????false
//????????wangch			        ??????????2001/08/31
//????????			            ??????????
//************************************************************************
function isNum(strSrc){
	var strNum = "0123456789";
	var len = strSrc.length;
	for(var i=0;i<len;i++){
		if (strNum.indexOf(strSrc.charAt(i))<0){
			return false;
		}
	}
	return true;
}
function isFloatNum(strSrc){
	var strNum = "0123456789.";
	var len = strSrc.length;
	for(var i=0;i<len;i++){
		if (strNum.indexOf(strSrc.charAt(i))<0){
			
			return false;
		}
		if(i==0&&strSrc.charAt(i)=='.'){return false;}
	}
	return true;
}
//***********************************************************************
//????????isTelnum		     ??????????????????????????????'(',')','-'????
//????????????????????????       ??????????????????true,????????false
//????????wangch			        ??????????2001/09/06
//????????			            ??????????
//************************************************************************
function isTelnum(strSrc){
	var strTelnum = "0123456789()-,";
	var len = strSrc.length;
	for(var i=0;i<len;i++){
		if (strTelnum.indexOf(strSrc.charAt(i))<0){
			return false;
		}
	}
	return true;
}

function isAccountID(strSrc){
	var len = strSrc.length;
	if(len<4||len>18){
		return false;
	}
	var strAccountID = "abcdefghijklmnopqrstuvwxyz0123456789_";
	
	for(var i=0;i<len;i++){
		if (strAccountID.indexOf(strSrc.charAt(i))<0){
			return false;
		}
	}
	return true;
}

//***********************************************************************
//????????isEmpty 	     ??????????????????????????
//????????????????????????       ??????????????????true,????????false
//????????wangch			        ??????????2002/03/21
//????????			            ??????????
//************************************************************************
function isEmpty(s){
  return ((s == null) || (s.length == 0))
}

//***********************************************************************
//????????isEmail     	     ??????????????????????????email????
//????????????????????????       ??????????????????true,????????false
//????????wangch			        ??????????2002/03/21
//????????			            ??????????
//Email????????????????a@b.c??????????"@","."????????Email??
//"@"??????????????"."????????????????????????Email??
//"@"??????"."??????"@"??"."??????,????????Email??
//************************************************************************
function isEmail(src){
  src = lrtrim(src);
  if(isEmpty(src)){       //????????
    return true;
  }

  if((src.indexOf("@")<=0) || (src.indexOf(".")<=0) || (src.indexOf(".")==src.length-1)){
    return false;
  }
  if((src.indexOf("@")>src.indexOf(".")) || (src.indexOf("@")+1==src.indexOf("."))){
    return false;
  }
  return true;
}

//***********************************************************************
//????????lefttrim              	??????????????????????
//??????????????????????????        ??????????????????????????????
//????????wangch			    ??????????2001/09/11
//????????			    ??????????
//************************************************************************
function lefttrim(strSrc){
	var len = strSrc.length;
	if(typeof(strSrc)!="string")
		return strSrc;
	for (var i=0; i<len; i++)
		if(strSrc.charAt(i)!=" ")
			break;
	strSrc=strSrc.substring(i,len);
	return strSrc;
}

//***********************************************************************
//????????righttrim              	??????????????????????
//??????????????????????????        ??????????????????????????????
//????????wangch			    ??????????2001/09/13
//????????			    ??????????
//************************************************************************
function righttrim(strSrc){
	var len = strSrc.length;
	if(typeof(strSrc)!="string")
		return strSrc;
	for (var i=len-1; i>=0; i--)
		if(strSrc.charAt(i)!=" ")
			break;
	strSrc=strSrc.substring(0,i+1);
	return strSrc;
}

//***********************************************************************
//????????lrtrim              	????????????????????????
//??????????????????????????        ????????????????????????????????
//????????wangch			    ??????????2001/09/13
//????????			    ??????????
//************************************************************************
function lrtrim(strSrc){
	strSrc = lefttrim(strSrc);
	strSrc = righttrim(strSrc);
	return strSrc;
}

//***********************************************************************
//????????lrtrim              	????????????????????????YYYY-MM-DD??YYYY-MMDD hh:mm:ss??????????
//??????????????????????????        ??????????????????????????javascript??????UTC??????????????????????????false  
//????????wangch			    ??????????2001/09/13
//?????? var myDate = Date_Ex("2004-12-21 23:01:00"); //??????????????
//       var myDate = Date_Ex("2004-12-21");     //??????????????
//       var myDate = Date_Ex("2004-23-12 12:60:29");//????false??????????????????????????????
//************************************************************************
function Date_Ex(value1)
  {
 var strDate = value1;
 if (strDate.length == 0)
  return false;

 //????????????????????????YYYY-MM-DD??????????????????????00:00:00????????YYYY-MM-DD hh:mm:ss????
 var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})/;   //??????????????????????
 var r = strDate.match(reg);

 if (r != null)   //????strDate??????????????????????????????
   strDate = strDate + " 00:00:00";
 
 reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2}) (\d{1,2}):(\d{1,2}):(\d{1,2})/;
 r = strDate.match(reg);
 if (r == null)
 {
  alert("??????????????????????????????????2004-12-01 ?? 2004-12-01 12:23:45");
  return false;
 }

 var d = new Date(r[1], r[3]-1,r[4],r[5],r[6],r[7]);
 if (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]&&d.getHours()==r[5]&&d.getMinutes()==r[6]&&d.getSeconds()== r[7])
 {
  return d;
 }
 else
 {
  alert("????????????????????????????????????????????");
  return false;
 }
}

function isChecked(r){
 if(r.checked){
 	return true;
 } 
 for(var i=0;i<r.length;i++){
   if(r[i].checked) return true;
 }
 return false;
}

-->

