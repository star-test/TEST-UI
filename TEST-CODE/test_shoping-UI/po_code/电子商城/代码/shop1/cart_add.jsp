<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.bean.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>添加购物车</title>
<style type="text/css">
<!--
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<body>
<%
	String p_id=request.getParameter("p_id");
	Vector cart=(Vector)session.getAttribute("cart");
	CartBean cb=new CartBean();
	cart=cb.addCart(p_id,cart);
	if(cart!=null)
	{
		session.setAttribute("cart",cart);
		response.sendRedirect("my_cart.jsp");
	}

%>
