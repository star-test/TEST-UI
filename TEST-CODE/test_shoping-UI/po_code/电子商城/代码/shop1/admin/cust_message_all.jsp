<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*,java.util.*" %>


<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px; }
.STYLE3 {color: #FF0000}
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
    <td width="62" height="30" align="center"><span class="STYLE2">留言者</span></td>
    <td width="324" align="center"><span class="STYLE2">意见与建议</span></td>
    <td colspan="2" align="center"><span class="STYLE2">操作</span></td>
  </tr>
    <%
   List<Idea> all=(List)session.getAttribute("all");
   if(all.size()!=0){
     for(int i=0;i<all.size();i++){
     %>
	
     <tr>
       <td rowspan="2" align="center"><p><img src="<%=all.get(i).getC_header() %>"></p></td>
       <td height="15" colspan="3" align="left" valign="middle"><span class="STYLE1">
       [留言者]&nbsp;&nbsp;<%=all.get(i).getC_name() %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE1">
       [发表时间]&nbsp;&nbsp;</span> <span class="STYLE1"><%=all.get(i).getNew_time() %></span></td>
     </tr>
    <tr>
      <td height="45" colspan="3" align="left" valign="middle"><span class="STYLE1">[留言]</span>
      <span class="STYLE1">&nbsp;&nbsp;<%=all.get(i).getNew_message() %></span></td>
    </tr>
  <tr>
    <td height="45" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td height="45" align="left" valign="middle"><span class="STYLE1">[<span class="STYLE3">
    回复</span>]&nbsp;&nbsp;<%=all.get(i).getRe_message() %>&nbsp;&nbsp;[<%=all.get(i).getRe_time() %>]</span></td>
    <td width="58" align="center"><span class="STYLE1">[ <a href="cust_message_return.jsp?id=<%=all.get(i).getId() %>">回复</a> ]</span></td>
    <td width="58" align="center"><span class="STYLE1">[ <a href="login8?op=delete&id=<%=all.get(i).getId() %>">删除</a> ]</span></td>
  </tr>
  <%
     }
   }
  %>
   <tr>
    <td height="30" colspan="4" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1">4</span> 个记录,分<span class="STYLE1"> 1 </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1">1 </span>页
        
</p></td>
   </tr>
  </table>
</center>


