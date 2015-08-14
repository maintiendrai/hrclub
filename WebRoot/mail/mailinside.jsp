<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<%@ page import="java.util.*,com.hrclub.to.*"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<script type="text/javascript" src="../js/ParamUtil.js"></script>
<script type="text/javascript" src="../js/prototype.js"></script>
<title>邮件管理</title>
<style type="text/css">
a      {
    color:#000000;
    text-decoration:none
}
a:visited{
    color:#000000;
}
a:hover{
    color:#FFFFFF;
    text-decoration:none;
    background-color:#33CCFF;
}
</style>
<script>
function showdiv(){ 
  if(!isChecked(document.myform.revkind)){
		alert("请选择接收人类型！");
		return false;
  }
  if(document.myform.isshow.value=="1"){
	  document.getElementById('search1').style.display="";  
	  document.getElementById('search1').style.left= document.myform.revID.getBoundingClientRect().left+ myform.revID.offsetWidth+ 20;
	  document.getElementById('search1').style.top=document.myform.revID.getBoundingClientRect().top -5;
	  
	  document.getElementById('search1').style.width=200;
	  document.getElementById('search1').style.height=300;
	 
  }
  if(document.myform.isshow.value=="2"){
	  document.getElementById('search2').style.display="";  
	  document.getElementById('search2').style.left= document.myform.revID.getBoundingClientRect().left+ myform.revID.offsetWidth+ 20;
	  document.getElementById('search2').style.top=document.myform.revID.getBoundingClientRect().top -5;
	  
	  document.getElementById('search2').style.width=200;
	  document.getElementById('search2').style.height=300;
	 
  }
}

function check1(){
  
  
  document.myform.isshow.value="1";
  
}

function check2(){
  
  
  document.myform.isshow.value="2";
  
}

function send1() {
      
      var hrids="";
      for(var i=0;i<document.myform.select1.length;i++)
      {
   	   
         if(document.myform.select1[i].checked==true)
         {  	
            	hrids=hrids+document.myform.select1[i].value+",";
         }	
      }
      document.myform.revID.value=hrids;
   
}

function send2() {    
      
      var itids="";
      for(var i=0;i<document.myform.select2.length;i++)
      {
   	   
         if(document.myform.select2[i].checked==true)
         {  	
            	itids=itids+document.myform.select2[i].value+",";
         }	
       }
       document.myform.revID.value=itids;
}

function hidedivSimple(){
  
  
  document.getElementById('search1').style.display="none";
  document.getElementById('search2').style.display="none";
  
}
function validator(){
   
   if(document.myform.revID.value==""){
    alert("接收人不能为空！");
    document.myform.revID.focus();
    return false;
   }
   
   if(document.myform.subject.value==""){
    alert("邮件主题不能为空！");
    document.myform.subject.focus();
    return false;
   }
   
   if(document.myform.context.value==""){
    alert("邮件内容不能为空！");
    document.myform.context.focus();
    return false;
   }
   
}
var checkedAll = false;
function selectAll(formName,checkboxName)
{
    var form = document.all.item(formName);
    var elements = form.elements[checkboxName];
    var ids = "";
    for (var i=0;i<elements.length;i++){ 
       var e = elements[i];
       if(checkedAll){
           e.checked = false;
           form.checked = false;
       } else {
           e.checked = true;
           form.checked = true;
           ids =ids+e.value+",";
       } 
    }
    document.myform.revID.value=ids;
    if(checkedAll){
       checkedAll = false;
       } else {
           checkedAll = true;
       }
} 
</script>
</head>

<body>
<%
  String puttime =(String) request.getAttribute("puttime");
  String sentID =(String) session.getAttribute("adminuserid");
  List hrID = (List) request.getAttribute("hrID"); 
  List itID = (List) request.getAttribute("itID"); 
%>
<form id="myform" name="myform" method="post" action="FrontController.do?operation=mailadd&method=add" onsubmit="return validator(this)">
<div id='search1' style='position:absolute;width:100;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);' >
<table width=100% align="center" border=0 cellSpacing=0 cellPadding=0 >
    <tr>
    <td align="right"><input type=button value=" 全选 " onclick="javascript:selectAll('myform','select1')" class="button"><input type=button value=" 确定 " onclick="javascript:hidedivSimple()" class="button"></td>
    </tr>
</table>
<table width=100% align="center" border=0 cellSpacing=0 cellPadding=0 >
<tr><td width="20%" align="center">选择</td><td width="50%" align="center">HR账号</td><td width="30%" align="center">姓名</td><tr>
<%  Iterator it=hrID.iterator();
    while(it.hasNext()){
    	HRinfoTO u =(HRinfoTO)it.next();
%>	<tr>
    <td width="20%" align="center"><input type=checkbox name="select1" value="<%=u.getHrID()%>" onclick="javascript:send1()"></td>
    <td width="50%" align="center"><%=u.getHrID()%></td>
    <td width="30%" align="center"><%=u.getName()%></td>
    </tr>
<%	}  %>
</table>
</div>
<div id='search2' style='position:absolute;width:100;height:400;z-index:10;display:none;background-color:white;overflow:auto;padding:1px;margin:1px;height:400px;border:2px solid #B5D0ED;scrollbar-face-color: #B5D0ED;filter:alpha(opacity=90);' >
<table width=100% align="center" border=0 cellSpacing=0 cellPadding=0 >
    <tr>
    <td align="right"><input type=button value=" 全选 " onclick="javascript:selectAll('myform','select2')" class="button"><input type=button value=" 确定 " onclick="javascript:hidedivSimple()" class="button"></td>
    </tr>
</table>
<table width=100% align="center" border=0 cellSpacing=0 cellPadding=0 >
<tr><td width="20%" align="center">选择</td><td width="50%" align="center">IT人才账号</td><td width="30%" align="center">姓名</td><tr>
<%  Iterator ite=itID.iterator();
    while(ite.hasNext()){
    	ITUserTO u =(ITUserTO)ite.next();
%>	<tr>
    <td width="20%" align="center"><input type=checkbox name="select2" value="<%=u.getUserid()%>" onclick="javascript:send2()"></td>
    <td width="50%" align="center"><%=u.getUserid()%></td>
    <td width="30%" align="center"><%=u.getName()%></td>
    </tr>
<%	}  %>
</table>
</div>	
<div id="contentborder" align="center">
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr><td><br></td></tr>
    <tr> 
		<td colspan=6 class="newline"></td>
	</tr>
	<tr> 
		<td colspan="2"  class="dvInnerHeader"><b>站内邮件</b></td>
		<td colspan="4"	align="right" class="dvInnerHeader">&nbsp;</td>
	</tr>
	<tr><td><br></td></tr>
</table>   
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
<input type=hidden name = "isshow" value="0">
<input type="hidden" name="time" value="<%=puttime%>"/>			
    <tr>
      <td width="130">发送人</td>
      <td><input type="hidden" name="sentID" value="<%=sentID%>"/>
          <%=sentID%>
      </td>
    </tr>
    <tr>
      <td width="80">接收人类型</td>
      <td>&nbsp;HR<input type=radio name="revkind" value="1" onclick="javascript:check1()"> &nbsp;IT人才<input type=radio name="revkind" value="2" onclick="javascript:check2()"></td>
    </tr>
    <tr>
      <td width="80">接收人</td>
      <td><input type="text" name="revID" onclick="javascript:showdiv()" style="width:230px"/></td>
    </tr>
    <tr>
      <td>邮件主题</td>
      <td><input type="text" name="subject" style="width:230px"/>
      </td>
    </tr>
    <tr>
      <td>邮件内容</td>
      <td><textarea name="context" rows="7" cols="50" value="" /></textarea></td>
    </tr>
    <tr><td><br></td></tr>
</table>
<table border=0 cellspacing=0 cellpadding=0 width="98%" class="small">
    <tr>
      <td colspan="2">
        <input type="submit" name="Submit" value=" 发送 " class="button"/>
        <input type="reset" name="reset" value=" 取消 " class="button" onclick="history.back();">
      </td>
    </tr>
</table>
</div>
</form>
</body>
</html>

