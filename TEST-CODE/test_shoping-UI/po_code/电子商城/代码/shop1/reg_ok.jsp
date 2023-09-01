<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="java.sql.*,javax.servlet.http.HttpServletRequest;" %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;
}
.STYLE11 {font-size: 18px; color: #FF0000; }
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
</style>
<jsp:include page="title.jsp" flush="true"/>

<br />
<%
String p=null;
p=(String)session.getAttribute("p");
String name=(String)session.getAttribute("cname");
String header=(String)session.getAttribute("cheader");
session.setAttribute("c_header",header);
if("n".equals(p)||p==null){
%>
<center>
<table width="782" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="295" height="181" align="right"><img src="images/logo/false.jpg" width="96" height="96" /></td>
    <td width="267" align="center"><span class="STYLE11">×¢²áÊ§°Ü.</span>
      <p><span class="STYLE1"><a href="registry.jsp">µã»÷·µ»Ø×¢²á</a></span></p></td>
    <td width="220" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>	
<%
}else if("y".equals(p)){
%>
<br />
<center>
<table width="782" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="291" height="181" align="right">
    <img src="images/logo/ok.gif" width="100" height="90" /></td>
    <td width="266" align="center"><p><span class="STYLE11">¹§Ï²!<%=name %> ×¢²á³É¹¦.</span></p>
      <p><span class="STYLE1"><a href="index.jsp">µã»÷·µ»ØµÇÂ½</a></span></p></td>
    <td width="217" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>
<%
}
%>
<br />
<jsp:include page="copyright.jsp" flush="true"/>