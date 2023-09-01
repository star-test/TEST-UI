<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="dbc"  class="com.bean.DBConn"  scope="page"/>
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
.STYLE3 {
	font-size: 36px;
	font-family: "创艺简行楷";
	color: #000099;
}
-->
</style>
<script>
	<!--
		function check_message(form)
		{
			if(form.c_message.value=="")
			{
				alert("请填写意见或者建议");
				form.c_message.focus();
				return false;
			}
		}
	-->
</script>
<%
String c_name=(String) session.getAttribute("c_name");
String sql="select * from customer where c_name='"+c_name+"'";
ResultSet rs=dbc.query(sql);
if(rs.next()){
%>

<center>
<form action="message_send_ok.jsp" method="post" onsubmit="return check_message(this);">
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr bgcolor="#99CCFF">
        <td height="30" colspan="3" align="center" bgcolor="#eeeeee"><span class="STYLE3">发表意见与建议</span></td>
      </tr>
      <tr>
        <td height="20" colspan="3" align="center" ><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="20" colspan="3" align="left" >&nbsp;<span class="STYLE2"><b>联系方式</b></span><p>&nbsp;<span class="STYLE2">地址</span>：<%=rs.getString("c_address") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE2">邮编</span>：<span class="STYLE2">330008</span>&nbsp;</p>
        <p>&nbsp;<span class="STYLE2">电话</span>：<span class="STYLE2"><%=rs.getString("c_phone") %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="STYLE2">E_mail</span>：<span class="STYLE2"><a href="mailto:tangzy111@163.com"><%=rs.getString("c_email") %></a></span></p></td>
      </tr>
      <tr>
        <td colspan="3" align="left" >&nbsp;</td>
      </tr>
      

      <tr>
        <td width="135" height="101" align="center">
		<p><img src="<%=rs.getString("c_header") %>" width="32" height="32" /></p>
		<p>
		<span class="STYLE5"><%=rs.getString("c_name") %></span></p>
		</td>
        
        <td align="left"><textarea name="c_message" rows="8" cols="80"></textarea></td>
      </tr>
      <tr bgcolor="#99CCFF">
        <td height="17" colspan="2" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      
      <tr>
        <td height="40" colspan="3" align="center"><input type="submit" class="STYLE1" value="发表意见" />
&nbsp;          <input type="reset" class="STYLE1" value=" 返回 " onclick="window.location.href='index.jsp'" /></td>
      </tr>
    </table>
  </form>
</center>
<%
}
%>