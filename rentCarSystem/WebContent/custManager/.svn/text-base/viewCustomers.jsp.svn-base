<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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
function form_submit() {
	var form = document.getElementById("updateCustomers");
	var forms = form.elements;
	var custName = form[2].value;
	var address = form[4].value;
	var phone = form[5].value;
	var career = form[6].value;
	var flag = true;
	<!-- 用户名验证-->
	if(custName==""){
		flag=false;
		document.getElementById("custNameMsg").innerHTML = "客户名不能为空";
	}else if(custName.length<4||custName.length>20){
		flag=false;
		document.getElementById("custNameMsg").innerHTML = "客户名长度为4-20";
	}else if(!/^[A-Za-z0-9]*$/.test(custName)){
		flag=false;
		document.getElementById("custNameMsg").innerHTML = "客户名只能为字母或数字";
	}
	
	<!-- 地址验证-->
	if(address==""){
		flag=false;
		document.getElementById("addressMsg").innerHTML = "地址不能为空";
	}else if(address.length>40||address.length<1){
		flag=false;
		document.getElementById("addressMsg").innerHTML = "地址长度为1-40";
	}

	<!--职业证验证 -->
	if(career==""){
		flag=false;
		document.getElementById("careerMsg").innerHTML = "姓名不能为空";
	}else if(career.length>4||career.length<1){
		flag=false;
		document.getElementById("careerMsg").innerHTML = "姓名长度为1-4";
	}
	<!--电话验证 -->
	if(phone==""){
		flag=false;
		document.getElementById("phoneMsg").innerHTML = "联系电话不能为空";
	}else if(phone.length!=11){
		flag=false;
		document.getElementById("phoneMsg").innerHTML = "联系电话长度为11";
	}else if(!/^1[3|5|8][0-9]\d{4,8}$/.test(phone)){
		flag=false;
		document.getElementById("phoneMsg").innerHTML = "请输入正确的手机号";
	}
	
	if(flag){
		form.submit();
	}
}
function form_reset() {
	document.getElementById("updateCustomers").reset();
}
function form_mpwd(identity){
	document.forms[0].action="preChangeCustomerPwd.do";
	document.getElementById('identity1').value=identity;
	document.forms[0].submit();
}
</script>
	</head>

	<body>
		
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
																<span class="STYLE1" style="color: white;"> 客户管理界面</span>
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
						<td height="22" colspan="4" background="images/bg.gif"
							bgcolor="#FFFFFF" class="STYLE3">
							<div align="center">
								修改客户信息
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<form action="updateCustomersServlet.do" id="updateCustomers">
							<table width="70%" border="0" align="center" cellpadding="0"
								cellspacing="0">
								<input type="hidden" name="identity1" id="identity1"/>
								<tr>
									<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											身份证:
										</div>
									</td>
									<td width="*%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="identity"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" value="${requestScope.cust.identity }" readonly="readonly"/>
											<span id="identityMsg" style="color: red"></span>
										</div>
									</td>
								</tr>
								<tr>

									<td width="35%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											姓&nbsp;&nbsp;&nbsp;&nbsp;名:
										</div>
									</td>
									<td width="*%" height="35" class="STYLE1">
										<div align="left">
											<input type="text" name="custName"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" value="${requestScope.cust.custName }"/>
											<span id="custNameMsg" style="color: red"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											性&nbsp;&nbsp;&nbsp;&nbsp;别:
										</div>
									</td>
									<td height="35" class="STYLE1">
										<div align="left">
											<select name="sex"
												style="width: 50px; height: 17px; font-size: 12px;">
												<option value="男" ${requestScope.cust.sex=="男"?"selected":""}>
													男
												</option>
												<option value="女" ${requestScope.cust.sex=="女"?"selected":""}>
													女
												</option>
											</select>
										</div>
									</td>
								</tr>
								<tr>
									<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											地&nbsp;&nbsp;&nbsp;&nbsp;址:
										</div>
									</td>
									<td height="35" colspan="3" class="STYLE1">
										<div align="left">
											<input type="text" name="address"
												style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" value="${requestScope.cust.address }"/>
											<span id="addressMsg" style="color: red"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											电&nbsp;&nbsp;&nbsp;&nbsp;话:
										</div>
									</td>
									<td height="35" colspan="3" class="STYLE1">
										<div align="left">
											<input type="text" name="phone"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" value="${requestScope.cust.phone }"/>
											<span id="phoneMsg" style="color: red"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td width="40%" height="35" class="STYLE1" nowrap="nowrap">
										<div align="right">
											职&nbsp;&nbsp;&nbsp;&nbsp;业:
										</div>
									</td>
									<td height="35" colspan="3" class="STYLE1">
										<div align="left">
											<input type="text" name="career"
												style="width: 130px; height: 17px; font-size: 12px; border: solid 1px #ccc;" value="${requestScope.cust.career }"/>
											<span id="careerMsg" style="color: red"></span>
										</div>
									</td>
								</tr>
								<tr>
									<td></td>
									<td height="35" colspan="2" class="STYLE1">
										<div class="button">
											<img src="images/tijiao.jpg" width="57" height="20"
												onclick="form_submit()">

											<img src="images/cz.jpg" width="57" height="20"
												onclick="form_reset()">
									
											<img src="images/xgmm.jpg" width="57" height="20"
												onclick="form_mpwd('${cust.identity }')">
										</div>
									</td>
								
							</table>
					</form>
						</td>
					</tr>
				</table>
			
	</body>
</html>
