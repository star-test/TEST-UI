<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*,com.bean.*" %>
<jsp:useBean id="dbc"  class="com.bean.DBConn"  scope="page"/>
<style type="text/css">
<!--
.STYLE10 {
	font-size: 14px;
	color: #FF0000;
}
.STYLE3 {color: #FF0000; font-size: 12px; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
<br /><br /><br /><br /><br /><br /><br /><br />
<%
int a=(int)(Math.random()*989+10);
String id=a+"";
String c_name=(String) session.getAttribute("c_name");
String c_header=(String) session.getAttribute("c_header");
String mes1=request.getParameter("c_message");
Convert con=new Convert();
String mes=con.method(mes1);
Date time=new Date();
String retime=(time.getMonth()+1)+"-"+(time.getDate())+"-"+(time.getYear()+1900);
String sql="insert into idea(id,c_name,c_header,new_message,new_time) values('"+id+"','"+c_name+"','"+c_header+"','"+mes+"','"+retime+"')";
int m=dbc.add(sql);
if(m!=0){
%>
<center>
 <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->
	<tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	</tr>
	<tr>
	<td height="57" align="center">
	<span class="STYLE10">发表成功<span class="STYLE3">！</span></span></td>
	</tr>
</table>
</center>
<%
}else{
%>
<br /><br /><br /><br /><br /><br /><br /><br />
<center>
 <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->
	<tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	</tr>
	<tr>
		<td height="57" align="center"><span class="STYLE10">发表失败,请先登录<span class="STYLE3">！</span></span></td>
	</tr>
</table>
</center>
<%
}
response.setHeader("refresh","1;url=message.jsp");
%>
