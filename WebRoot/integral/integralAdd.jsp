<%@ page language="java" pageEncoding="GBK" contentType="text/html; charset=GBK"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../adminindex/table.css">
<title>���ֹ���</title>
</head>

<body>
<form id="form" name="form" method="post" action="FrontController.do?option=integraladd">
<input type="hidden" name="operation"  value="integraladd"/>
  <p align="center" class="STYLE1">���ӻ���</p>
  <table width="290" height="175" border="0" align="center">
    <tr>
      <td width="80">HR�ʺ�</td>
      <td width="131"><input type="text" name="hrID" /></td>
    </tr>
    <tr>
      <td>���ӵĻ�����</td>
      <td><input type="text" name="num" /></td>
    </tr>
        
    <tr>
      <td colspan="2"><div align="center">
        <input type="submit" name="Submit" value="����" class="button"/>
        <input type="reset" name="reset" value="ȡ��" class="button" onclick="history.back();">
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
