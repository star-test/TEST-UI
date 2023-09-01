<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="dbc"  class="com.bean.DBConn"  scope="page"/>
<style type="text/css">
<!--
.STYLE2 {font-size: 14px}
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
<center>
<table width=782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <tr bgcolor="#dddddd">
    <%
    String sql="select * from main_type";
    ResultSet rs=dbc.query(sql);
    while(rs.next()){
    %>
    <td width="400" height="25" align="center" bgcolor="#eeeeee">
    <span class="STYLE2">
    <a href="menu_index_top.jsp?t_type=<%=rs.getString("t_type") %>" >
    <%=rs.getString("t_type") %></a></span></td>
    <%
    }
    %>
    </tr>
</table>
</center>
