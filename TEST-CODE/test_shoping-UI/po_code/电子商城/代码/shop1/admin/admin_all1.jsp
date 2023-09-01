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
    <td width="54" height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">头像</span></td>
    <td width="88" align="center" bgcolor="#99CCFF"><span class="STYLE2">账号</span></td>
    <td width="99" align="center" bgcolor="#99CCFF"><span class="STYLE2">联系电话</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">操作</span></td>
    </tr>
    <%
    List<Admin> all2=(List)session.getAttribute("all2");
    if(all2.size()!=0){
      for(int i=0;i<all2.size();i++){
      %>
  <tr>
    <td height="46" align="center">
    <img src="<%=all2.get(i).getA_header() %> "></td>
    <td height="46" align="center"><span class="STYLE2"><%=all2.get(i).getA_name() %></span></td>
    <td height="46" align="center"><span class="STYLE2"><%=all2.get(i).getA_phone() %></span></td>
    <td width="149" height="46" align="center">
    <span class="STYLE1">[ <a href="login2?op=look2&admin_name=<%=all2.get(i).getA_name() %>">查看/修改资料</a> ]</span></td>
    <td width="98" align="center"><span class="STYLE1">[ <a href="login2?op=delete2&admin_name=<%=all2.get(i).getA_name() %>">删除</a> ]</span></td>
  </tr>
  <%
     }
    }
  %>
   <tr>
    <td height="30" colspan="5" align="center">
    <p align="center" class="STYLE1">共 <span class="STYLE1">3</span> 个记录,分
    <span class="STYLE1">1 </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1">1 </span>页
     
</p></td>
   </tr>
</table>
</center>