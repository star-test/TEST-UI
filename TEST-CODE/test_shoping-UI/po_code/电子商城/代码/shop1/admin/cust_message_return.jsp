<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*,com.bean.*" %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px}
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
Admin ad2=(Admin)session.getAttribute("ad");
if(ad2!=null){
%>
<center>
<form action="login8?op=huifu&id=<%=request.getParameter("id") %>" method="post" onSubmit="return check_message(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">回复意见和建议</span></td>
      </tr>
      <tr>
        <td height="14" colspan="3">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="127" height="150" align="center"><p><img src="<%=ad2.getA_header() %>" width="50" height="50" /></p><p><span class="STYLE1"><%=ad2.getA_name() %></span></p></td>
        
        <td width="367" rowspan="2" align="left"><textarea name="c_message" rows="13" cols="50"></textarea></td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE1">管理员</span></td>
      </tr>
      
      
      <tr>
        <td height="30" colspan="3" align="center"><input type="submit" class="STYLE1" value="发表意见" />
&nbsp;          <input type="button" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
      </tr>
    </table>
  </form>
</center>
<%
}
%>
