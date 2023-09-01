<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*" %>


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
<script>
	<!--
	function check_product(form)
	{
		if(form.p_type.value=="")
		{
			alert("请选择商品类型");
			form.p_type.focus();
			return false;
		}
		if(form.p_id.value=="")
		{
			alert("请输入商品的ID");
			form.p_id.focus();
			return false;
		}	
		if(form.p_name.value=="")
		{
			alert("请输入商品的名称");
			form.p_name.focus();
			return false;
		}	
		if(form.p_price.value=="")
		{
			alert("请输入商品的价格");
			form.p_price.focus();
			return false;
		}	
		if(form.p_quantity.value=="")
		{
			alert("请输入商品的数量");
			form.p_quantity.focus();
			return false;
		}	
		if(form.p_image.value=="")
		{
			alert("请添加商品的图片");
			form.p_image.focus();
			return false;
		}	
	}
	
	-->
</script>
<script language="javascript">
var http_request = false;
function createRequest(url) {
	//初始化对象并发出XMLHttpRequest请求
	http_request = false;
	if (window.XMLHttpRequest) { // Mozilla或其他除IE以外的浏览器
		http_request = new XMLHttpRequest();
		if (http_request.overrideMimeType) {
			http_request.overrideMimeType("text/xml");
		}
	} else if (window.ActiveXObject) { // IE浏览器
		try {
			http_request = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {
			try {
				http_request = new ActiveXObject("Microsoft.XMLHTTP");

		   } catch (e) {}
		}
	}
	if (!http_request) {
		alert("不能创建XMLHTTP实例!");
		return false;
	}
	http_request.onreadystatechange = alertContents;    //指定响应方法
	//发出HTTP请求
	http_request.open("GET", url, true);
	http_request.send(null);
}
function alertContents() {    //处理服务器返回的信息
	if (http_request.readyState == 4) {
		if (http_request.status == 200) {
			subType.innerHTML=http_request.responseText;
		} else {
			alert('您请求的页面发现错误');
		}
	}

}

function F_super(val){
	createRequest("selSubType.jsp?superID="+val);  //实现级联下拉列表
}
</script>
<center>
<form action="" method="post" name="form1">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">添加商品</span></td>
    </tr>
  <tr>
    <td width="146" height=40 align="center"><span class="STYLE1">商品大类</span>：</td>
    <td width="348" align="left">&nbsp;&nbsp;
      <select name="supertype"  class="textarea" id="supertype" onChange="F_super(this.value)"> 
                <option value="434343">435353</option>
               
    </select></td>

  </tr>
 <tr>
     <td width="146" height=40 align="center">
     <span class="STYLE1">商品小类</span>：</td>
    <td width="348" align="left">&nbsp;&nbsp;43434
    </td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">商品ID</span>：</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_id" size="15"  /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">商品名称</span>：</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_name" size="30" /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">商品价格( RMB )</span>：</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_price" size="10" /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">商品数量</span>：</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_quantity" size="10"  /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">商品图片</span>：</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="file" name="p_image" size="30" /></td>
  </tr>
  
  <tr>
    <td height="94" align="center"><span class="STYLE1">商品描述</span>：</td>
    <td height="94" align="left">&nbsp;&nbsp;
      <textarea name="p_description" cols="42" rows="5"></textarea></td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="center"><input name="submit" type="submit" class="STYLE1" value=" 添加 " />      &nbsp;&nbsp;
      <input type="reset" class="STYLE1" value=" 重置 " /></td>
  </tr>
</table>
</form>
</center>