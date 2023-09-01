<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*,com.bean.*" %>

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
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
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
<form action="login7?op=add&n_admin=<%=ad2.getA_name() %>&n_header=<%=ad2.getA_header() %>" method="post" onSubmit="return check_message(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">公告发布</span></td>
      </tr>
      <tr>
        <td height="14" colspan="3">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="127" height="124" align="center"><p><img src="<%=ad2.getA_header() %>" width="32" height="32" /></p>
        <p><%=ad2.getA_name() %></p></td>
        
        <td width="367" rowspan="2" align="left">
        <textarea name="n_message" rows="10" cols="50"></textarea></td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE1">管理员</span></td>
      </tr>
      
      
      <tr>
        <td height="40" colspan="3" align="center"><input type="submit" class="STYLE1" value="发表意见" />
&nbsp;          <input type="reset" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
      </tr>
    </table>
  </form>
</center>
<%
}
%>