<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>电子商城</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<body>
<jsp:include page="title.jsp" flush="true"/>
<jsp:include page="menu.jsp" flush="true"/>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE5 {color: #FFFFFF}
.STYLE6 {font-size: 12px; color: #FF0000; }
-->
</style>
<script language="javascript">
<!-- 

	function login()
	{
		window.location.href='registry.jsp';
	}

 -->
</script>

<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="183" height="245" valign="top">
    <table width="183" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td width="183" height="7" align="left" valign="baseline"><jsp:include page="login.jsp" flush="true"/></td>
      </tr>
      <tr>
        <td height="7" align="center" valign="baseline"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="14" valign="top">
        <jsp:include page="Notice.jsp" flush="true"/></td>
      </tr>
    </table>
	  </td>
	
    <td width="588" rowspan="6" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="200" height="30" align="center" background="images/logo/back_new.gif"><span class="STYLE2">更多新品</span></td>
        <td width="359" align="right"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr></tr>
    </table><jsp:include page="top_more.jsp" flush="true"/></td>
  </tr>
</table>
</center>
<Br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>




