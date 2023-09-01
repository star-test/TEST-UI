<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*" %>
<jsp:useBean id="dbc" class="com.bean.DBConn"  scope="page"/>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE5 {color: #FFFFFF}
.STYLE6 {font-size: 12px; color: #FF0000; }
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
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>

<% 
	String c_name=(String)session.getAttribute("c_name");
	String t_type=(String)session.getAttribute("t_type");
	Convert convert=new Convert();
	t_type=convert.method(t_type);

 %>
<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="188" height="122" valign="top">
    <table width="98%" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
          <!--DWLayoutTable-->
		 <tr>
            <td height="30" colspan="2" align="center" background="images/logo/back_sales.gif"><span class="STYLE2">促销商品</span></td>
      </tr>
	   <tr>
            <td height="27" colspan="2" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
		  <%
			String id="",name="",image="";
			float price=0;
		  	String psql="select  p_id,p_name,p_price,p_image from product where p_type='"+t_type+"' order by p_price asc limit 4";
			ResultSet prs=dbc.query(psql);
			while(prs.next())
			{
				id=prs.getString("p_id");
				name=prs.getString("p_name");
				price=prs.getFloat("p_price");
				image=prs.getString("p_image");
			%>
        <tr>
	     <td width="88" rowspan="4" align="center" valign="middle">
	     <img src="<%= image %>" width="70"/></td>
	     <td width="96" height="24" align="center" class="STYLE1"><%= name %></td>
	   </tr>
	    <tr>
	      <td align="center" style="text-decoration:line-through;color:#FF0000">
	<font size="1">原价：<%=price+price*0.3%> </font> </td>
	      </tr>
	    <tr>
	     <td height="7" align="center" valign="top">
	     <span class="STYLE1">现价</span>：<font size="2" color="#FF0000">￥<%= price %></font></td>
	     </tr>
	   <tr>
	     <td height="7" align="center" valign="top">
	     <a href="#" onClick="window.open('view_product.jsp?p_id=<%=id %>','help','scrollbars=yes,resizable=yes,width=600,height=520')">
	     <input name="see" type="button" class="STYLE1" value="详情"></a>
	     <%if (c_name!=null && c_name!=""){%>
	     <input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?p_id=<%=id%>'" value="购买"><% } %></td>
	   </tr>
	   <tr>
	     <td height="7" colspan="2" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
	     </tr>
		  <%
		  	}
		  %>
        </table>
    </td>
	
    <td width="588" rowspan="6" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="200" height="30" align="center" background="images/logo/back_new.gif"><span class="STYLE2">商品展区</span></td>
        <td width="359" align="right"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <center>
<table width="200" border="0" bordercolor="#99CCFF" style="border-collapse:collapse">
<%
	ResultSet rs=null;
	String p_id="",p_name="",p_price="",p_image="",p_description="";
	String sql="select p_id,p_name,p_price,p_image,p_description,p_type from product where p_type='"+t_type+"'";
	rs=dbc.query(sql);
int i=1;
int j=0;
for(;i<=4;i++)
{
	j=j+1;
%>
  <tr>
  <% 
		for(;j<=21;j++)
		{  
			if(rs.next())
			{
				p_id=rs.getString("p_id");
				p_name=rs.getString("p_name");
				p_price=rs.getString("p_price");
				p_image=rs.getString("p_image");
				p_description=rs.getString("p_description");
   %>
    <td width="110" height="135" align="center" valign="middle">
    <img src="<%= p_image %>" width="90"/></td>
    <td width="100" align="center"><p><span class="STYLE5">============</span></p>
    <p class="STYLE1"><%= p_name %></p><p><font size="2" color="#FF0000">￥<%= p_price %></font></p>   
	<p><a href="#" onClick="window.open('view_product.jsp?p_id=<%= p_id %>','help','scrollbars=yes,resizable=yes,width=600,height=520')">
	<input name="see" type="button" class="STYLE1" value="详情"></a><%if (c_name!=null && c_name!=""){%><input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?p_id=<%=p_id%>'" value="购买"><% } %></p>   </td>
    <% 
			}
 		
			if(j==3*i)
			{
				break;
			}
    	}
     %>
  </tr>
  <%
}
  %>
</table>
    </center>
      </tr>
    </table>    </td>
  </tr>
  <tr>
    <td height="123" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
</table>
</center>




