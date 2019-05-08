<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.rentCarSystem.domain.User"%>
<%@page import="com.rentCarSystem.commons.Constants"%>
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

		<title>My JSP 'userInfo.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<style type="text/css">
<!--
body {
	margin-left: 3px;
	margin-top: 0px;
	margin-right: 3px;
	margin-bottom: 0px;
}

.STYLE1 {
	color: #e1e2e3;
	font-size: 12px;
}
.STYLE2 {
	font-size: 12px;
}
.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}

-->
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
														<div align="center" style="margin-top:4px ">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1"> 用户信息</span>
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
		<%
			User user = (User) session.getAttribute(Constants.SESSION_KEY);
		%>
		<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										登录名
									</div>
								</td>
								<td width="500" height="35" class="STYLE2">
									<div align="left">
										<input type="text" name="userName" id="userName" disabled="disabled"
											value="${user.userName}"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>

								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE2">
									<div align="center" nowrap="nowrap">
										<div align="right">
											身份证
										</div>
									</div>
								</td>
								<td width="500" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="identity" readonly="readonly" disabled="disabled"
											value="${user.identity}"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										地址
									</div>
								</td>
								<td width="500" height="35" colspan="3" class="STYLE2">
									<div align="left">
										<input type="text" name="address" disabled="disabled"
											value="${user.address }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										职位
									</div>
								</td>
								<td width="500" height="35" colspan="3" class="STYLE2">
									<div align="left">
										<input type="text" name="position" disabled="disabled"
											value="${user.position }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>
								</td>
							</tr>
							<!-- <tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										用户类型
									</div>
								</td>
								<td height="35" colspan="3" class="STYLE2">
								
									<div align="left">
										<input type="text" name="position" disabled="disabled"
											value="${user.userLevel==1?'管理员':(user.userLevel==2?'服务人员':'普通客户') }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>

								</td>
							</tr> -->
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										性别
									</div>
								</td>
								<td height="35" class="STYLE2">
									<div align="left">
										<input type="text" name="position" disabled="disabled"
											value="${user.sex }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE2">
									<div align="center" nowrap="nowrap">
										<div align="right">
											姓名
										</div>
									</div>
								</td>
								<td width="500" height="35" class="STYLE2">
									<div align="left">
										<input type="text" name="fullName" disabled="disabled"
											value="${user.fullName }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>

								</td>
							</tr>

							<tr>
								<td width="142" height="35" class="STYLE2">
									<div align="center" nowrap="nowrap">
										<div align="right">
											联系电话
										</div>
									</div>
								</td>
								<td width="500" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="phone" disabled="disabled"
											value="${user.phone }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />

									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
</html>
