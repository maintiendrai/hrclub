<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>主要城市</title>
		<%%>
	</head>
	<body>

		<table>
		<tr><td> 主要城市招聘信息</td>
		</tr>
			<tr>
				<td>
					华北-东北
				</td>
				<td>
		    <a href="byaddress.do?operation=byaddress&pageNum=1&city=0">北京</a>	
			<a href="byaddress.do?operation=byaddress&pageNum=1&city=2">天津</a>	
			<a href="byaddress.do?operation=byaddress&pageNum=1&city=231">大连</a>	
			<a href="byaddress.do?operation=byaddress&pageNum=1&city=222">沈阳</a>  
			<a href="byaddress.do?operation=byaddress&pageNum=1&city=212">长春</a>     
			<a href="byaddress.do?operation=byaddress&pageNum=1&city=61">哈尔滨</a>  
			  
				</td>
			</tr>
			<tr>
				<td>
					华东-地区
					      
				</td>
				<td><a href="byaddress.do?operation=byaddress&pageNum=1&city=1">上海</a>  
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=185">南京</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=197">苏州</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=366">杭州</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=370">宁波</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=196">无锡</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=22">福州</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=27">厦门</a> 
					<a href="byaddress.do?operation=byaddress&pageNum=1&city=272">青岛</a> 
				</td>
			</tr>
			<tr>
				<td>
					华南-华中
				</td>
				<td>
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=75">广州</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=86">深圳</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=85">东莞</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=142">武汉</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=160">长沙</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=123">郑州</a> 
			    
				</td>
			<tr>
				<td>
					西北-西南
				</td>
				<td>
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=294">西安</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=305">成都</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=3">重庆</a> 
				<a href="byaddress.do?operation=byaddress&pageNum=1&city=349">昆明</a> 
				<a href="<%=request.getContextPath() %>/job/simresult.do?operation=showalljob&pageNum=1">全国/其他</a> 
			
				     
				</td>
			</tr>




		</table>

	</body>
</html>
