<%@ page language="java" import="com.hrclub.to.*,java.util.*"
	contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
	<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder"
	scope="page" />
	<html>

<head>
		<link href="<%=request.getContextPath()%>/css/index.css" rel="stylesheet" type="text/css" />
	

		<script
			src='<%=request.getContextPath()%>/js/country/change_region.js'> </script>
		<script
			src='<%=request.getContextPath()%>/js/datepicker/WdatePicker.js'> </script>
		<script src='<%=request.getContextPath()%>/js/ParamUtil.js'> </script>
	<title>�༭������������</title>

<script> 

function jscheckform(){


 
  
  if(document.checkform.compname.value==""){
    alert("���������ڹ�˾���ƣ�");
    document.checkform.compname.focus();
    return false;
  }
  if(document.checkform.starttime.value==""){
    alert("�뿪ʼʱ�䣡");
    document.checkform.starttime.focus();
    return false;
  }
  if(document.checkform.levertime.value==""){
    alert("���뿪ʱ�䣡");
    document.checkform.levertime.focus();
    return false;
  }
  
  if(confirm('��ȷ��Ҫ�޸Ĺ�������')){
 	
 	 document.checkform.submit();
  }
}

 </script>
</head>

<body>

	<%
	
	HashMap list= helper.getJobcomf();
	String workids = request.getParameter("workID");
	
	int workid=Integer.parseInt(workids);

	WorkexperienceTO to=new WorkexperienceTO();
	to = helper.getWorkByWordID(workid);
	
	%>
		<div align="center"><script language="javascript" type="text/javascript" src="/hrclub/js/top.js"></script></div>

	 <table align="center" width="700">
   <tr>
   <td width="100"  valign="top">
<iframe  height="550" frameborder="0" scrolling="no" src="<%=request.getContextPath()%>/itforntop.jsp"></iframe>
   </td><td width="558" valign="top">
   <table  align="center">
						 <tr>
        <td height="60" valign="middle" class="top01" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="36" valign="top" class="titile">���������༭</td>
          </tr>
        </table></td>
      </tr>
				<tr>
							<td class="text">
								<table  height="192" border="0" align="center">
	<form  name="checkform" method="post" action="upwork.do">
			<table align="center">
				<tr>
					<td>
						�����ص�
					</td>
					<td>
						<input type="text" name="address"  value=<%=to.getAddress() %> />
					</td>
				</tr>
				<tr>
					<td>
						���ڹ�˾����
					</td>
					<td>
						<input type="text" name="compname" value=<%=to.getCompname()%> />
					</td>
				</tr>
				<tr>
					<td>
						���ڹ�˾����
					</td>
					<td>
						<select name="comkind" >
							<option <%if(to.getComkind()==1) out.print("selected"); %> value="1">
								������ҵ
							</option>
							<option <%if(to.getComkind()==2) out.print("selected"); %> value="2">
								˽Ӫ��ҵ
							</option>
							<option <%if(to.getComkind()==3) out.print("selected"); %> value="3">
								���ʶ�����ҵ
							</option>
							<option <%if(to.getComkind()==4) out.print("selected"); %> value="4">
								���������ҵ
							</option>
							<option  <%if(to.getComkind()==0) out.print("selected"); %> value="0">
								����
							</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						����ְλ
					</td>
					<td>
						
						<% out.println(tb.getSelect("place",list,helper.getJobcomf(to.getPlace()),to.getPlace())); %>
					</td>
				</tr>
				<tr>
					<td>
						��ʼʱ��
					</td>
					<td>
						<input id="htStart" name="starttime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MAXDATE="$htEnd"  value=<%=to.getStarttime() %> >
					</td>
				</tr>
				<tr>
					<td>
						��ְʱ��
					</td>
					<td>
						<input id="htEnd" name="levertime" type="text" class="Wdate"
							onfocus="new WdatePicker(this)" MINDATE="$htStart"
							MAXDATE="2020-1-1" value=<%=to.getLevertime() %> >
					</td>
				</tr>
				<tr>
					<td>
						�������
					</td>
					<td>
						<textarea name="info" cols="50" rows="10"><%=to.getInfo() %></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					
							
							   <input type="hidden" name="workID" value="<%=workid %>"/>
								<input type="hidden" name="operation" value="upwork" />
								<input type=button name="Submit" class=btn1_mouseout onmouseover="this.className='btn1_mouseover'"
             onmouseout="this.className='btn1_mouseout'" value="�޸Ĺ�������" onClick="jscheckform();" />
						
					
					</td>
				</tr>
				
			</table>
			
					  <tr>
        <td><img src="<%=request.getContextPath()%>/images/main_3.gif" width="558" height="36" alt="" /></td>
      </tr>
			</table>
			
		</form>
		</td>
		</tr>
		</table>



 <div align="center"><script language="javascript" type="text/javascript" src="<%=request.getContextPath()%>/js/down.js"></script></div>
	</body>
</html>
