<style type="text/css">
<!--
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style><%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.bean.*"%>
<% 
	String c_name=(String)session.getAttribute("c_name");
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('ÇëÏÈµÇÂ¼!');window.location.href='index.jsp';</script>");
	}
	else
	{
		CartBean cb=new CartBean();
		int ID=Integer.parseInt(request.getParameter("ID"));
		Vector cart=(Vector)session.getAttribute("cart");	
		int temp=cb.deleteCart(ID,cart);
		if (temp!=0)
		{
			out.println("<script language=javascript> alert('ok');</script>");
			response.sendRedirect("my_cart.jsp");
		}
		else
		{
			response.sendRedirect("cart_null.jsp");
		}
	}
 %>