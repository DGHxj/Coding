<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

		<title>My JSP 'addCustomers.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/js.js"></script>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function form_submit(){
	var flag=true;
	document.getElementById("createRentCarTable").submit();
}
</script>
	</head>

	<body>
		<form action="createRentCarTableServlet.do" id="createRentCarTable">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
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
																	<img src="images/tb.gif" width="14" height="14"
																		align="middle" />
																</div>
															</td>
															<td width="94%" valign="middle">
																<span class="STYLE1" style="color: white;">
																	汽车出租界面</span>
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

					<tr>
						<td colspan="4" bgcolor="#FFFFFF" class="STYLE1" align="center">

							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<tr>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											出租单编号:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="tableId"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onfocus="form_addCustOf()" onblur="form_addCustOb()"
												value="${requestScope.tableId}" readonly="readonly" />
											<span id="tableIdMsg" style="color: red">*</span>
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											预付金:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="imprest"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onfocus="form_addCustOf()" onblur="form_addCustOb()" />
											<span id="imprestMsg" style="color: red">*</span>
										</div>
									</td>
								</tr>
								<tr>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											应付金:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="shoudPayPrice"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onfocus="form_addCustOf()" onblur="form_addCustOb()" />
											<span id="shoudPayPriceMsg" style="color: red">*</span>
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											实际交付金额:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="price"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onfocus="form_addCustOf()" onblur="form_addCustOb()" />
											<span id="priceMsg" style="color: red">*</span>
										</div>
									</td>
								</tr>
								<tr>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											起租日期:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="beginDate"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onFocus="WdatePicker({isShowClear:false,readOnly:true})" />
											<span id="beginDateMsg" style="color: red">*</span>
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											应归还日期:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="shouldReturnDate"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onFocus="WdatePicker({isShowClear:false,readOnly:true})" />
											<span id="shouldReturnDateMsg" style="color: red">*</span>
										</div>
									</td>
								</tr>
								<tr>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											出租单状态:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<select name="rentFlag"
											style="width: 100px; height: 17px; font-size: 12px;">
											<option value="0">
												出租中
											</option>
											<option value="1">
												已入库/已生成检查单
											</option>
										</select>
									</td>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											车号:
										</div>
									</td>
									
									<td width="25%" height="35" class="STYLE1">
										<select name="carId"
											style="width: 100px; height: 17px; font-size: 12px;">
											<c:forEach var="u" items="${requestScope.carId.result }">
											<option value="${u.carNumber }">
												${u.carNumber }
											</option>
											</c:forEach>
										</select>
									</td>
									
								</tr>
								<tr>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											客户编号:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="custId"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onfocus="form_addCustOf()" onblur="form_addCustOb()" value="${requestScope.custId}" readonly="readonly"/>
											<span id="custIdMsg" style="color: red">*</span>
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											服务人员编号:
										</div>
									</td>
									<td width="25%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="userId"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
												onfocus="form_addCustOf()" onblur="form_addCustOb()" value="${requestScope.userId}" readonly="readonly"/>
											<span id="userIdMsg" style="color: red">*</span>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td height="35" colspan="" class="STYLE1">
										<div class="button">
											<img src="images/tianjia.jpg" width="57" height="20"
												onclick="form_submit()">
										</div>
									</td>
									<td></td>
									<td>
										<div class="button">
											<img src="images/cz.jpg" width="57" height="20"
												onclick="form_reset()">
										</div>
									</td>
								</tr>
							</table>

						</td>
					</tr>
				</table>
			</table>
		</form>
	</body>
</html>
