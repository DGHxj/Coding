<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<script type="text/javascript">
function form_pwdOb(){
	var form = document.getElementById("chenge");
	var forms = form.elements;
	var identity = form[0].value;
	var custPwd = form[1].value;
	var oldPwd = form[2].value;
	var newPwd = form[3].value;
	var confirmPwd = form[4].value;
	<!--验证旧密码 -->
	if(oldPwd!=custPwd){
		document.getElementById("oldPwdMsg").innerHTML = "旧密码不正确，请重新输入";
	}else{
	document.getElementById("oldPwdMsg").innerHTML = "";
	}
	<!--验证新密码 -->
	if(newPwd==""){
		document.getElementById("newPwdMsg").innerHTML = "密码不能为空";
	}else if(newPwd.length<6||newPwd.length>20){
		document.getElementById("newPwdMsg").innerHTML = "密码长度为6-20";
	}else if(!/^[A-Za-z0-9]*$/.test(newPwd)){
		document.getElementById("newPwdMsg").innerHTML = "密码只能为字母或数字";
	}else{
	document.getElementById("newPwdMsg").innerHTML = "";
	}
	<!--验证确认密码 -->
	if(confirmPwd==""||confirmPwd!=newPwd){
		document.getElementById("confirmPwdMsg").innerHTML = "确认密码错误";
	}else{
		document.getElementById("confirmPwdMsg").innerHTML = "";
	}
	
}
function form_pwdOf(){
var form = document.getElementById("chenge");
	var forms = form.elements;
	var identity = form[0].value;
	var custPwd = form[1].value;
	var oldPwd = form[2].value;
	var newPwd = form[3].value;
	var confirmPwd = form[4].value;
	<!--验证旧密码 -->
	if(oldPwd==""){
		document.getElementById("oldPwdMsg").innerHTML = "请输入旧密码";
	}
	<!--验证新密码 -->
	if(newPwd==""){
		document.getElementById("newPwdMsg").innerHTML = "请输入新密码";
	}
	<!--验证确认密码 -->
	if(confirmPwd==""){
		document.getElementById("confirmPwdMsg").innerHTML = "请重复输入密码";
	}

}
function form_submit(){
	var form = document.getElementById("chenge");
	var forms = form.elements;
	var identity = form[0].value;
	var custPwd = form[1].value;
	var oldPwd = form[2].value;
	var newPwd = form[3].value;
	var confirmPwd = form[4].value;
	var flag = true;
	if(oldPwd!=custPwd){
		flag=false;
		document.getElementById("oldPwdMsg").innerHTML = "旧密码不正确，请重新输入";
	}else if(oldPwd.length<6||oldPwd.length>20){
		flag=false;
		document.getElementById("oldPwdMsg").innerHTML = "密码长度为6-20";
	}else if(!/^[A-Za-z0-9]*$/.test(custPwd)){
		flag=false;
		document.getElementById("oldPwdMsg").innerHTML = "密码只能为字母或数字";
	}else{
	document.getElementById("oldPwdMsg").innerHTML = "";
	}
	if(newPwd==""){
		flag=false;
		document.getElementById("newPwdMsg").innerHTML = "密码不能为空";
	}else if(newPwd.length<6||newPwd.length>20){
		flag=false;
		document.getElementById("newPwdMsg").innerHTML = "密码长度为6-20";
	}else if(!/^[A-Za-z0-9]*$/.test(newPwd)){
		flag=false;
		document.getElementById("newPwdMsg").innerHTML = "密码只能为字母或数字";
	}else{
	document.getElementById("newPwdMsg").innerHTML = "";
	}
	
	if(confirmPwd==""||confirmPwd!=newPwd){
		flag=false;
		document.getElementById("confirmPwdMsg").innerHTML = "确认密码错误";
	}else{
		document.getElementById("confirmPwdMsg").innerHTML = "";
	}
	if(flag){
		form.submit();
	}
}
function form_reset(){
	document.getElementById("chenge").reset();
}
</script>

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
														<div align="center" style="margin-top: 4px">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1" style="color: white;">修改用户密码</span>
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
				<td height="22" colspan="4" background="images/bg.gif"
					bgcolor="#FFFFFF" class="STYLE3">
					<div align="center">
						修改密码
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
					<form action="chengeCustomersPwdServlet.do" id="chenge">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<input type="hidden" name="identity" id="identity"
								value="${requestScope.cust.identity }">
							<input type="hidden" name="custPwd" id="custPwd"
								value="${requestScope.cust.custPwd }">
							<tr>
								<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="right">
										旧密码:
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="oldPwd" id="oldPwd"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
											onblur="form_pwdOb()" onfocus="form_pwdOf()" />
										<span id="oldPwdMsg" style="color: red"></span>
									</div>
							</tr>
							<tr>

								<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="right">
										新密码:
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="newPwd" id="newPwd"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
											onblur="form_pwdOb()" onfocus="form_pwdOf()" />
										<span id="newPwdMsg" style="color: red"></span>
									</div>
								</td>
							</tr>

							<tr>
								<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
									<div align="right">
										确认密码:
									</div>
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<div align="left">
										<input type="text" name="confirmPwd" id="confirmPwd"
											style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;"
											onblur="form_pwdOb()" onfocus="form_pwdOf()" />
										<span id="confirmPwdMsg" style="color: red"></span>
									</div>
								</td>
							</tr>

							<tr>
								<td height="40" class="STYLE1">
									&nbsp;
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<div class="button">
										<img src="images/xgmm.jpg" width="57" height="20"
											onclick="form_submit()">

										<img src="images/cz.jpg" width="57" height="20"
											onclick="form_reset()">
									</div>
								</td>


							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>

	</body>
</html>
