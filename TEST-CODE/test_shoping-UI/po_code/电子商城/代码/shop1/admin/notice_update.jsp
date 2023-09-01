<%@ page contentType="text/html;charset=gb2312" %>

<%@ page import="java.sql.*,com.bean.*" %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
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
Notice nt=(Notice)session.getAttribute("nt");
if(nt!=null){
%>
<center>
<form action="login7?op=modify&n_id=<%=nt.getN_id() %> " method="post" onSubmit="return check_message(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">公告发布</span></td>
      </tr>
      <tr>
        <td height="14" colspan="3">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="127" height="109" align="center"><p>
        <img src="<%=nt.getN_header() %>" width="32" height="32" /></p>
        <p><span class="STYLE1"><%=nt.getN_admin() %></span></p></td>
        
        <td width="367" align="left"><textarea name="n_message" rows="8" cols="45"><%=nt.getN_message() %></textarea></td>
      </tr>
      <tr>
        <td height="14" colspan="2" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="28" align="center"><span class="STYLE1">发布时间</span>：</td>
        <td align="left"><input type="text" name="n_time" value="<%=nt.getN_time() %>"/></td>
      </tr>
      
      
      <tr>
        <td height="35" colspan="3" align="center"><input type="submit" class="STYLE1" value=" 修改 " />
&nbsp;          <input type="reset" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
      </tr>
    </table>
  </form>
</center>
<%
}
%>
