<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*,java.util.*" %>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
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
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="35" colspan="4" align="center" bgcolor="#99CCFF"><span class="STYLE2">主面板</span></td>
  </tr>
 <%
    List<Main_type> all=(List)session.getAttribute("all");
    if(all.size()!=0){
      for(int i=0;i<all.size();i++){
      %>
	
  <tr>
    <td width="40" height="40" align="center" class="STYLE1"><%=all.get(i).getT_id() %></td>
    <td width="290" align="center"><span class="STYLE2"><%=all.get(i).getT_type()%></span></td>
    <td width="70" align="center"><span class="STYLE1">[ <a href="login5?op=modify&t_id=<%=all.get(i).getT_id() %>">修改</a> ]</span></td>
    <td width="70" align="center"><span class="STYLE1">[ <a href="login5?op=delete&t_id=<%=all.get(i).getT_id() %>">删除</a> ]</span></td>
  </tr>
  <%
      }
    }
  %>
  <tr>
    <td height="21" colspan="4" align="right"><span class="STYLE1"><a href="type_add.jsp">添加新面板</a></span>&nbsp;</td>
  </tr>
  <tr>
    <td height="30" colspan="4" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1">4</span> 个记录,分<span class="STYLE1"> 1 </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1">1 </span>页
       
</p></td>
  </tr>
</table>
</center>
