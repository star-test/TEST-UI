<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="com.bean.*"%>
<%

	String c_name=(String)session.getAttribute("c_name");
	String c_header=(String)session.getAttribute("c_header");

	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	else
	{
		DBConn conn=new DBConn();
		Vector cart=(Vector)session.getAttribute("cart");
		if(cart==null || cart.size()==0)
		{
			response.sendRedirect("cart_null.jsp");
		}
		else
		{
	%>
<html>
<head>
<title>电子商城</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2{
	font-size: 14px;
}
.STYLE9 {color: #FF0000}
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
.STYLE11 {
	font-size: 36px;
	font-family: "创艺简行楷";
	color: #000099;
}
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script language="javascript">
<!--
	function check_pay(form)
	{
		if(form.pay_fangshi.value=="")
		{
			alert("请选择您的付款方式");
			form.pay_fangshi.focus();
			return false;
		}
		if(form.pay_address.value=="")
		{
			alert("请输入您的地址");
			form.pay_address.focus();
			return false;
		}
		if(form.pay_email.value=="")
		{
			alert("请输入您的Eamil");
			form.pay_email.focus();
			return false;
		}
		if(form.pay_email.value.indexOf("@")==-1 ||(form.pay_email.value.indexOf(".")==-1))
		{
			alert("错误的Email格式，请填写正确的电子邮箱");
			form.pay_email.focus();
			return false;
		}
	}
-->
</script>

</head>
<body>
<jsp:include page="title.jsp" flush="true"/>
<jsp:include page="menu.jsp" flush="true"/>
<center>
<table width="782"  border="1" bordercolor="#99CCFF" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
        <tr>
          <td width="183" align="center" valign="top">
          <jsp:include page="login.jsp" flush="true"/></td>
          <td width="602" valign="top">
          <table width="100%"  border="0" bordercolor="#99CCFF" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <!--DWLayoutTable-->
                      <tr>
                        <td height="14" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="37" align="center" bgcolor="#eeeeee"><span class="STYLE11">结算中心</span></td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>
<table width="96%" height="83" border="1" bordercolor="#99CCFF" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="27" class="STYLE1">编号</td>
        <td height="27" class="STYLE1">商品编号</td>
        <td class="STYLE1">商品名称</td>
        <td height="27" class="STYLE1">单价</td>
        <td height="27" class="STYLE1">数量</td>
        <td width="85" height="27" class="STYLE1">金额</td>
        </tr> 
	<%
		float sum=0;
		String p_id="";
		String goodsname="";
		for(int i=0;i<cart.size();i++){
			CartBean goodsitem=(CartBean)cart.elementAt(i);
			sum=sum+goodsitem.p_number*goodsitem.p_price;
			p_id=goodsitem.p_id;
			ResultSet rs_goods=conn.query("select * from Product where p_id='"+p_id+"'");
			if (rs_goods.next())
			{
				goodsname=rs_goods.getString("p_name");
				
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="33" height="27"><font size="2"><%=i+1%></font></td>
        <td width="114" height="27"><font size="2"><%=p_id%></font></td> 
        <td width="207" height="27"><font size="2"><%=goodsname%></font></td>
        <td width="68" height="27"><font size="2">￥<%=goodsitem.p_price%></font></td> 
        <td width="48" height="27" class="STYLE1"><%=goodsitem.p_number%></td> 
        <td height="27"><font size="2">￥<%=(goodsitem.p_price*goodsitem.p_number)%></font></td> 
	<%
		}
		session.setAttribute("sum",String.valueOf(sum));
	%>
	 </tr>
      <tr align="center" valign="middle">
        <td height="27" colspan="6" align="left"><span class="STYLE1">合计总金额</span><font size="2">
        <font size="2">：</font></font><span class="STYLE9">￥<%=sum%></span>&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp"><font size="2">返回继续购物</font></a></td>
        </tr>
      </table></td>
                      </tr>
                      <tr>
                        <td></td>
                      </tr>
                      <tr>
                        <td height="57" align="center" valign="top">
						<form action="payment.jsp" method="post" onSubmit="return check_pay(this);">
						  <table width="96%" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
                          <!--DWLayoutTable-->
                          <tr bgcolor="#99CCFF">
                            <td height="10" colspan="3"><!--DWLayoutEmptyCell-->&nbsp;</td>
                            </tr>
                          <tr>
                            <td height="20" colspan="3" bgcolor="#eeeeee">付款方式：</td>
                          </tr>
                          <tr>
                            <td width="25%" height="30" align="right"><span class="STYLE1 STYLE9">请选择您的付款方式</span><span class="STYLE9">：</span>&nbsp;</td>
							<%
								String pay_sql="select pay_payment from payment";
								ResultSet payrs=conn.query(pay_sql);
							%>
                            <td height="30" colspan="2"><select name="pay_fangshi">
							<option value="">-请选择付款方式-</option>
							<%
								while(payrs.next())
								{
						  %>
							<option value="<%= payrs.getString("pay_payment") %>">
							<%= payrs.getString("pay_payment") %></option>
						<%
								}
						%>
                            </select> </td>
                          </tr>
                          <tr>
                            <td height="30" align="right"><span class=" STYLE1 STYLE9">请输入您的地址</span>
                            <span class="STYLE9">：</span>&nbsp;</td>
                            <td height="30" colspan="2"><input type="text" name="pay_address" size="40"/></td>
                          </tr>
                          <tr>
                            <td height="30" align="right">
                            <span class="STYLE1 STYLE9">请输入您的E_mail</span><span class="STYLE9">：</span>&nbsp;</td>
                            <td height="30" colspan="2">
                            <input type="text" name="pay_email" size="26"/></td>
                          </tr>
                          <tr>
                            <td height="30" colspan="3"><!--DWLayoutEmptyCell-->&nbsp;</td>
                          </tr>
                          <tr>
                            <td height="30" colspan="3" align="center">
                            <input type="submit" class="STYLE1" value="确定付款"/>&nbsp;&nbsp;
                            <input name="button" type="button" class="STYLE1" value="取消付款" onClick="history.go(-1);"/></td>
                          </tr>
                        </table>
						</form>                        </td>
                      </tr>
                      <tr>
                        <td height="30" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
                      </tr>
          </table>          </td>
        </tr>
      </table>
</td>
  </tr>
</table>
</td>
</tr>
</table>
</center>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%conn.closeDB();}
}%>