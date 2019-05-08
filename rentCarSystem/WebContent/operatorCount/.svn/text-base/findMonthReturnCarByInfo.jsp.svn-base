<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'findMonthReturnCarByInfo.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}

td {
	font-size: 12px;
	border-color: #99FE80;
}

tr {
	border-color: #99FE80;
}

th {
	font-size: 12px;
	background-color: #94DCEB;
	border-color: #99FE80;
	height: 24px;
}

.bg_tr {
	font-family: "微软雅黑,Verdana, 新宋体";
	color: #1E5494; /*标题字体色*/
	font-size: 12px;
	font-weight: bolder;
	background: #E4F1FA; /*标题背景色*/
	line-height: 22px;
}
</style>
	</head>
	<body>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="24" bgcolor="#353c44">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="2%" height="19" valign="middle">
														<div align="center" style="margin-top: 2px">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1">出租单详细信息</span>
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<table cellspacing="1" cellpadding="2" width="99%" align="center"
			border="0" style="border: 1px solid #CAF2FF;">
			<tr class="bg_tr">
				<td height="23" colspan="6" align="center">
					<div align="center" style="font-size: 14px;">
						出租单详细信息
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						出租单编号：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.tableId }</font>
					</div>
				</td>
				<td>
					<div align="center">
						预付金：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatNumber type="currency"
								value="${requestScope.rent.imprest }" /> </font>
					</div>
				</td>
				<td>
					<div align="center">
						应付金：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatNumber type="currency"
								value="${requestScope.rent.shouldPayPrice }" /> </font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						实际交付金额：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatNumber type="currency"
								value="${requestScope.rent.price }" /> </font>
					</div>
				</td>
				<td>
					<div align="center">
						起租日期：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatDate
								value="${requestScope.rent.beginDate }" pattern="yyyy-MM-dd" />
						</font>
					</div>
				</td>
				<td>
					<div align="center">
						应归还日期：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatDate
								value="${requestScope.rent.shouldReturnDate }"
								pattern="yyyy-MM-dd" /> </font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						归还日期：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"> <fmt:formatDate
								value="${requestScope.rent.returnDate }" pattern="yyyy-MM-dd" />
						</font>
					</div>
				</td>
				<td>
					<div align="center">
						出租单状态：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"> <c:choose>
								<c:when test="${requestScope.rent.rentFlag eq 1}">
	  	已入库/已生成检查单
	  	</c:when>
								<c:otherwise>
	  		出租中
	  	</c:otherwise>
							</c:choose>
					</div>
				</td>
				<td>
					<div align="center">
						服务人员编号：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.user.userId }</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>

			<tr class="bg_tr">
				<td height="23" colspan="6">
					<div align="center" style="font-size: 14px;">
						客户详细信息
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						身份证：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.customers.identity }</font>
					</div>
				</td>
				<td>
					<div align="center">
						姓名：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.customers.custName }</font>
					</div>
				</td>
				<td>
					<div align="center">
						性别：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.customers.sex }</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						地址：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.customers.address }</font>
					</div>
				</td>
				<td>
					<div align="center">
						电话：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.customers.phone }</font>
					</div>
				</td>
				<td>
					<div align="center">
						职业：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.customers.career }</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr class="bg_tr">
				<td height="23" colspan="6">
					<div align="center" style="font-size: 14px;">
						车详细信息
					</div>
				</td>

			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						车号：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.car.carNumber }</font>
					</div>
				</td>
				<td>
					<div align="center">
						型号：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.car.carType }</font>
					</div>
				</td>
				<td>
					<div align="center">
						颜色：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.car.color }</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						价值：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatNumber type="currency"
								value="${requestScope.rent.car.price }" /> </font>
					</div>
				</td>
				<td>
					<div align="center">
						租金：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatNumber type="currency"
								value="${requestScope.rent.car.rentPrice }" /> </font>
					</div>
				</td>
				<td>
					<div align="center">
						押金：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"><fmt:formatNumber type="currency"
								value="${requestScope.rent.car.deposit }" /> </font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td>
					<div align="center">
						租用情况：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red"> <c:choose>
								<c:when test="${requestScope.rent.car.isRenting eq 1 }">
	  		已出租
	  	</c:when>
								<c:otherwise>
	  		未出租
	  	</c:otherwise>
							</c:choose> </font>
					</div>
				</td>
				<td>
					<div align="center">
						简介：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.rent.car.description }</font>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<hr color="#E4F1FA">
				</td>
			</tr>
			<tr>
				<td colspan="6">
					<div align="center">
						<img src="<%=basePath%>images/back.gif" onclick="history.back()"
							style="cursor: hand;">
					</div>
				</td>
			</tr>

		</table>
	</body>
</html>
