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

		<title>My JSP 'right].jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<style type="text/css">
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 14px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
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
														<div align="center">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1" style="color: white;"> 业务管理 </span>
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
		<form action="updateCheckTable.do" method="post" id="login">
			<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td height="22" colspan="4" background="images/bg.gif"
						bgcolor="#FFFFFF" class="STYLE3">
						<div align="center">
							检查单信息
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="90%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										检查单号
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="checkId1"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;"
											value="${requestScope.checkTable.checkId }" readonly="readonly"/>
									</div>
								</td>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										检查时间
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="checkDate1"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;"
											
											value="${requestScope.checkTable.checkDate}" readonly="readonly"
											/>
									</div>
								</td>
							</tr>
							<tr>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										属性
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="field"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;"
											value="${requestScope.checkTable.filed }"
											 />
									</div>
								</td>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										检查员
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="checkUserId1"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;" 
											value="${requestScope.checkTable.checkUserId}" readonly="readonly"/>
									</div>
								</td>
							</tr>
							<tr>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										问题
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="problem"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;" 
											value="${requestScope.checkTable.problem }"/>
									</div>
								</td>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										赔费
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="paying"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;" 
											value="${requestScope.checkTable.paying }"/>
									</div>
								</td>
							</tr>
							<tr>
								<td  height="40" class="STYLE1">
									&nbsp;
								</td>
								<td  height="35" colspan="3" class="STYLE1">
									<div style="text-align: center; margin-right: 250px;">
										<img src="images/tijiao.jpg" width="57" height="20"
											onclick="form_submit()">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<img src="images/cz.jpg" width="57" height="20"
											onclick="form_reset()">
									</div>
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
						<font color="red" ><span>${requestScope.rentTable.tableId }</span></font>
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
								value="${requestScope.rentTable.imprest }" />
						</font>
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
								value="${requestScope.rentTable.shouldPayPrice }" />
						</font>
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
								value="${requestScope.rentTable.price }" />
						</font>
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
								value="${requestScope.rentTable.beginDate }" pattern="yyyy-MM-dd" />
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
								value="${requestScope.rentTable.shouldReturnDate }"
								pattern="yyyy-MM-dd" />
						</font>
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
								value="${requestScope.rentTable.returnDate }" pattern="yyyy-MM-dd" />
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
								<c:when test="${requestScope.rentTable.rentFlag eq 1}">
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
						<font color="red">${requestScope.rentTable.userId }</font>
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
						<font color="red">${requestScope.customers.identity }</font>
					</div>
				</td>
				<td>
					<div align="center">
						姓名：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.customers.custName }</font>
					</div>
				</td>
				<td>
					<div align="center">
						性别：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.customers.sex }</font>
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
						<font color="red">${requestScope.customers.address }</font>
					</div>
				</td>
				<td>
					<div align="center">
						电话：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.customers.phone }</font>
					</div>
				</td>
				<td>
					<div align="center">
						职业：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.customers.career }</font>
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
						<font color="red">${requestScope.car.carNumber }</font>
					</div>
				</td>
				<td>
					<div align="center">
						型号：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.car.carType }</font>
					</div>
				</td>
				<td>
					<div align="center">
						颜色：
					</div>
				</td>
				<td>
					<div align="center">
						<font color="red">${requestScope.car.color }</font>
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
								value="${requestScope.car.price }" /> </font>
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
								value="${requestScope.car.rentPrice }" /> </font>
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
								value="${requestScope.car.deposit }" /> </font>
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
								<c:when test="${requestScope.car.isRenting eq 1 }">
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
						<font color="red">${requestScope.car.description }</font>
					</div>
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
		</form>
	</body>
</html>
