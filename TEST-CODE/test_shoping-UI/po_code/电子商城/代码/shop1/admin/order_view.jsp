<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*" %>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px}
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
<body>
<%
Orders od=(Orders)session.getAttribute("od");
if(od!=null){
%>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="2" align="center" bgcolor="#99CCFF" class="STYLE2">订单信息</td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单人姓名</span>：</td>
    <td width="331" height="35">&nbsp;<font size="2"><%=od.getOrder_user() %></font></td>
  </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单号码</span>：</td>
    <td height="35">&nbsp;<font size="2"><%=od.getOrder_id() %></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <font size="2"><a href="order_view_product.jsp?o_id=323234">查看所订购的商品</a></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单人地址</span>：</td>
    <td height="35">&nbsp;<font size="2"><%=od.getOrder_address() %></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单人E_mail</span>：</td>
    <td height="35">&nbsp;<font size="2"><%=od.getOrder_email() %></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单总额</span>：</td>
    <td height="35">&nbsp;<font size="2"><%=od.getOrder_sum() %></font></td>
    </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">订单时间</span>：</td>
    <td height="30">&nbsp;<font size="2"><%=od.getOrder_time() %></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">采取付款方式</span>：</td>
    <td height="30">&nbsp;<font size="2"><%=od.getOrder_payment() %></font></td>
  </tr>
  <tr>
    <td align="right">&nbsp;<span class="STYLE1">是否完成交易</span>：</td>
    <td height="30"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="center"><input type="button" class="STYLE1" onClick="history.go(-1);" value=" 返回 " /></td></tr>
</table>
</center>
<%
}
%>
