<%@ page language="java"
	import="java.util.*,com.hrclub.to.CertificateTO" pageEncoding="gbk"%>

<jsp:useBean id="helper" class="com.hrclub.view.ViewHelper"
	scope="application" />
<jsp:useBean id="tb" class="com.hrclub.view.TableBuilder" scope="page" />
<html>
  <head>
  	<%
				HashMap list = helper.getJobcomf();
			%>
    
    <title>职位列表</title>
    


  </head>
  
  <body>
      <table width="80%" height="77"  border="0" align="center" cellpadding="-2" cellspacing="-2">
          <tr>
            <td height="13"></td>
          </tr>

		  <script language="javascript">
		  function action(user){
		  	parent.window.returnValue=user;
			window.close();
		  }
		  </script>
		  <% for (int i=0;i<list.size();i++){ %>
          <tr>
            <td height="25" valign="top"><a href="#" onClick="action('<%=list.get(i+1)%>')"><%=list.get(i+1)%></a></td>
	
		
          </tr>
		 
        		<%} %>
      </table>
  </body>
</html>
