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
		<script language="javascript" type="text/javascript"
			src="<%=basePath%>My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">
function form_submit(){
	var flag=true;
	document.getElementById("createRentCarTable").submit();
}
</script>
	</head>

	<body>
		<form action="findLogsServlet.do" id="createRentCarTable">

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
															<span class="STYLE1" style="color: white;">查询日志</span>
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
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1" align="center">

						<table width="100%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="center">
										日志内容:
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="action1"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="center">
										用户名:
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="userName"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
							</tr>
							<tr>
								<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="center">
										用户ID:
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="id"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="center">
										日志类型:
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1">
									<div align="left">
										<select name="flag">
											<option value="0">
												请选择
											</option>
											<option value="1">
												出租单日志信息
											</option>
											<option value="2">
												检查单日志信息
											</option>
										</select>
									</div>
								</td>
							</tr>
							<tr>
								<td width="25%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="center">
										事件日期:
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="actionTime"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
											onFocus="WdatePicker({isShowClear:false,readOnly:true})" />
									</div>
								</td>
								

							</tr>


							<tr>
								<td></td>
								<td height="35" colspan="" class="STYLE1">
									<div class="button">
										<img src="images/cx.jpg" width="57" height="20"
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
		</form>
	</body>
</html>
