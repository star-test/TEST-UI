<%@ page contentType="text/html;charset=gb2312" %>

<%@ page import="java.sql.*,com.bean.*,java.util.*" %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size: 14px;}
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
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">图片</span></td>
    <td width="135" height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">名称</span></td>
    <td width="99" align="center" bgcolor="#99CCFF"><span class="STYLE2">商品号</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">操作</span></td>
  </tr>
  <tr>
    <td height="14" colspan="5">&nbsp;</td>
  </tr>
 <%
    List<Product> all2=(List)session.getAttribute("all2");
    if(all2.size()!=0){
      for(int i=0;i<all2.size();i++){
      %>
  <tr>
    <td width="86" rowspan="3" align="center"><img src="../<%=all2.get(i).getP_image() %>" width="50" height="80"></td>
    <td height="25" colspan="4" align="center"><span class="STYLE2"><%=all2.get(i).getP_type() %></span></td>
  </tr>
  <tr>
    <td height="33" align="center"><span class="STYLE1"><%=all2.get(i).getP_name() %></span></td>
    <td height="25" align="center"><span class="STYLE1"><%=all2.get(i).getP_id() %></span></td>
    <td width="101" height="25" align="center"><span class="STYLE1">[ <a href="login6?op=look&p_id=<%=all2.get(i).getP_id() %>">查看/修改</a> ]</span></td>
    <td width="67" align="center"><span class="STYLE1">[ <a href="login6?op=delete&p_id=<%=all2.get(i).getP_id() %>">删除</a> ]</span></td>
  </tr>
  <tr>
    <td height="14" colspan="4" bgcolor="#99CCFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="12" colspan="5">&nbsp;</td>
    </tr>
<%
      }
    }
%>
  <tr>
    <td height="30" colspan="5" align="center"></td>
   </tr>
</table>
</center>
	