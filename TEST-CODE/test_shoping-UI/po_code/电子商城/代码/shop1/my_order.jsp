<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dbc" class="com.bean.DBConn"></jsp:useBean>
<html>
<head>
<title>电子商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2{
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
.STYLE10 {
	font-size: 36px;
	font-family: "创艺简行楷";
	color: #000099;
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
          <td width="183" align="center" valign="top"><jsp:include page="login.jsp" flush="true"/></td>
          <td width="602" valign="top"><table width="100%"  border="0" bordercolor="#99CCFF" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
                      <tr>
                        <td height="14" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="37" align="center" bgcolor="#eeeeee"><span class="STYLE10">我的订单</span></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
<center>
<table width="96%" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="80" height="30" align="center" bgcolor="#FFFFFF" class="STYLE2">用户名</td>
    <td width="127" align="center" bgcolor="#FFFFFF" class="STYLE2">订单号</td>
    <td width="141" align="center" bgcolor="#FFFFFF" class="STYLE2">订单时间</td>
    <td width="83" align="center" bgcolor="#FFFFFF" class="STYLE2">总金额</td>
    <td width="126" align="center" bgcolor="#FFFFFF" class="STYLE2">操作</td>
    </tr>
    <%
    String c_name=(String) session.getAttribute("c_name");
    String sql="select * from orders where order_user='"+c_name+"'";
    ResultSet rs=dbc.query(sql);
    while(rs.next()){
    %>
  <tr>
    <td height="35" align="center" class="STYLE2"><%=rs.getString("order_user") %></td>
    <td height="32" align="center" class="STYLE2"><%=rs.getString("order_id") %></td>
    <td height="32" align="center" class="STYLE2">
    <span class="STYLE2"><%=rs.getString("order_time") %></span></td>
    <td align="center" class="STYLE2">￥<%=rs.getString("order_sum") %></td>
    <td height="32" align="center" class="STYLE1">
    <span class="STYLE1">[ <a href="#" title="预览" onClick="window.open('my_order_product.jsp?order_id=<%=rs.getString("order_id") %>','help','scrollbars=yes,resizable=yes,width=650,height=300')">查看详细资料</a> ]</span></td>
    </tr>
 <%
    }
 %>
   <tr>
    <td height="30" colspan="6" align="center">
    <p align="center" class="STYLE1">共 <span class="STYLE1">2</span> 个记录,分<span class="STYLE1">2 </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1">1 </span>页
   
</p></td>
   </tr>
</table>
</center>
<table width="100%" height="42" border="0" bordercolor="#99CCFF" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td width="74%" height="21" class="tableBorder_B1">&nbsp;</td>
        <td width="26%" height="21" colspan="-3" align="left" class="tableBorder_B1"></td>
      </tr>
      <tr align="center" valign="middle">
        <td height="21" colspan="2"><input type="button" class="STYLE1" value=" 返回购物 " onClick="window.location.href='index.jsp'"/></td>
        </tr>
</table>						</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
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
