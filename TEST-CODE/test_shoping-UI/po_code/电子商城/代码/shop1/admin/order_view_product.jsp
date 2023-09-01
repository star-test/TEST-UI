<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;
}
-->
</style>
<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="6" align="center" bgcolor="#99CCFF" class="STYLE2">订单信息</td>
    </tr>
  <tr>
    <td height="35" colspan="6" align="left">&nbsp;&nbsp;
    <font size="2">订单号码</font>：&nbsp;<font size="2" color="#FF0000">34343</font></td>
    </tr>
  <tr>
    <td width="49" align="center" class="STYLE1">编号</td>
    <td width="83" height="30" align="center" class="STYLE1">商品号</td>
    <td width="145" align="center" class="STYLE1">商品名称</td>
    <td width="77" align="center" class="STYLE1">商品价格</td>
    <td width="62" align="center" class="STYLE1">商品数量</td>
    <td width="90" align="center" class="STYLE1">金额</td>
  </tr>
  
  <tr>
    <td height="30" align="center" class="STYLE2">1</td>
    <td height="30" align="center" class="STYLE2">3435355</td>
    <td height="30" align="center" class="STYLE2">海尔冰箱G232</td>
    <td height="30" align="center" class="STYLE2">4300</td>
    <td height="30" align="center" class="STYLE2">1</td>
    <td height="30" align="center" class="STYLE2">4300</td>
  </tr>
  
  <tr>
    <td height="33" colspan="6" align="right"><font size="2">合计金额</font>：
    <font size="3" color="red">￥4300</font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="30" colspan="6" align="center"><input type="button" class="STYLE1" onClick="window.location.href='order_all.jsp'" value=" 返回 " /></td>
    </tr>
</table>
</center>