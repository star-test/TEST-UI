<%@ page contentType="text/html;charset=gb2312"%>
<%@ page import="java.sql.*,com.bean.*"%>
<jsp:useBean id="dbc" class="com.bean.DBConn" scope="page" />

<jsp:include page="title.jsp" flush="true" />
<jsp:include page="menu.jsp" flush="true" />

<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px
}

.STYLE2 {
	font-size: 14px;
}

.STYLE5 {
	color: #FFFFFF
}

.STYLE6 {
	font-size: 12px;
	color: #FF0000;
}

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
<!--
	function login() {
		window.location.href = 'c_registry.jsp';
	}

	-->
</script>


<center>
	<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0"
		cellspacing="0" style="border-collapse: collapse">
		<!--DWLayoutTable-->
		<tr>
			<td width="186" height="245" valign="top"><table width="184"
					border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0"
					style="border-collapse: collapse">
					<!--DWLayoutTable-->
					<tr>
						<td width="184" align="left" valign="baseline">
							<!-- jsp:include page="cust_login.jsp" flush="true"/-->
						</td>
					</tr>


				</table></td>

			<td width="590" rowspan="5" align="center" valign="top"><table
					width="100%" border="0" cellpadding="0" cellspacing="0">
					<!--DWLayoutTable-->
					<tr>
						<td width="200" height="30" align="center"
							background="images/logo/back_new.gif"><span class="STYLE2">&nbsp;搜索结果</span></td>
						<td width="359" align="right">
							<!--DWLayoutEmptyCell-->&nbsp;
						</td>
					</tr>
					<tr>
						<center>
							<table width="200" border="0" bordercolor="#99CCFF"
								style="border-collapse: collapse">
								<%
									String c_name = (String) session.getAttribute("c_name");
									String type = request.getParameter("select_type");
									String pname = request.getParameter("select_p_name");
									Convert con = new Convert();
									String type2 = con.method(type);//处理乱码
									if (type2.length() != 0 && pname.length() == 0) {//只查询商品类型
										String sql = "select * from product where p_type='" + type2
												+ "'";
										ResultSet rs = dbc.query(sql);
										int i = 1;
										int j = 0;
										for (; i <= 2; i++) {
											j = j + 1;
								%>
								<tr>
									<%
										for (; j <= 7; j++) {
													if (rs.next()) {
									%>
									<td width="110" height="135" align="center" valign="middle">
										<img src="<%=rs.getString("p_image")%>" width="90" />
									</td>
									<td width="100" align="center"><p class="STYLE5">============</p>
										<p class="STYLE1"><%=rs.getString("p_name")%></p>
										<p>
											<font size="2" color="#FF0000">￥<%=rs.getString("p_price")%></font>
										</p>
										<p>
											<a href="#"
												onClick="window.open('view_product.jsp?p_id=<%=rs.getString("p_id")%>','help','scrollbars=yes,resizable=yes,width=600,height=520')">
												<input name="see" type="button" class="STYLE1" value="详情">
											</a>
											<%
												if (c_name != null && c_name != "") {
											%>
											<input name="see" type="button" class="STYLE1"
												onClick="window.location.href='cart_add.jsp?p_id=<%=rs.getString("p_id")%>'"
												value="购买">
											<%
												}
											%>
										</p></td>
									<%
										}
													if (j == 3 * i) {
														break;
													}
												}
									%>
								</tr>
								<%
									}
									} else if (type2.length() == 0 && pname.length() != 0) {
										String sql = "select * from product where p_name='" + pname
												+ "'";
										ResultSet rs = dbc.query(sql);
										int i = 1;
										int j = 0;
										for (; i <= 2; i++) {
											j = j + 1;
								%>
								<tr>
									<%
										for (; j <= 7; j++) {
													if (rs.next()) {
									%>
									<td width="110" height="135" align="center" valign="middle">
										<img src="<%=rs.getString("p_image")%>" width="90" />
									</td>
									<td width="100" align="center"><p class="STYLE5">============</p>
										<p class="STYLE1"><%=rs.getString("p_name")%></p>
										<p>
											<font size="2" color="#FF0000">￥<%=rs.getString("p_price")%></font>
										</p>
										<p>
											<a href="#"
												onClick="window.open('view_product.jsp?p_id=<%=rs.getString("p_id")%>','help','scrollbars=yes,resizable=yes,width=600,height=520')">
												<input name="see" type="button" class="STYLE1" value="详情">
											</a>
											<%
												if (c_name != null && c_name != "") {
											%>
											<input name="see" type="button" class="STYLE1"
												onClick="window.location.href='cart_add.jsp?p_id=<%=rs.getString("p_id")%>'"
												value="购买">
											<%
												}
											%>
										</p></td>
									<%
										}
												}
									%>
								</tr>
								<%
									}
									} else if (type2.length() != 0 && pname.length() != 0) {
										String sql = "select * from product where p_type='" + type2
												+ "' and p_name='" + pname + "'";
										ResultSet rs = dbc.query(sql);
										int i = 1;
										int j = 0;
										for (; i <= 2; i++) {
											j = j + 1;
								%>
								<tr>
									<%
										for (; j <= 7; j++) {
													if (rs.next()) {
									%>
									<td width="110" height="135" align="center" valign="middle">
										<img src="<%=rs.getString("p_image")%>" width="90" />
									</td>
									<td width="100" align="center"><p class="STYLE5">============</p>
										<p class="STYLE1"><%=rs.getString("p_name")%></p>
										<p>
											<font size="2" color="#FF0000">￥<%=rs.getString("p_price")%></font>
										</p>
										<p>
											<a href="#"
												onClick="window.open('view_product.jsp?p_id=<%=rs.getString("p_id")%>','help','scrollbars=yes,resizable=yes,width=600,height=520')">
												<input name="see" type="button" class="STYLE1" value="详情">
											</a>
											<%
												if (c_name != null && c_name != "") {
											%>
											<input name="see" type="button" class="STYLE1"
												onClick="window.location.href='cart_add.jsp?p_id=<%=rs.getString("p_id")%>'"
												value="购买">
											<%
												}
											%>
										</p></td>
									<%
										}
												}
									%>
								</tr>
								<%
									}
									}
								%>
								</tr>
							</table>
							<p>
							<hr size="1" color="#99CCFF" />
							<input type="button" class="STYLE1" value=" 返回 "
								onclick="window.location.href='index.jsp'" />
							</p>
						</center>
					</tr>
				</table></td>
		</tr>
	</table>
	<br />
	<jsp:include page="copyright.jsp" flush="true" />
</center>





