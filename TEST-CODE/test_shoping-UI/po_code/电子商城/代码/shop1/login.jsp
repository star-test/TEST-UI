<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*,com.bean.*"%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE6 {font-size: 12px; color: #FF0000; }
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>
<script language="javascript">
<!--
	function check_login(form)
	{
		if(form.c_name.value=="")
		{
			alert("请输入您的用户名");
			form.c_name.focus();
			return false;
		}
		if(form.c_pass.value=="")
		{
			alert("请输入您的密码");
			form.c_pass.focus();
			return false;
		}
	}
-->
</script>
<% 
	String c_name=(String) session.getAttribute("c_name");
	String c_header=(String) session.getAttribute("c_header");
	String t_type=(String) request.getParameter("t_type");
	session.setAttribute("t_type",t_type);
	if(c_name==null || c_name=="")
	{
 %>
<form action="login_ok.jsp" method="post" onSubmit="return check_login(this);">
    <table width="180" border="0" cellpadding="0" cellspacing="0" bordercolor="#99CCFF" bgcolor="#eeeeee" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="2" align="center" valign="middle" background="images/logo/back.gif"><span class="STYLE2">用户登录</span></td>
      </tr>
      <tr>
        <td height="14" colspan="2" align="right" valign="middle"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td width="52" height="14" align="right" valign="middle"><span class="STYLE1">用户名&nbsp;</span></td>
        <td width="125" valign="top"><input type="text" name="c_name" size="14" /></td>
      </tr>
      <tr>
        <td height="14" align="right" valign="middle"><span class="STYLE1">密  &nbsp;码&nbsp;</span></td>
        <td height="14" valign="top"><input type="password" name="c_pass" size="14" /></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle"><font size="2"><a href="forget_pass.jsp">忘记密码?</a>  </font>
        <input type="submit" class="STYLE1" value="确定" />&nbsp;
        <input type="button" class="STYLE1" value="注册" onClick="window.location.href='registry.jsp'" /></td>
      </tr>
  </table>
</form>
		<%
			}
			else
			{	
				boolean cookieFound=false;
				Cookie myCookie=null;
				Cookie cookieset[]=request.getCookies();//得到所有的客户端用户登录的信息
					
				int temp=0;
				if(cookieset!=null)
				{
					for(int i=0;i<cookieset.length;i++)
					{
						if(cookieset[i].getName().equals(c_name))
						{
							cookieFound=true;
							myCookie=cookieset[i];
							
						}
					}
				}
				if(cookieFound)
				{
					temp = Integer.parseInt(myCookie.getValue());					
					temp++;
					if(temp==100)
					{
						out.println("<script language='javascript'>alert('^_^ 尊敬的顾客，您是第100个访问者，感谢您对本站的支持！^_^')</script>");			
					}
					myCookie.setValue(String.valueOf(temp));//将int转换为String
					myCookie.setMaxAge(60*60*24*30);//设置保存的时间 
					response.addCookie(myCookie);
					cookieFound=false;
				}
				else
				{
					temp=1;
					myCookie =new Cookie(c_name,String.valueOf(temp));
					myCookie.setMaxAge(60*60*24*30);
					response.addCookie(myCookie);
					
				}
						
		%>
		<table width="180" border="0" cellpadding="0" cellspacing="0" bordercolor="#99CCFF" bgcolor="#eeeeee" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="25" colspan="2" align="center" valign="middle"><marquee scrolldelay="5" scrollamount="2" bgcolor="#FFFFFF" >
      <span class="STYLE1 STYLE6">欢迎登录电子商城!</span>
        </marquee></td>
        </tr>
      <tr>
        <td width="68" rowspan="5" align="right" valign="middle">
        <img src="<%= c_header %>" width="40" height="40" /><p>
        <span class="STYLE1"><font color="#FF0000"><b>
        <%= c_name %></b></font></span></p></td>
        <td height="17" align="left" valign="top">&nbsp;&nbsp;
        <span class="STYLE1"><a href="my_cart.jsp">我的购物车</a></span></td>
      </tr>
      <tr>
        <td width="109" height="17" align="left" valign="top">&nbsp;&nbsp;<span class="STYLE1"><a href="my_order.jsp">我的订单</a></span></td>
      </tr>
      <tr>
        <td height="17" align="left">&nbsp;&nbsp;<span class="STYLE1"><a href="message.jsp">意见反馈</a></span></td>
      </tr>
      <tr>
        <td height="17" align="left">&nbsp;&nbsp;<span class="STYLE1"><a href="login1?op=login&c_name=<%= c_name %>">修改我的资料</a></span></td>
      </tr>
      <tr>
        <td rowspan="2" align="left">&nbsp;&nbsp;<span class="STYLE1"><a href="exit.jsp">退 出</a></span></td>
      </tr>
      <tr>
        <td height="14" align="center"></td>
        </tr>
      <tr>
        <td height="14" colspan="2" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="14" colspan="2" align="center"><span class="STYLE1">&nbsp;您是第 <font color="#FF0000"><%= temp %></font> 次登录本站</span></td>
        </tr>
    </table>
	<%
		}
		response.sendRedirect("index.jsp");
	%>