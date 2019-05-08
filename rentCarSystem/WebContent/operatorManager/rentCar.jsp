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
		<script type="text/javascript">
function form_submit() {
	var form = document.getElementById("CreateRent");
	var forms = form.elements;
	var identity = form[0].value;
	
	var flag = true;
	<!--身份证验证 -->
	if(identity==""){
		flag=false;
		alert('请添加客户');
		return;
		document.forms[0].action="custManager/addCustomers.jsp";
		document.forms[0].submit();
	}else if(identity.length!=18){
		flag=false;
		document.getElementById("identityMsg").innerHTML = "身份证长度为18";
	}else if(identity!=""&&!/^[1-9]{1}[0-9]{16}([0-9]|[xX])$/.test(identity)){
		flag=false;
		document.getElementById("identityMsg").innerHTML = "请输入正确的身份证号";
	}
	if(flag){
		form.submit();
	}
}
</script>
	</head>

	<body>
		<form action="preCreateRentCarTableServlet.do" id="CreateRent">

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
															<span class="STYLE1" style="color: white;"> 汽车出租界面</span>
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
			<table width="100%" border="0" align="left" cellpadding="0"
				cellspacing="0" bgcolor="d5d4d4">
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0" style="margin-top: 20px;">
							<tr>
								<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="right"
										style="font-weight: bolder; color: #1E5494; font-size: 14px;">
										客户身份证号:&nbsp;&nbsp;&nbsp;
									</div>
								</td>
								<td width="25%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="identity"
											style="width: 170px; height: 20px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
								</td>

								<td height="35" colspan="" class="STYLE1">
									<div class="button">
										<img src="images/tijiao.jpg" width="57" height="20"
											onclick="form_submit()">
									</div>
								</td>

							</tr>
							<tr>
								<td colspan="3" align="center" class="STYLE1">
									<span id="identityMsg" style="color: red">${requestScope.error}</span>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
