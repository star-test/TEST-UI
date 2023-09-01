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
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="66" height="30" align="center" bgcolor="#99CCFF" class="STYLE2">用户名</td>
    <td width="94" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">订单号</span></td>
    <td width="95" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">订单时间</span></td>
    <td width="77" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">总金额</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">操作</span></td>
    </tr>
    <%
    Orders od1=(Orders)session.getAttribute("od1");
    if(od1!=null){
    %>
  <tr>
    <td height="35" align="center" class="STYLE1"><%=od1.getOrder_user() %></td>
    <td height="32" align="center" class="STYLE1"><%=od1.getOrder_id() %></td>
    <td height="32" align="center" class="STYLE1"><span class="STYLE1"><%=od1.getOrder_time() %></span></td>
    <td align="center" class="STYLE1"><%=od1.getOrder_sum() %></td>
    <td width="107" height="32" align="center" class="STYLE1"><span class="STYLE1">[ <a href="login4?op=disp2&order_id=<%=od1.getOrder_id() %>">查看详细资料</a> ]</span></td>
    <td width="67" align="center" class="STYLE1"><span class="STYLE1">[ <a href="login4?op=delete&order_id=<%=od1.getOrder_id() %>">删除</a> ]</span></td>
  </tr>
 <%
    }
 %>
   <tr>
    <td height="30" colspan="7" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1">4</span> 个记录,分<span class="STYLE1"> 1 </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1">1 </span>页
      
</p></td>
   </tr>
</table>
</center>
