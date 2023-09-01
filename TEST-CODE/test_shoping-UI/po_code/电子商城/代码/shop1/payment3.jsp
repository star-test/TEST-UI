<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<html>
<head><title>电子商城</title>
<style type="text/css">
<!--
.STYLE3 {color: #FF0000; font-size: 12px; }
.STYLE10 {
			font-size: 14px;
			color: #FF0000;
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body>

		<br /><br /><br /><br /><br /><br /><br /><br />
		<center>
		 <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
		<!--DWLayoutTable-->
			<tr bgcolor="#99CCFF">
				<td height="13">&nbsp;</td>
			</tr>
			<tr>
				<td height="60" align="center"><span class="STYLE10">订单发送成功<span class="STYLE3">！</span></span></td>
			</tr>
		</table>
		</center>
       <%
       response.setHeader("refresh","1;url=message.jsp");
       %>
</body>
</html>