<%@ page language="java" contentType="text/html; charset=gb2312"%> 
<style type="text/css">
<!--
.STYLE10 {
	font-size: 14px;
	color: #FF0000;
}
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>

<br /><br /><br /><br /><br /><br /><br /><br />
<center>
	  <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
	  <!--DWLayoutTable-->
	  <tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	    </tr>
	  <tr>
		<td height="60" align="center"><span class="STYLE10">�����˳������Ժ�...</span></td>
	    </tr>
   </table>
</center>
<%
session.removeAttribute("c_name");
session.removeAttribute("c_header");
response.setHeader("refresh","1;url=index.jsp");
%>

