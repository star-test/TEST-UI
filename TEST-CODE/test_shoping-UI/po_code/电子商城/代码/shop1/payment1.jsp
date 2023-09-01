<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="dbc"  class="com.bean.DBConn"  scope="page"/>
<style type="text/css">
<!--
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
<%
String id=(String)session.getAttribute("order_id");
String payment=(String)session.getAttribute("order_payment");
String address=(String)session.getAttribute("order_address");
String email=(String)session.getAttribute("order_email");
String c_name=(String)session.getAttribute("c_name");
String time=(String)session.getAttribute("order_time");
String sum=(String)session.getAttribute("sum");
String sql="insert into orders values('"+id+"','"+payment+"','"+address+"','"+email+
		"','"+c_name+"','"+time+"','"+sum+"')";
int k=0;
k=dbc.add(sql);
if(k!=0){
%>
<jsp:forward page="payment3.jsp"/>
<%
}else{
	System.out.println("¶©µ¥·¢ËÍÊ§°Ü");
%>
<jsp:forward page="my_cart.jsp"/>
<%
}
%>