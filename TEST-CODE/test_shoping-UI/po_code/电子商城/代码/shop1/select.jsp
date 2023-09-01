
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
body {
	margin-top: 0px;
}
-->
</style>
<script language="javascript">
<!--
	function check_Found(form)
	{
		if(form.select_type.value=="")
		{
			alert("请选择搜索的类型");
			form.select_type.focus();
			return false;
		}
	}
-->	
</script>

<center>
<form action="select_ok.jsp" method="post" onsubmit="return check_Found(this);">
<table width="782" border="0" cellpadding="0" cellspacing="0"  bordercolor="#99CCFF" bgcolor="#99CCFF" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="122" height="44" align="right"><span class="STYLE1">类型</span>：</td>
    <td width="108"><select name="select_type">
	<option value="">-商品类型-</option>
       <option value="电脑专区">电脑专区</option>
	  	<option value="电冰箱系列">电冰箱系列</option>
	  	<option value="照相机">照相机</option>
	  	<option value="厨卫系列">厨卫系列</option>
	  	<option value="电视机系列">电视机系列</option>
	  	<option value="洗衣机系列">洗衣机系列</option>
    </select></td>
    <td width="58" align="right"><span class="STYLE1">商品名</span>：</td>
    <td width="230"><input type="text" name="select_p_name" value="" size="30" /></td>
    <td width="156" bgcolor="#99CCFF"><input type="submit" name="Submit" value=" 搜索 " /></td>
  </tr>
</table>
</form>
</center>