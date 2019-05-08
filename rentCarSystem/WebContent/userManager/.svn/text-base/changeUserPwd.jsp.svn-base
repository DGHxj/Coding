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

		<title>My JSP 'changeUserPwd.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			function isTruePwd(){
				var oldPwd=document.getElementById('oldPwd').value
				document.getElementById('oldPwdTemp').value=oldPwd;
				document.forms[0].action="PreChangeUserPwd.do";
				document.forms[0].submit();
			}
			function form_submit(){
				var oldPwd=document.getElementById('newPwd').value
				document.getElementById('newPwdTemp').value=oldPwd;
				document.getElementById('changeUserPwd').submit();
			}
			function checkNewPwd(){
				var newPwd=document.getElementById('newPwd').value;
				if(newPwd!=""){
					document.getElementById("newPwdMsg").innerHTML = "*";
				}
				if(newPwd==""){
					document.getElementById("newPwdMsg").innerHTML = "密码不能为空";
				}else if(newPwd.length<4||newPwd.length>20){
					document.getElementById("newPwdMsg").innerHTML = "密码长度为4-20";
				}else if(!/^[A-Za-z0-9]*$/.test(userPwd)){
					document.getElementById("newPwdMsg").innerHTML = "密码只能为数字或字母";
				}
			}
			function checkConfirmPwd(){
				var newPwd=document.getElementById('newPwd').value;
				var confirmPwd=document.getElementById('confirmPwd').value;
				if(confirmPwd!=""){
					document.getElementById("confirmPwdMsg").innerHTML = "*";
				}
				if(newPwd!=confirmPwd){
					document.getElementById("confirmPwdMsg").innerHTML = "密码不一致";
				}
			}
			function form_reset(){
				document.getElementById('changeUserPwd').reset();
			}
		</script>
<style type="text/css">
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

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

#center_submit {
	float: left;
	background: url(../images/login_09.gif) no-repeat;
	height: 84px;
	width: 67px;
}

.button {
	margin: 15px auto;
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
		<form id="changeUserPwd" name="changeUserPwd" action="ChangeUserPwd.do" method="post">
			<input type="hidden" name="oldPwdTemp" id="oldPwdTemp"/>
			<input type="hidden" name="newPwdTemp" id="newPwdTemp"/>
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										旧密码
									</div>
								</td>
								<td width="500" height="35" class="STYLE2">
									<div align="left">
										<input type="password" name="oldPwd" id="oldPwd" onblur="isTruePwd()" value="${pwdTemp }"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
										<span id="oldPwdMsg" style="color: red">*${warning }</span>
									</div>

								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										新密码
									</div>
								</td>
								<td width="500" height="35" class="STYLE2">
									<div align="left">
										<input type="password" name="newPwd" id="newPwd" onblur="checkNewPwd()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
										<span id="newPwdMsg" style="color: red">*</span>
									</div>

								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right">
										确认密码
									</div>
								</td>
								<td width="500" height="35" class="STYLE2">
									<div align="left">
										<input type="password" name="confirmPwd" id="confirmPwd" onblur="checkConfirmPwd()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
										<span id="confirmPwdMsg" style="color: red">*</span>
									</div>

								</td>
							</tr>
								<tr>
								<td height="40" class="STYLE1">
									&nbsp;
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<img style="cursor: pointer;" src="images/tijiao.jpg" width="57" height="20"
										onclick="form_submit()"  />
									<img  style="cursor: pointer;" src="images/cz.jpg" width="57" height="20"
										onclick="form_reset()" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
