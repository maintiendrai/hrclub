<!--

//实现页面顶部模板的显示
function largeToolTop(tool01,tool02,tool03,tool04)
{
	var imageMoneyChange = tool01;
	var imageHouseMoney = tool02;
	var imagePersonalTax = tool03;
	var imageAccrual = tool04;
	document.write("<table width='800' border='0' cellspacing='0' cellpadding='0'>");
	document.write("  <tr> ");
	document.write("    <td height='61'> ");
	document.write("      <table width='800' border='0' cellspacing='0' cellpadding='0'>");
	document.write("        <tr> ");
	document.write("          <td width='6'><img src='images/fptool/fptool_leftboder.gif' width='6' height='61'></td>");
	document.write("          <td width='788' background='images/fptool/fptool_midboder.gif'> ");
	document.write("            <table width='788' border='0' cellspacing='0' cellpadding='0'>");
	document.write("              <tr> ");
	document.write("                <td width='145' align='right'><img src='images/fptool/fptool_top01.gif' width='420' height='31'></td>");
	document.write("                <td width='379'></td>");
	document.write("                <td width='264' align='right'><img src='images/fptool/fptool_menu.gif' width='29' height='27' border='0' alt='返回主画面'></a></td>");
	document.write("              </tr>");
	document.write("            </table>");
	document.write("          </td>");
	document.write("          <td><img src='images/fptool/fptool_rightboder.gif' width='6' height='61'></td>");
	document.write("        </tr>");
	document.write("      </table>");
	document.write("    </td>");
	document.write("  </tr>");
	document.write("</table>");
}

function InfoWindow_Open(theURL,winName,features) 
{ 
	window.open(theURL,winName,features);
}

//弹出页面动态显示
var times;
var timeid;
var timeid2;
var starttimes;
var shake;
var popwin;

times=300;
starttimes=0;


function callJS(jsStr) 
{
  return eval(jsStr)
}

function startdrop(templet)
{
	if(templet==1)
	  popwin = window.open("_Trunk.html","tool", "toolbar=no,width=1,height=1,left=-200,top=-200");
	else if(templet==2)
	  popwin = window.open("_OfficeCode.html","tool", "toolbar=no,width=1,height=1,left=-200,top=-200");
	else
	  popwin = window.open("_Trunk.html","tool", "toolbar=no,width=1,height=1,left=-200,top=-200");
	popwin.resizeTo(1,50);
	popwin.focus();
	if(popwin.moveBy)
	{
		popwin.moveBy(0,-500);
		dropwindow();
	}
}
function dropwindow()
{
	popwin.moveBy(0,10);
	starttimes++;
	if(starttimes>50)
	{
		clearTimeout(timeid);
		starttimes=0;
		timeid2=setTimeout("MM_openBrWindow()",10);
		return 0;
	}
	else
	{
		timeid=setTimeout("dropwindow()",10);
	}
}
function MM_openBrWindow() 
{ 
  for (var ofNum=1;ofNum<=72;ofNum++){
      popwin.resizeBy(5,0);
  }
  for (var ofNum=1;ofNum<=72;ofNum++){
     popwin.resizeBy(0,5);
  }
}

function MM_callJS(jsStr) {
  return eval(jsStr)
}


-->

