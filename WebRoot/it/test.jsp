<%@ page language="java" import="java.util.*,com.hrclub.to.ITskillTO"
	pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
	<head>
		

		<title>My JSP 'test.jsp' starting page</title>



	</head>
<body>

<% 
         // String userid = (String) session.getAttribute("userid");
		//	List listc = new ArrayList();
      //      listc=helper.getITskill(userid);
		//	List list = helper.getITskillcomf();
			HashMap com = new HashMap();
		HashMap languages = new HashMap();
		languages.put("1","Ӣ��");
		languages.put("2","����");
		languages.put("3","����");
		languages.put("4","����");
		languages.put("5","����");
		languages.put("6","������");
		languages.put("7","������");
		languages.put("8","������");
		languages.put("9","����");
		
		languages.put("10","��");	
		com=helper.getCallingcomf();
			
		//	HashMap commands = new HashMap();
		//commands=helper.getLanguage();
       
	//out.print(commands.get("3"));
			
			out.println(tb.getMapSelect("asd",com,null));
			%>


		<form name="form1" method="post" action="it/test2.jsp">
			
			<table>
				<tr>
					<td>
						ʡ��
					</td>
					<td width="140" class="SELECT">
						<select name="province" id="country"
							onChange="change_region( &#13;&#10;       window.document.form1.city , &#13;&#10;       window.document.form1.country.options[selectedIndex].value );">
							<option value="Not set" selected>
								-- ����ʡ�� --
							</option>
							<script language="javascript">
        set_select_options( window.document.form1.country, country, "" ) ;
						</script>
						</select>
					</td>
				</tr>
				<tr>
					<td>
						����
					</td>
					<td class="SELECT">
						<div align="left">
							<select name="city"
								onChange="change_region( &#13;&#10;        window.document.form1.city , &#13;&#10;        window.document.form1.state.options[selectedIndex].value );">
								<option value="Not set" selected>
									-- ��������--
								</option>
							</select>
						</div>
					</td>
				</tr>
			
	
				<tr>
					<td>
						ѧλ
					</td>
					<td>
						<select name="degree" id="degree">
							<option value="Not set" selected>
								-- ������ --
							</option>
							<script language="javascript">
       set_select_options( window.document.form1.degree , degree , "" ) ;
						</script>
						</select>
					</td>
				</tr>
		
			
			
			</table>
			
			 <input type="submit" name="logon" value="��¼">
			</form>
	</body>
</html>
