document.writeln('<div id=meizzDateLayer style="position: absolute; width: 142; height: 166; z-index: 9998; display: none">');
document.writeln('<span id=tmpSelectYearLayer  style="z-index: 9999;position: absolute;top: 2; left: 18;display: none"></span>');
document.writeln('<span id=tmpSelectMonthLayer style="z-index: 9999;position: absolute;top: 2; left: 75;display: none"></span>');
document.writeln('<table border=0 cellspacing=1 cellpadding=0 width=142 height=160 bgcolor=#808080 onselectstart="return false">');
document.writeln('  <tr><td width=142 height=23 bgcolor=#FFFFFF><table border=0 cellspacing=1 cellpadding=0 width=140 height=23>');
document.writeln('      <tr align=center><td width=20 align=center bgcolor=#808080 style="font-size:12px;cursor: hand;color: #FFD700" ');
document.writeln('        onclick="meizzPrevM()" title="��ǰ������" Author=meizz><b Author=meizz>&lt;&lt;</b>');
document.writeln('        </td><td width=100 align=center style="font-size:12px;cursor:default" Author=meizz>');
document.writeln('        <span Author=meizz id=meizzYearHead onclick="tmpSelectYearInnerHTML(this.innerText)"></span>&nbsp;��&nbsp;<span');
document.writeln('         id=meizzMonthHead Author=meizz onclick="tmpSelectMonthInnerHTML(this.innerText)"></span>&nbsp;��</td>');
document.writeln('        <td width=20 bgcolor=#808080 align=center style="font-size:12px;cursor: hand;color: #FFD700" ');
document.writeln('         onclick="meizzNextM()" title="��󷭡���" Author=meizz><b Author=meizz>&gt;&gt;</b></td></tr>');
document.writeln('    </table></td></tr>');
document.writeln('  <tr><td width=142 height=18 bgcolor=#808080>');
document.writeln('<table border=0 cellspacing=0 cellpadding=0 width=140 height=1 style="cursor:default">');
document.writeln('<tr align=center><td style="font-size:12px;color:#FFFFFF" Author=meizz>��</td>');
document.writeln('<td style="font-size:12px;color:#FFFFFF" Author=meizz>һ</td><td style="font-size:12px;color:#FFFFFF" Author=meizz>��</td>');
document.writeln('<td style="font-size:12px;color:#FFFFFF" Author=meizz>��</td><td style="font-size:12px;color:#FFFFFF" Author=meizz>��</td>');
document.writeln('<td style="font-size:12px;color:#FFFFFF" Author=meizz>��</td><td style="font-size:12px;color:#FFFFFF" Author=meizz>��</td></tr>');
document.writeln('</table></td></tr><!-- ������ʿͨͨ��������޹�˾ -->');
document.writeln('  <tr><td width=142 height=120>');
document.writeln('    <table border=0 cellspacing=1 cellpadding=0 width=140 height=120 bgcolor=#FFFFFF>');
var n=0; for (j=0;j<5;j++){ document.writeln (' <tr align=center>'); for (i=0;i<7;i++){
document.writeln('<td width=20 height=20 id=meizzDay'+n+' style="font-size:12px" Author=meizz onclick=meizzDayClick(this.innerText)></td>');n++;}
document.writeln('</tr>');}
document.writeln('      <tr align=center><td width=20 height=20 style="font-size:12px" id=meizzDay35 Author=meizz ');
document.writeln('         onclick=meizzDayClick(this.innerText)></td>');
document.writeln('        <td width=20 height=20 style="font-size:12px" id=meizzDay36 Author=meizz onclick=meizzDayClick(this.innerText)></td>');
document.writeln('        <td colspan=5 align=right Author=meizz><span onclick=closeLayer() style="font-size:12px;cursor: hand"');
document.writeln('         Author=meizz title="������ʿͨͨ��������޹�˾"><u>�ر�</u></span>&nbsp;</td></tr>');
document.writeln('    </table></td></tr><tr><td>');
document.writeln('        <table border=0 cellspacing=1 cellpadding=0 width=100% bgcolor=#FFFFFF>');
document.writeln('          <tr><td Author=meizz align=left><input Author=meizz type=button value="< " title="��ǰ������" onclick="meizzPrevY()" ');
document.writeln('             onfocus="this.blur()" style="font-size: 12px; height: 20px"><input Author=meizz title="��ǰ������" type=button ');
document.writeln('             value="<<" onclick="meizzPrevM()" onfocus="this.blur()" style="font-size: 12px; height: 20px"></td><td ');
document.writeln('             Author=meizz align=center><input Author=meizz type=button value=Today onclick="meizzToday()" ');
document.writeln('             onfocus="this.blur()" title="���ڵ�����" style="font-size: 12px; height: 20px"></td><td ');
document.writeln('             Author=meizz align=right><input Author=meizz type=button value=">>" onclick="meizzNextM()" ');
document.writeln('             onfocus="this.blur()" title="��󷭡���" style="font-size: 12px; height: 20px"><input ');
document.writeln('             Author=meizz type=button value=" >" title="��󷭡���" onclick="meizzNextY()"');
document.writeln('             onfocus="this.blur()" style="font-size: 12px; height: 20px"></td>');
document.writeln('</tr></table></td></tr></table></div>');
var outObject;
function setday(tt,obj) 
{
  if (arguments.length >  2){alert("�Բ��𣡴��뱾�ؼ��Ĳ���̫�࣡");return;}
  if (arguments.length == 0){alert("�Բ�����û�д��ر��ؼ��κβ���");return;}
  var dads  = document.all.meizzDateLayer.style;var th = tt;
  var ttop  = tt.offsetTop;     
  var thei  = tt.clientHeight;  
  var tleft = tt.offsetLeft;    
  var ttyp  = tt.type;          
  while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;}
  dads.top  = (ttyp=="image")? ttop+thei : ttop+thei+6;
  dads.left = tleft;
  outObject = (arguments.length == 1) ? th : obj;
  dads.display = '';
  event.returnValue=false;
}
var MonHead = new Array(12);         
    MonHead[0] = 31; MonHead[1] = 28; MonHead[2] = 31; MonHead[3] = 30; MonHead[4]  = 31; MonHead[5]  = 30;
    MonHead[6] = 31; MonHead[7] = 31; MonHead[8] = 30; MonHead[9] = 31; MonHead[10] = 30; MonHead[11] = 31;
var meizzTheYear=new Date().getFullYear(); 
var meizzTheMonth=new Date().getMonth()+1; 
var meizzWDay=new Array(37);    
           
function document.onclick()
{ 
  with(window.event.srcElement)
  { if (getAttribute("Author")==null && tagName != "INPUT")
    document.all.meizzDateLayer.style.display="none";
  }
}
function meizzWriteHead(yy,mm)  
  { document.all.meizzYearHead.innerText  = yy;
    document.all.meizzMonthHead.innerText = mm;
  }
function tmpSelectYearInnerHTML(strYear)
{
  if (strYear.match(/\D/)!=null){alert("���������������֣�");return;}
  var m = (strYear) ? strYear : new Date().getFullYear();
  if (m < 1000 || m > 9999) {alert("���ֵ���� 1000 �� 9999 ֮�䣡");return;}
  var n = m - 10;
  if (n < 1000) n = 1000;
  if (n + 26 > 9999) n = 9974;
  var s = "<select Author=meizz name=tmpSelectYear style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";"
     s += "meizzTheYear = this.value; meizzSetDay(meizzTheYear,meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = n; i < n + 26; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option value='" + i + "' selected>" + i + "��" + "</option>\r\n";}
    else {selectInnerHTML += "<option value='" + i + "'>" + i + "��" + "</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  document.all.tmpSelectYearLayer.style.display="";
  document.all.tmpSelectYearLayer.innerHTML = selectInnerHTML;
  document.all.tmpSelectYear.focus();
}
function tmpSelectMonthInnerHTML(strMonth)
{
  if (strMonth.match(/\D/)!=null){alert("�·�������������֣�");return;}
  var m = (strMonth) ? strMonth : new Date().getMonth() + 1;
  var s = "<select Author=meizz name=tmpSelectMonth style='font-size: 12px' "
     s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' "
     s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";"
     s += "meizzTheMonth = this.value; meizzSetDay(meizzTheYear,meizzTheMonth)'>\r\n";
  var selectInnerHTML = s;
  for (var i = 1; i < 13; i++)
  {
    if (i == m)
       {selectInnerHTML += "<option value='"+i+"' selected>"+i+"��"+"</option>\r\n";}
    else {selectInnerHTML += "<option value='"+i+"'>"+i+"��"+"</option>\r\n";}
  }
  selectInnerHTML += "</select>";
  document.all.tmpSelectMonthLayer.style.display="";
  document.all.tmpSelectMonthLayer.innerHTML = selectInnerHTML;
  document.all.tmpSelectMonth.focus();
}
function closeLayer()           
  {
    document.all.meizzDateLayer.style.display="none";
  }
function document.onkeydown()
  {
    if (window.event.keyCode==27)document.all.meizzDateLayer.style.display="none";
  }
function IsPinYear(year)         
  {
    if (0==year%4&&((year%100!=0)||(year%400==0))) return true;else return false;
  }
function GetMonthCount(year,month)
  {
    var c=MonHead[month-1];if((month==2)&&IsPinYear(year)) c++;return c;
  }
function GetDOW(day,month,year)    
  {
    var dt=new Date(year,month-1,day).getDay()/7; return dt;
  }
function meizzPrevY() 
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;}
    else{alert("��ݳ���Χ��1000-9999����");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextY() 
  {
    if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;}
    else{alert("��ݳ���Χ��1000-9999����");}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzToday() 
  {
    meizzTheYear = new Date().getFullYear();
    meizzTheMonth = new Date().getMonth()+1;
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzPrevM() 
  {
    if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzNextM() 
  {
    if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++}
    meizzSetDay(meizzTheYear,meizzTheMonth);
  }
function meizzSetDay(yy,mm)
{
  meizzWriteHead(yy,mm);
  for (var i = 0; i < 37; i++){meizzWDay[i]=""};
  var day1 = 1,firstday = new Date(yy,mm-1,1).getDay(); 
  for (var i = firstday; day1 < GetMonthCount(yy,mm)+1; i++){meizzWDay[i]=day1;day1++;}
  for (var i = 0; i < 37; i++)
  { var da = eval("document.all.meizzDay"+i)   
    if (meizzWDay[i]!="")
      { da.innerHTML = "<b>" + meizzWDay[i] + "</b>";
        da.style.backgroundColor = (yy == new Date().getFullYear() &&
        mm == new Date().getMonth()+1 && meizzWDay[i] == new Date().getDate()) ? "#FFD700" : "#ADD8E6";
        da.style.cursor="hand"
      }
    else{da.innerHTML="";da.style.backgroundColor="";da.style.cursor="default"}
  }
}
function meizzDayClick(n) 
{
  var yy = meizzTheYear;
  var mm = meizzTheMonth;
  if (mm < 10){mm = "0" + mm;}
  if (outObject)
  {
    if (!n) {outObject.value=""; return;}
    if ( n < 10){n = "0" + n;}
    outObject.value= yy +"-"+ mm +"-"+ n +" ";
    closeLayer(); 
  }
  else {closeLayer(); alert("����Ҫ���Ŀؼ����󲢲����ڣ�");}
}
meizzSetDay(meizzTheYear,meizzTheMonth);