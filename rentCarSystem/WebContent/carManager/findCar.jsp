<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
		<style type="text/css">
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
															<img src="images/tb.gif" width="14" height="14"
																align="middle" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1" style="color: white;"> 汽车管理</span>
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
		<form action="findAllCar.do" method="post" id="login">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td height="22" colspan="4" background="images/bg.gif"
						bgcolor="#FFFFFF" class="STYLE3">
						<div align="center">
							查询汽车信息
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										车号
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="carNumber"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
								<td width="173" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										型号
									</div>
								</td>
								<td width="188" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="carType"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										颜色
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="color"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
								<td width="173" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										价格
									</div>
								</td>
								<td width="188" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="price"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										租金
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="rentPrice"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
								<td width="173" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										押金
									</div>
								</td>
								<td width="188" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="deposit"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										出租情况
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<select name="isRenting"
											style="width: 200px; height: 17px; font-size: 12px;">
											<option value="0">
												未出租
											</option>
											<option value="1">
												已出租
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td height="40" class="STYLE1">
									&nbsp;
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<div style="text-align: center">
										<img src="images/cx.jpg" width="57" height="20"
											onclick="form_submit()">

										<img src="images/cz.jpg" width="57" height="20"
											onclick="form_reset()">
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
