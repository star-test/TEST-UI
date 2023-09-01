<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.bean.*"%>
<%

	String c_name=(String)session.getAttribute("c_name");
	String c_header=(String)session.getAttribute("c_header");
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	else
	{
		DBConn conn=new DBConn();
		Vector cart=(Vector)session.getAttribute("cart");
		if(cart==null || cart.size()==0)
		{
	%>
<html>
<head>
<title>电子商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE9 {
	font-size: 16px;
	color: #FF0000;
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
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
</head>
<body>
<jsp:include page="title.jsp" flush="true"/>
<jsp:include page="menu.jsp" flush="true"/>
<center>
<table width="782"  border="1" bordercolor="#99CCFF" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
        <tr>
          <td width="183" align="center" valign="top">
          <jsp:include page="login.jsp" flush="true"/></td>
          <td width="602" valign="top">
          <table width="100%"  border="0" bordercolor="#99CCFF" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="14" colspan="5" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td width="2%" height="37" align="center">&nbsp;</td>
                        <td width="43%" height="34" align="center" bgcolor="#99CCFF">
                        <font size="3">我的购物车</font></td>
                        <td width="53%" align="center" bgcolor="#99CCFF">&nbsp;</td>
                        <td width="2%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">
<form method="post" action="cart_modify.jsp" name="form1">
<table width="96%" height="56" border="1" bordercolor="#99CCFF" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td width="33" height="27" class="tableBorder_B1"><font size="2">编号</font></td>
        <td width="114" height="27" class="tableBorder_B1"><font size="2">商品编号</font></td>
        <td width="219" class="tableBorder_B1"><font size="2">商品名称</font></td>
        <td width="62" height="27" class="tableBorder_B1"><font size="2">单价</font></td>
        <td width="42" height="27" class="tableBorder_B1"><font size="2">数量</font></td>
        <td width="68" height="27" class="tableBorder_B1"><font size="2">金额</font></td>
        <td width="39" class="tableBorder_B1">&nbsp;</td>
      </tr> 
      <tr align="center" valign="middle">
        <td height="27" colspan="7">&nbsp;</td>
        </tr>
      </table>
	  </form>
<table width="100%" height="125" border="0" bordercolor="#99CCFF" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
		<td width="76%" height="52">		
		<span class="STYLE9">您没有购买任何商品!</span></td>
        <td width="24%" height="52" colspan="-3" align="left">&nbsp;</td>
		</tr>
      <tr align="center" valign="middle">
        <td height="21" class="tableBorder_B1">　</td>
        <td height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"><input type="button" class="STYLE1" value=" 返回购物 " onClick="window.location.href='index.jsp'"/></td>
        </tr>
</table>						</td>
                      </tr>
                      <tr>
                        <td colspan="5">&nbsp;</td>
                      </tr>
          </table>          </td>
        </tr>
      </table>
</td>
  </tr>
</table>
</td>
</tr>
</table>
</center>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%conn.closeDB();
}
}%>