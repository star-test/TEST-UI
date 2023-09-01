<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*" %>

<jsp:include page="top.jsp" flush="true"/>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电子商城</title>
<style type="text/css">
<!--

.STYLE1 {
	font-size: 12px;
}

.STYLE2 {
	font-size: 14px;
}
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

-->
</style>
</head>

<body>
<%
Admin ad1=(Admin)session.getAttribute("ad");
if(ad1!=null){
%>
<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="146" height="30" align="center"><span class="STYLE2">当前管理员</span>：<span class="STYLE2">
    <font color="#FF0000"><b><%=ad1.getA_name() %></b></font></span></td>
    <td width="102" align="center"><span class="STYLE2">公告栏</span>：</td>
    <td width="504" align="center"><table width="90%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="454" height="28"><marquee scrolldelay="5" scrollamount="2" bgcolor="#FFFFFF" onMouseOver="this.stop();" onMouseOut="this.start();">
      <span class="STYLE2"><font color=red>2014年端午节放假了，全场商品打2折！</font></span></marquee></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="476" colspan="3" valign="top"><table width="100%" height="383" border="0" align="right" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="782" height="383"><iframe src="index1.jsp" width="782" height="550"> </iframe></td>
        </tr>
    </table></td>
    </tr>
</table>
</center>
<%
}
%>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>

