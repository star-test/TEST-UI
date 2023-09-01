<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {font-size: 14px;}
.STYLE3 {
	font-size: 14px;
	color: #FF0000;
}
-->
</style>

<script>
	<!--
		function check_name(form)
		{
			if(form.p_type.value=="" && form.p_id.value=="")
			{
				alert("搜索至少要输入一项");
				form.p_type.focus();
				return false;
			}
		}
	-->

</script>

<body>
<center>
<form action="login6?op=chaxun" method="post" onSubmit="return check_name(this);">
<table width="520" border="1" bordercolor="#99CCFF"  cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr bgcolor="#99CCFF">
    <td height="14">&nbsp;</td>
  </tr>
  <tr>
    <td height="30">&nbsp;<span class="STYLE1">请输写以下信息</span><span class="STYLE4">：</span></td>
  </tr>
  <tr>
    <td height="30" align="left" valign="middle"><span class="STYLE1">&nbsp;类型</span>：
      <select name="p_type">
	  <option value="">-商品类型-</option>
	     <option value="电脑专区">电脑专区</option>
	  	<option value="电冰箱系列">电冰箱系列</option>
	  	<option value="照相机">照相机</option>
	  	<option value="厨卫系列">厨卫系列</option>
	  	<option value="电视机系列">电视机系列</option>
	  	<option value="洗衣机系列">洗衣机系列</option>
	
      </select>
      &nbsp;
      <span class="STYLE1">商品ID</span>：
      <input type="text" name="p_id" size="10"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" class="STYLE1" value=" 查询 " /></td>
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
