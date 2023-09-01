<%@ page contentType="text/html;charset=gb2312" %>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {font-size:14px;}
-->
</style>

<script>
	<!--
		function check_name(form)
		{
			if(form.order_id.value=="")
			{
				alert("请输入客户用户名");
				form.order_id.focus();
				return false;
			}
		}	
	-->

</script>
<body>
<center>
<form action="login4?op=disp2" method="post" onSubmit="return check_name(this);">
<table width="520" border="1" bordercolor="#99CCFF"  cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr bgcolor="#99CCFF">
    <td height="14">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><span class="STYLE1">&nbsp;请输入要查询订单号码</span>：</td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle"><span class="STYLE1">订单号</span>：&nbsp;
      <input type="text" name="order_id"/>&nbsp;&nbsp;<input type="submit" class="STYLE1" value=" 查询 " /></td>
    </tr>
  <tr>
    <td height="20" align="right"></td>
    </tr>
  <tr bgcolor="#99CCFF">
    <td height="14">&nbsp;</td>
  </tr>
</table>
</form>
</center>