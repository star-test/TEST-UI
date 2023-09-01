<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*" %>
<jsp:useBean id="dbc"  class="com.bean.DBConn"  scope="page"/>
<html>
<head><title>电子商务</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;}
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
.STYLE4 {
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
<%
String  pid=request.getParameter("p_id");
String sql="select * from product where p_id='"+pid+"'";
ResultSet rs=dbc.query(sql);
if(rs.next()){
	double price=Double.parseDouble(rs.getString("p_price"));
	double oldprice=price*1.2;
%>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="3" align="center" bgcolor="#eeeeee"><span class="STYLE4">商品详细信息</span></td>
    </tr>
  <tr>
    <td width="127" height="30" align="center"><span class="STYLE1">商品类型</span>：</td>
    <td height="30" colspan="2" class="STYLE2">&nbsp;<%=rs.getString("p_type") %></td>
    </tr>
  <tr>
    <td width="127" height="30" align="center"><span class="STYLE1">商品ID</span>：</td>
    <td width="238" height="30" class="STYLE2">&nbsp;<%=rs.getString("p_id") %></td>
    <td width="127" height="30" rowspan="4" align="center" valign="middle">
    <a href="#" onClick="window.open('view_picture.jsp?p_image=<%=rs.getString("p_image") %>','help','scrollbars=yes,resizable=yes,width=600,height=400')">
    <img src="<%=rs.getString("p_image") %>" width="50"/></a><span class="STYLE1"><br>
      单击图片看大图</span></td>
  </tr>
  <tr>
    <td width="127" height="30" align="center"><span class="STYLE1">商品名称</span>：</td>
    <td height="30" class="STYLE2">&nbsp;<%=rs.getString("p_name") %>
    <a href="menu_index_down.jsp"></a></td>
    </tr>
  <tr>
    <td width="127" height="30" align="center"><span class="STYLE1">商品原价</span>：</td>
     <td height="30" align="left" style="text-decoration:line-through;color:#FF0000">
	<font size="2">&nbsp;￥<%=oldprice %>&nbsp;</font> </td>
    </tr>
  <tr>
    <td width="127" height="30" align="center"><span class="STYLE1">商品现价</span>：</td>
    <td height="30" class="STYLE2">&nbsp;<font size="2" color="red">￥<%=price %></font></td>
    </tr>
  
  <tr>
    <td width="127" align="center"><span class="STYLE1">商品描述</span>：</td>
    <td height="30" colspan="2"><textarea name="p_description" cols="45" rows="12"><%=rs.getString("p_description")%></textarea></td>
  </tr>
  <tr class="STYLE2">
    <td height="40" colspan="3" align="center"><a href="javascript:window.close()" class="styleac">[关闭窗口]</a></td>
  </tr>
</table>
</center>
</body>
<%
}
%>
</html>