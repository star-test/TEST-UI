<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.sql.*,com.bean.*,java.util.*" %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE5 {color: #FFFFFF}
.STYLE6 {font-size: 12px; color: #FF0000; }
-->
</style>
<script language="javascript">

function go(c){//该函数指定要跳转的页面
	  document.mf.cp.value=c;//将当前页码放在隐藏域中
	  document.mf.submit();//提交表单
}
</script>
<%
ProductPage p=new ProductPage(3,1);//设置每页最多显示记录为5条，当前默认页码为1
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
<table width="256" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="256" height="119"><table width="200" border="0" bordercolor="#99CCFF" style="border-collapse:collapse">

  <tr>
  <%
  String c_name=(String) session.getAttribute("c_name");
    int id=1;
    ResultSet rs=p.getRes(p.getCurrentPage());//查询当前页中的所有记录 
    try{
    while(rs.next()){
%>
    <td width="110" height="135" align="center" valign="middle">
    <img src="<%=rs.getString(6)%>" width="50" /></td>
    <td width="100" align="center"><span class="STYLE5">============</span>
    <p class="STYLE1"><%=rs.getString(3)%></p><p>
    <font size="2" color="red"><%=rs.getString(4)%></font></p>
    <p><a href="#" onClick="window.open('view_product.jsp?p_id=<%=rs.getString(2)%>','help','scrollbars=yes,resizable=yes,width=600,height=520')">
    <input name="see" type="button" class="STYLE1" value="详情"></a>
     <%if (c_name!=null && c_name!=""){%>
    <input name="see" type="button" class="STYLE1" onClick="window.location.href='cart_add.jsp?p_id=<%=rs.getString(2)%>'" value="购买">
	<%
	}
	%>
	</p></td>
    <%
  	}}catch(Exception e){
  		e.printStackTrace();
  	}
rs.close();
%>
  </tr>
 
</table></td>
  </tr>
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
</p>
<p>
</p>