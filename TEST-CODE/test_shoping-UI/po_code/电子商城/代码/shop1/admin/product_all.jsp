<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.sql.*,com.bean.*,java.util.*" %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size: 14px;}
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
-->
</style>
<script language="javascript">

function go(c){//该函数指定要跳转的页面
	  document.mf.cp.value=c;//将当前页码放在隐藏域中
	  document.mf.submit();//提交表单
}
</script>
<body>
<%
ProductPage p=new ProductPage(4,1);//设置每页最多显示记录为5条，当前默认页码为1
int current=0;
try{
String sel=request.getParameter("cp");
if(sel!=null)
current=Integer.parseInt(sel);
if(current>1)
p.setCurrentPage(current);
}catch(Exception e){
	e.printStackTrace();
}
%>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">图片</span></td>
    <td width="135" height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">名称</span></td>
    <td width="99" align="center" bgcolor="#99CCFF"><span class="STYLE2">商品号</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">操作</span></td>
  </tr>
  <tr>
    <td height="14" colspan="5">&nbsp;</td>
  </tr>
   <%
    int id=1;
    ResultSet rs=p.getRes(p.getCurrentPage());//查询当前页中的所有记录 
    try{
    while(rs.next()){
%>
  <tr>
    <td width="86" rowspan="3" align="center"><img src="../<%=rs.getString(6)%>" width="70" height="50"/></td>
    <td height="25" colspan="4" align="center"><span class="STYLE2"><%=rs.getString(1)%></span></td>
  </tr>
  <tr>
    <td height="33" align="center"><span class="STYLE2"><%=rs.getString(3)%></span></td>
    <td height="33" align="center"><span class="STYLE2"><%=rs.getString(2)%></span></td>
    <td width="101" height="33" align="center"><span class="STYLE1">[ <a href="login6?op=look&p_id=<%=rs.getString(2)%>">查看/修改</a> ]</span></td>
    <td width="67" align="center"><span class="STYLE1">[ <a href="login6?op=delete&p_id=<%=rs.getString(2)%>">删除</a> ]</span></td>
  </tr>
  <tr>
    <td height="14" colspan="4" bgcolor="#99CCFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="12" colspan="5">&nbsp;</td>
    </tr>
    <%
  	}}catch(Exception e){
  		e.printStackTrace();
  	}
rs.close();
%>
</table>
<form action="" method="post"  name="mf" class="STYLE2">
<a href="#" onClick="go(1)" <%=p.getCurrentPage()==1?"disabled":"" %>>首  页</a>&nbsp;
<a href="#" onClick="go(<%=p.getCurrentPage()-1>0?p.getCurrentPage()-1:p.getCurrentPage()%>)"  <%=p.getCurrentPage()==1?"disabled":"" %>>上一页</a>&nbsp;
<a href="#" onClick="go(<%=p.getCurrentPage()!=p.getPageSize()?p.getCurrentPage()+1:p.getPageSize()%>)" 
 <%=p.getCurrentPage()==p.getPageSize()?"disabled":"" %>>下一页</a>&nbsp;
<a href="#" onClick="go(<%=p.getPageSize()%>)"  <%=p.getCurrentPage()==p.getPageSize()?"disabled":"" %>>尾  页</a>&nbsp;
<input type="hidden" name="cp" >
跳转到第
<select name="sel" onChange="go(this.value)">
<%
for(int i=1;i<=p.getPageSize();i++){
%>
<option value="<%=i %>"<%=p.getCurrentPage()==i?"selected":"" %>><%=i %></option>
<%
}
%>
 </select>
页&nbsp;&nbsp;
第<%=p.getCurrentPage() %>页/共<%=p.getPageSize()%>页
</form>
</center>
