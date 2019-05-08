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
	margin-left: 5px;
	margin-top: 5px;
	margin-right: 5px;
	margin-bottom: 5px;
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
		<form action="findAllCheckTable.do" method="post" id="login">
			<table width="90%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td height="22" colspan="4" background="images/bg.gif"
						bgcolor="#FFFFFF" class="STYLE3">
						<div align="center">
							查询检查单
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
										<input type="text" name="checkId"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;"
											/>
									</div>
								</td>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										检查时间
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="checkDate"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;"
											onFocus="WdatePicker({isShowClear:false,readOnly:true})"
											/>
									</div>
								</td>
							</tr>
							<tr>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										检查员
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="checkUserId"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;"
											 />
									</div>
								</td>
								<td width="100" height="50" class="STYLE1" nowrap="nowrap">
									<div align="left">
										出租单号
									</div>
								</td>
								<td width="70" height="50" class="STYLE1">
									<div align="left">
										<input type="text" name="rentId"
											style="width: 200px; height: 20px; font-size: 15px; border: solid 1px #ccc;" 
											/>
									</div>
								</td>
							</tr>
							
							<tr>
								<td  height="40" class="STYLE1">
									&nbsp;
								</td>
								<td  height="35" colspan="3" class="STYLE1">
									<div style="text-align: center; margin-right: 250px;">
										<img src="images/cx.jpg" width="57" height="20"
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
		
		</form>
	</body>
</html>
