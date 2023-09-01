<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*,java.util.*" %>


<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
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

<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr bgcolor="#99CCFF">
    <td width="60" height="30" align="center"><span class="STYLE2">发布者</span></td>
    <td width="293" align="center"><span class="STYLE2">公告内容</span></td>
    <td colspan="2" align="center"><span class="STYLE2">操作</span></td>
  </tr>
   <%
   List<Notice> all=(List)session.getAttribute("all");
   if(all.size()!=0){
     for(int i=0;i<all.size();i++){
     %>
  <tr>
    <td height="46" rowspan="2" align="center"><img src="<%=all.get(i).getN_header() %>" /></td>
    <td height="15" colspan="3" align="left" valign="middle"> 
    <span class="STYLE1">[发布者] <%=all.get(i).getN_admin() %></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <span class="STYLE1">[发布时间] <%=all.get(i).getN_time() %></span></td>
    </tr>
  <tr>
    <td height="45" align="left" valign="middle">&nbsp;<span class="STYLE1"><%=all.get(i).getN_message() %></span></td>
    <td width="81" align="center"><span class="STYLE1">[ <a href="login7?op=look&n_id=<%=all.get(i).getN_id() %>">查看/修改</a> ]</span></td>
    <td width="56" align="center"><span class="STYLE1">[ <a href="login7?op=delete&n_id=<%=all.get(i).getN_id() %>">删除</a> ]</span></td>
  </tr>
  
  <%
     }
   }
  %>
   <tr>
    <td height="30" colspan="4" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1">4</span> 个记录,分<span class="STYLE1">1 </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1">1 </span>页
       
</p></td>
   </tr>
  </table>
</center>


