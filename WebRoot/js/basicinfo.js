//////////////////////////////////////////
// Global Variables
var gTimeSpan 	= 2000;
var gIE 		= (document.all) ? 1 : 0;
var gNS 		= (document.layers) ? 1 : 0;


//////////////////////////////////////////
// FORM FUNCTIONS
//////////////////////////////////////////

function closeMe()
{
	parent.close();
}

function formSubmit()
{
	parent.frames[0].document.forms[0].submit();
}

function formRefreshTime(timespan)
{
	self.setTimeout("formRefresh()", gTimeSpan);
}

function formRefresh()
{
	self.location.reload();
}

function loadForm()
{
    var pageName = document.location.href;

    if( pageName.indexOf("customeradd.htm") >= 0 )
    {

    }
}

function saveProcess()
{
	document.forms[0].ModifyFlag.value = "1";

	if( validSave() )
	{
		document.forms[0].submit();
	}
	else
	{
		document.forms[0].ModifyFlag.value = "0";
		return false;
	}

	return true;
}

function saveForm()
{
	saveProcess();
}

function resetForm()
{
	document.forms[0].reset();
}

function gotoForm(strUrl)
{
	document.forms[0].action = strUrl;
	document.forms[0].submit();
}

function savegotoForm(strUrl)
{
	if( saveProcess() )
	{
		if (document.forms[0].GotoPage != null)
			document.forms[0].GotoPage.value = strUrl;
		document.forms[0].submit();
	}
}

function returnForm(strUrl)
{

//	if ( confirm("您输入的数据可能没有保存。要先保存吗？") )
//	{
//		if( saveProcess() )
//		{
//			if (document.forms[0].GotoPage != null)
//				document.forms[0].GotoPage.value = strUrl;
//			document.forms[0].submit();
//		}
//	}
//	else
//	{
		document.forms[0].action = strUrl;
		document.forms[0].submit();
//	}
}

function deleteList()
{
    if( window.confirm("本操作将删除选中的内容。您确认要继续吗？") )
    {
        var theForm = document.forms[0];

        theForm.DeleteFlag.value="1";
        theForm.submit();
    }
}

function deleteForm()
{
	var theList = document.forms[0].chkdata;
	confirm("是否删除？");
    var selected = false;
    if( theList != null && !isNaN( theList.length ) && theList.length != null )
    {
        var size = theList.length;

        for( var i = 0; i < size; i ++ ) if( theList[i].checked ){ selected = true; break; }
    }
    else if( theList != null && theList.checked ) selected = true;

    if( selected ) deleteList();
    else if( theList != null ) alert("请先选中您想要删除的内容！");
}




function formatVal(theField,iFlag)
{
	if ( iFlag == 0 )
	{
		document.forms[0].theField.value = ValFormat(document.forms[0].theField.value);
	}
	else
	{
		document.forms[0].theField.value = GetNumStr(document.forms[0].theField.value);
	}
}

function formatDay(theField,iLen)
{
	var i = 0;
	var j = iLen-theField.value.length;
	var temp="";
	if (j >=0)
	{
		for ( i=0;i< j; i++)
			temp = "" + "0" + temp;
		theField.value = "" + temp + theField.value;
	}
}
//////////////////////////////////////////
// CONTROL FUNCTIONS
//////////////////////////////////////////

function lostFocus(obj)
{
	obj.value=GetNumStr(obj.value);
	obj.value=ValFormat(obj.value);
}

function setFocus(obj)
{
	//obj.value=GetNumStr(obj.value);
}

function funcNumberIsKeyedIn()
{
	if (window.event.keyCode>57 || window.event.keyCode<48)
		window.event.keyCode=0;
	return 1;
}
function funcTimeIsKeyedIn()
{
	if (window.event.keyCode>58 || window.event.keyCode<48)
		window.event.keyCode=0;
	return 1;
}

function funcInCommaIsKeyedIn()
{
	if (window.event.keyCode==39)
		window.event.keyCode=0;
	return 1;
}

//////////////////////////////////////////
// ALERT FUNCTIONS
//////////////////////////////////////////

function showAlert( msg )
{
	if( msg != null && trim(msg) != "" )
	{
		alert( msg );
	}
}

//////////////////////////////////////////
// STRING FUNCTIONS
//////////////////////////////////////////

function trim( str )
{
	// Immediately return if no trimming is needed
	if( (str.charAt(0) != ' ') && (str.charAt(str.length-1) != ' ') ) { return str; }
	// Trim leading spaces
	while( str.charAt(0)  == ' ' ) {
		str = '' + str.substring(1,str.length);
	}
	// Trim trailing spaces
	while( str.charAt(str.length-1)  == ' ' ) {
		str = '' + str.substring(0,str.length-1);
	}

	return str;
}

function lTrim( val ) { // Trim leading spaces
	while( '' + val.charAt(0)==' ' ) {
		val = val.substring(1,val.length);
	}
	return val;
}

// Trim trailing spaces
function rTrim( val )
{
	while( '' + val.charAt(val.length-1)==' ') {
		val = val.substring(0,val.length-1)
	}
	return val;
}

// temporary holder
function strReplace( entry, bad, good )
{
	temp = "" + entry;
	while( temp.indexOf(bad) > -1 ) {
		pos= temp.indexOf( bad );
		temp = "" + ( temp.substring(0, pos) + good +
			temp.substring( (pos + bad.length), temp.length) );
	}
	return temp;
}

// get string length
function strLen(str)
{
	var Chinese_OS;
	var strTest, ch, slen, i;
	Chinese_OS = false;
	strTest = "阿鬼";
	if ( strTest.length == 2 )	Chinese_OS = true;
	if ( Chinese_OS ) {
		slen = 0;
		for ( i=0; i< str.length; i++){
			ch = str.charCodeAt( i );
			if ( ch<0 ) ch = ch + 65536;
			if ( ch>255 ) slen = slen +1;
			slen = slen +1;
		}
	}
	else
	{
		slen = str.length;
	}
	return (slen);
}



// add ","
function ValFormat(CompareStr)
{
	if (!(CompareStr.charAt(0) == '0' && CompareStr.length == 1) )
	{
		while( CompareStr.charAt(0) == '0' ) CompareStr = CompareStr.substr(1);
	}
	var i,j,k ,firstchar ;
	firstchar = "" ;
	CompareStr=""+CompareStr;
	if (isNaN(CompareStr) )
		return(CompareStr);
	if ( CompareStr.charAt(0) == '-' )
	{
		CompareStr = CompareStr.substr(1) ;
		firstchar = "-" ;
	}
	j=CompareStr.lastIndexOf(".");
	if (j>=0)
	{
		k=parseFloat(CompareStr);
		k=k*100;
		k=Math.round(k);
		k=k/100;
		CompareStr=""+k;
	}
	if(j==-1)
		i=CompareStr.length-4;
	else
		i=j-4;
	while (i>=0)
	{
		CompareStr=CompareStr.substr(0,i+1) + "," + CompareStr.substring(i+1,CompareStr.length);
		i=i-3;
	}
	CompareStr = firstchar + CompareStr ;
	return( CompareStr);
}

// del ","
function GetNumStr(CompareStr)
{
	var j;
	CompareStr=""+CompareStr;
	j=CompareStr.indexOf(",");
	while (j!=-1)
	{
		CompareStr=CompareStr.substr(0,j)  + CompareStr.substring(j+1,CompareStr.length);
		j=CompareStr.indexOf(",");
	}
	return( CompareStr);
}
////////// below funtions apply to positive number
function IsEmpty(s)
{
	return ((s==null)||(s.length==0));
}

function IsWhitespace(s)
{
	var whitespace="\t\n\r";

	if(IsEmpty(s))
		return true;

	var i;
	for(i=0;i<s.length;i++)
	{
		var c=s.charAt(i);
		if(whitespace.indexOf(c)!=-1)
			continue;
		else
			return false;
	}
	return true;
}

function IsHasSpace(s)
{
	if(IsEmpty(s))
		return true;

	var i;
	var c=' ';
	if(s.indexOf(c)!=-1)
		return true;
	else
		return false;
}

function IsNumber ( Str )
{
  var DigitalCharSet = "1234567890." ;

  var DotNum = 0;

  for (var i=0; i<Str.length; i++)
  {
    if ( DigitalCharSet.indexOf( Str.charAt(i) ) == -1 )
      return false;
    else if ( Str.charAt(i) == '.' )
      DotNum++;
  }

  if (DotNum > 1)
    return false;

  return true;
}

function IsDouble ( str )
{

	str = GetNumStr(str) ;

    if ( !IsEmpty(str) && IsNumber(str) )
		return true ;

  	if ( str.indexOf("-") != -1 )
  		return false;

	return false ;
}

function IsInt ( str )
{
    str = GetNumStr(str) ;

	if ( IsDouble(str) && str.indexOf(".") == -1 && str.indexOf("-") == -1 )
		return true ;

	return false ;
}

function IsYear(str)
{
	if( IsInt(str) && str.length == 4 )  return true;
	return false;
}

function IsMonth(str)
{
	while( str.charAt(0) == '0' ) str = str.substr(1);
	if( IsInt(str) && parseInt(str)>0 && parseInt(str)<13)	return true;
// --- start waj011018 --- //
	//return flase;
	return false;
// --- end --- //
}

function IsDay(str)
{
	while( str.charAt(0) == '0' ) str = str.substr(1);
	if( IsInt(str) && parseInt(str)>0 && parseInt(str)<32)	return true;

// --- start waj011018 --- //
	//return flase;
	return false;
// --- end --- //
}

// --- start waj011009 --- //
function IsDate(strDate)
{
	if( strDate.length == 10 )
	{
		var year = strDate.substring(0,4);
		var char1 = strDate.charAt(4);
		var month = strDate.substring(5,7);
		var char2 = strDate.charAt(7);
		var day = strDate.substring(8,10);

		if( char1 != '-' || char2 != '-' )
			return false;
		if(  !IsInt(year) || !IsInt(month) ||  !IsInt(day) )
			return false;
		if( !isValidDate( year, month, day) )
			return false;

		return true;
	}

	if( strDate.length == 8 )
	{
		var year = strDate.substring(0,4);
		var month = strDate.substring(4,6);
		var day = strDate.substring(6,8);

		if(  !IsInt(year) || !IsInt(month) ||  !IsInt(day) )
			return false;
		if( !isValidDate( year, month, day) )
			return false;

		return true;
	}

	return false;
}

function IsFutureDate(strDate)
{
		var nowyear = ( new Date()).getYear();
		if ( nowyear < 2000 )
			nowyear += 1900;
		var nowmonth = ( new Date()).getMonth() + 1 ;
		var nowday = ( new Date()).getDate();

		var year = strDate.substring(0,4);
		var char1 = strDate.charAt(4);
		var month = strDate.substring(5,7);
		var char2 = strDate.charAt(7);
		var day = strDate.substring(8,10);

		if(  parseInt(year)>nowyear )
			return true;
		if( parseInt(year) == nowyear && parseInt(month)>nowmonth )
			return true;
		if( parseInt(year) == nowyear && parseInt(month) == nowmonth && parseInt(day)>nowday )
			return true;

		return false;
}

function isValidDate( year, month, day )
{
   year  = parseInt(year,10);
   month = parseInt(month,10);
   day   = parseInt(day,10);

   if ( month==4 || month==6 || month==9 || month==11 )
   { if ( day < 1 || day > 30 )
     {// alert( "???1 - 30??" );
       return (false);
     }
   }
   else
   { if ( month!=2 )
     { if ( day < 1 || day > 31 )
       {//  alert( "???1 - 31??" );
          return (false);
       }
     }
     else
     { // month == 2
       if ( ( year % 100 ) != 0 && (year % 4 == 0) || ( year % 100 ) == 0 && ( year % 400) == 0 )
       { if ( day > 29 )
         {//  alert( "???1 - 29??" );
            return (false);
         }
       }
       else
       { if ( day > 28 )
         {// alert( "???1 - 28??" );
           return (false);
         }
       }
     }
   }
 return (true);
}


function IsEmail(s)
{
	var i=1;
	var sLength=s.length;

	if(!IsWhitespace(s))
	{
		while((i<sLength)&&(s.charAt(i)!="@"))
			i++;

		if((i>=sLength)||(s.charAt(i)!="@"))
			return false;
		else
			i+=2;

		while((i<sLength)&&(s.charAt(i)!="."))
			i++;

		if((i>=sLength-1)||(s.charAt(i)!="."))
			return false;
		else
			return true;
	}
	else
		return false;
}

function isPhoneNumber(Num2Check, Len)
{
	if (strLen(Num2Check) > Len ) return (false);
	else
	{
		var regu="^[1-9][0-9]+$";
		var re = new RegExp(regu);
		if (Num2Check.search(re)==-1) return (false);
		else
		return (true);
	}
}
function isAreaNumber(Code2Check, Len)
{
	if (strLen(Code2Check) > Len ) return (false);
	else
	{
		var regu="^[0-9]+$";
		var re = new RegExp(regu);
		if (Code2Check.search(re)==-1) return (false);
		else
		return (true);
	}
}

//////////

function warnEmpty(theField,s)
{
	alert(s);
	if (theField.hidden)
		theField.focus();
	return false;
}

function warnInvalid(theField,s)
{
	alert(s);
//	if (theField.hidden)
//		theField.focus();
//	theField.select();
	return false;
}

//////////
function checkLength(theField, fieldName, len)
{
    var theValue = theField.value;

    if( theValue == null || theValue.length == 0 ) return true;

    if( strLen(theValue) > len )
    {
        warnInvalid( theField, fieldName + "太长！" );
        return false;
    }

    return true;
}

function checkString(theField,s)
{
	if(theField==null)
		return true;

	if(IsWhitespace(theField.value))
		return warnEmpty(theField,s);
	else
		return true;
}

function checkDouble(theField,s)
{
	if( !IsDouble(theField.value) )
		return warnInvalid(theField,s);
	else
		return true;
}

function checkInt(theField,s)
{
	if( !IsInt(theField.value) )
		return warnInvalid(theField,s);
	else
		return true;
}

function checkYear(theField,s)
{
	if( !IsYear(theField.value) )
		return warnInvalid(theField,s);
	else
		return true;
}

function checkMonth(theField,s)
{
	if( !IsMonth(theField.value) )
		return warnInvalid(theField,s);
	else
		return true;
}

function checkDay(theField,s)
{
	if( !IsDay(theField.value) )
		return warnInvalid(theField,s);
	else
		return true;
}

function checkDate(theField,s1,s2)
{
	if( !IsDate(theField.value) )
		return warnInvalid(theField,s1);
	else if( IsFutureDate(theField.value) )
		return warnInvalid(theField,s2);
	else
		return true;
}

function checkEmail(theField,s)
{
	if(!IsEmail(theField.value))
		return warnInvalid(theField,s);
	else
		return true;
}

function checkPhone(theField,s)
{
	if( !isPhoneNumber(theField.value),16 )
		return warnInvalid(theField,s1);
	else
		return true;
}

function checkArea(theField,s)
{
	if( !isAreaNumber(theField.value),6 )
		return warnInvalid(theField,s1);
	else
		return true;
}

function checkMoney(theField, message)
{
    if( IsEmpty( theField.value ) )
    {
    	theField.value = "0";
    	return true;
    }
    if( theField.value.length>15) return false;

    if( !IsDouble( theField.value ) )
    	return warnInvalid(theField, message);

    return true;
}

function checkValBetween(theField, s, minx, maxx)
{
	if( IsEmpty( theField.value ) ) return true;

    if( !IsDouble( theField.value ) ) return warnInvalid(theField, s);

    if ( parseDouble(theField.value)<minx || parseDouble(theField.value)>maxx)
    {
    	return warnInvalid(theField, s);
    }

    return false;
}

function checkEmpty(theField, s)
{
	if(theField==null)
		return true;

	if(IsEmpty(theField.value))
		return warnEmpty(theField,s);
	else
		return true;
}

function checkSpace(theField, s)
{
	if(theField==null)
		return true;

	if(IsHasSpace(theField.value))
		return warnEmpty(theField,s);
	else
		return true;
}

//////////
function showDate()
{
	d = new Date();
	switch (d.getDay())
	{
	 case 0:   strweek="日";
	    break;
	 case 1:   strweek="一";
	    break;
	 case 2:   strweek="二";
	    break;
	 case 3:   strweek="三";
	    break;
	 case 4:   strweek="四";
	    break;
	 case 5:   strweek="五";
	    break;
	 case 6:   strweek="六";
	    break;
	}
	myyear=d.getYear();
	mymonth=d.getMonth()+1;
	year = (myyear > 200) ? myyear : 1900 + myyear;
	var today=new Date();
	var year=today.getYear();
	var month=today.getMonth()+1;
	var day=today.getDate();
	var hours=today.getHours();
	var minutes = today.getMinutes();
	document.write((year+"年"+mymonth)+"月"+d.getDate()+ "日");
	document.write("<br>");
	document.write("星期"+ strweek);
}

///////////////////////////////////////////

