<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dbc" class="com.bean.DBConn"></jsp:useBean>
<html><head>
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
.STYLE3 {
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
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="6" align="center" bgcolor="#eeeeee" class="STYLE3">订单信息</td>
    </tr>
    <%
    String id=request.getParameter("order_id");
    String sql="select * from orderdetails where order_id='"+id+"'";
    ResultSet rs=dbc.query(sql);
    
    %>
  <tr>
    <td height="35" colspan="6" align="left">&nbsp;&nbsp;
    <font size="2">订单号码</font>：&nbsp;
    <font size="2" color="#FF0000"><%=id %></font></td>
    </tr>
  <tr>
    <td width="49" align="center" class="STYLE1">编号</td>
    <td width="83" height="30" align="center" class="STYLE1">商品号</td>
    <td width="145" align="center" class="STYLE1">商品名称</td>
    <td width="77" align="center" class="STYLE1">商品价格</td>
    <td width="62" align="center" class="STYLE1">商品数量</td>
    <td width="90" align="center" class="STYLE1">金额</td>
  </tr>
<%
int num=0;
float sum=0;
while(rs.next()){
	num++;
	String pid=rs.getString("p_id") ;
	float price=Float.parseFloat(rs.getString("p_price"));
	int number=Integer.parseInt(rs.getString("p_number"));
%>
  <tr>
    <td height="30" align="center" class="STYLE2"><%=num %></td>
    <td height="30" align="center" class="STYLE2"><%=pid%></td>
    <%
    String sql2="select p_name from product where p_id='"+pid+"'";
    ResultSet rs2=dbc.query(sql2);
    if(rs2.next()){
    %>
    <td height="30" align="center" class="STYLE2"><%=rs2.getString("p_name") %></td>
    <%
    }
    %>
    <td height="30" align="center" class="STYLE2"><%=price %></td>
    <td height="30" align="center" class="STYLE2"><%=number %></td>
    <td height="30" align="center" class="STYLE2"><%=price*number %></td>
  </tr>
 <%
 sum=sum+price*number;
}
 %>
  <tr>
    <td height="33" colspan="6" align="right">
    <font size="2">合计金额</font>：<font size="3" color="red">￥<%=sum %></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="30" colspan="6" align="center"><a href="javascript:window.close()" class="styleac">[关闭窗口]</a></td>
    </tr>
</table>
</center>
</body>
</html>
