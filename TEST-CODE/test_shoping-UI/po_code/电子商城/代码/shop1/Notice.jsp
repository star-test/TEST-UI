<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.io.*,com.bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%><style type="text/css">
<!--
body {
	margin-top: 0px;
	margin-bottom: 0px;
}
-->
</style>

<table width="180" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee">
          <!--DWLayoutTable-->
          <tr>
            <td width="184" height="30" align="center" background="images/logo/back.gif"><span class="STYLE2">¹«¸æÀ¸</span></td>
          </tr>
          <tr>
            <td height="70" align="center"><span class="STYLE1" style="color: #000000">
             <marquee direction=up height=100  id=m onmouseout=m.start() onMouseOver=m.stop() scrollamount=2 >
           <%
           String sql="select * from notice";
           ResultSet rs=new DBConn().query(sql);
           while(rs.next()){
           out.println(rs.getString(2)+"<br><br>");
           }
           %>
            </marquee>
            </span></td>
          </tr>
          
</table>
