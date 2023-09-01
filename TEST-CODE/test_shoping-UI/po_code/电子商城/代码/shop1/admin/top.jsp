<%@ page contentType="text/html;charset=GB2312" %>

<%@ page import="java.sql.*,com.bean.*"%>

<style type="text/css">
<!--

.STYLE1 {font-size: 12px;}
.STYLE2 {
	font-size: 14px;
}

-->
</style>
<%
Admin ad2=(Admin)session.getAttribute("ad");
if(ad2!=null){
%>
<center>
<table width="782" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="782" height="75" valign="top"><table width="100%" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td width="540" height="75" rowspan="3"><img src="images/logo/logo.png" width="548" height="116" /></td>
        <td width="117" height="61" align="center"><img src="<%=ad2.getA_header() %>" width="32" height="32" /></td>
        <td width="117" height="61" align="left"><span class="STYLE2"><font color=red><b><%=ad2.getA_name() %></b></font></span></td>
      </tr>
      <tr>
        <td height="19" colspan="2" align="center" class="STYLE1"> <a href="../index.jsp">返回　电子商城前台</a> </td>
        </tr>
      <tr>
        <td height="28" colspan="2" align="center" background="images/logo/1.JPG" class="STYLE1"><a href="exit.jsp">退出 电子商城 </a></td>
        </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="14">&nbsp;</td>
  </tr>
</table>
</center>
<%
}
%>

