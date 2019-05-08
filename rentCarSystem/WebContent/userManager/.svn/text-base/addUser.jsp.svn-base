<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.rentCarSystem.domain.Role"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<script type="text/javascript">
<!--验证登录名-->
function writeUserName(){
	document.getElementById("userNameMsg").innerHTML = "登录名为数字或字母，长度为4-20";
	document.getElementById("userNameMsg").style.color="#7B7B7B";
}
function checkUserName(){
	var userName=document.getElementById("userName").value;
	document.getElementById("userNameMsg").style.color="red";
	if(userName==""){
		document.getElementById("userNameMsg").innerHTML = "登录名不能为空";
	}else if(userName.length<4||userName.length>20){
		document.getElementById("userNameMsg").innerHTML = "登录名长度为4-20";
	}else if(!/^[A-Za-z0-9]*$/.test(userName)){
		document.getElementById("userNameMsg").innerHTML = "登录名只能为字母或数字";
	}else{
		document.getElementById("userNameMsg").innerHTML = "通过";
	}
}
<!--验证密码-->
function writeUserPwd(){
	document.getElementById("userPwdMsg").innerHTML = "登录名为数字或字母，长度为4-20";
	document.getElementById("userPwdMsg").style.color="#7B7B7B";
}
function checkUserPwd(){
	var userPwd=document.getElementById("userPwd").value;
	document.getElementById("userPwdMsg").style.color="red";
	if(userPwd==""){
		document.getElementById("userPwdMsg").innerHTML = "密码不能为空";
	}else if(userPwd.length<4||userPwd.length>20){
		document.getElementById("userPwdMsg").innerHTML = "密码长度为4-20";
	}else if(!/^[A-Za-z0-9]*$/.test(userPwd)){
		document.getElementById("userPwdMsg").innerHTML = "密码只能为字母或数字";
	}else{
		document.getElementById("userPwdMsg").innerHTML = "通过";
	}
}
<!--验证地址-->
function writeAddress(){
	document.getElementById("addressMsg").innerHTML = "地址长度为1-40";
	document.getElementById("addressMsg").style.color="#7B7B7B";
}
function checkAddress(){
	var address=document.getElementById("address").value;
	document.getElementById("addressMsg").style.color="red";
	if(address==""){
		document.getElementById("addressMsg").innerHTML = "地址不能为空";
	}else if(address.length>40||address.length<1){
		document.getElementById("addressMsg").innerHTML = "地址长度为1-40";
	}else{
		document.getElementById("addressMsg").innerHTML = "通过";
	}
}
<!--验证职位-->
function writePosition(){
	document.getElementById("positionMsg").innerHTML = "职位长度为1-10";
	document.getElementById("positionMsg").style.color="#7B7B7B";
}
function checkPosition(){
	var position=document.getElementById("position").value;
	document.getElementById("positionMsg").style.color="red";
	if(position==""){
		document.getElementById("positionMsg").innerHTML = "职位不能为空";
	}else if(position.length>10||position<1){
		document.getElementById("positionMsg").innerHTML = "职位长度为1-10";
	}else{
		document.getElementById("positionMsg").innerHTML = "通过";
	}
}
<!--验证姓名-->
function writeFullName(){
	document.getElementById("fullNameMsg").innerHTML = "姓名长度为1-4";
	document.getElementById("fullNameMsg").style.color="#7B7B7B";
}
function checkFullName(){
	var fullName=document.getElementById("fullName").value;
	document.getElementById("fullNameMsg").style.color="red";
	if(fullName==""){
		document.getElementById("fullNameMsg").innerHTML = "姓名不能为空";
	}else if(fullName.length>4||fullName.length<1){
		document.getElementById("fullNameMsg").innerHTML = "姓名长度为1-4";
	}else{
		document.getElementById("fullNameMsg").innerHTML = "通过";
	}
}
<!--验证身份证-->
function writeIdentity(){
	document.getElementById("identityMsg").innerHTML = "身份证号码为数字或x，长度为18";
	document.getElementById("identityMsg").style.color="#7B7B7B";
}
function checkIdentity(){
	var identity=document.getElementById("identity").value;
	document.getElementById("identityMsg").style.color="red";
	if(identity==""){
		document.getElementById("identityMsg").innerHTML = "身份证不能为空";
	}else if(!/^[1-9]{1}[0-9]{16}([0-9]|[xX])$/.test(identity)){
		document.getElementById("identityMsg").innerHTML = "身份证格式不正确";
		
	}else if(identity.length!=18){
		document.getElementById("identityMsg").innerHTML = "身份证长度为18";
	}else{
		document.getElementById("identityMsg").innerHTML = "通过";
	}
}
<!--验证联系电话-->
function writePhone(){
	document.getElementById("phoneMsg").innerHTML = "联系电话为手机号码长度为11";
	document.getElementById("phoneMsg").style.color="#7B7B7B";
}
function checkPhone(){
	var phone=document.getElementById("phone").value;
	document.getElementById("phoneMsg").style.color="red";
	if(phone==""){
		document.getElementById("phoneMsg").innerHTML = "联系电话不能为空";
	}else if(phone.length!=11){
		document.getElementById("phoneMsg").innerHTML = "联系电话长度为11";
	}else if(!/^1[3|5|8][0-9]\d{4,8}$/.test(phone)){
		document.getElementById("phoneMsg").innerHTML = "请输入正确的手机号";
	}else{
		document.getElementById("phoneMsg").innerHTML = "通过";
	}
}
function form_submit() {
	var form = document.getElementById("addUser");
	var forms = form.elements;
	var userName = form[0].value;
	var userPwd = form[1].value;
	var address = form[2].value;	
	var position = form[3].value;
	var fullName = form[6].value;
	var identity=form[7].value;
	var phone=form[8].value;
	var flag = true;
	if(userName==""){
		flag=false;
		document.getElementById("userNameMsg").innerHTML = "登录名不能为空";
	}

	if(userPwd==""){
		flag=false;
		document.getElementById("userPwdMsg").innerHTML = "密码不能为空";
	}
	
	if(address==""){
		flag=false;
		document.getElementById("addressMsg").innerHTML = "地址不能为空";
	}

	if(position==""){
		flag=false;
		document.getElementById("positionMsg").innerHTML = "职位不能为空";
	}
	
	if(fullName==""){
		flag=false;
		document.getElementById("fullNameMsg").innerHTML = "姓名不能为空";
	}
	if(identity==""){
		flag=false;
		document.getElementById("identityMsg").innerHTML = "身份证不能为空";
	}
	
	
	if(phone==""){
		flag=false;
		document.getElementById("phoneMsg").innerHTML = "联系电话不能为空";
	}
	
	if(flag){
		form.submit();
	}
}
function form_reset() {
	document.getElementById("addUser").reset();
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
														<span class="STYLE1" style="color: white;">添加用户信息</span>
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
		<center>
		<form id="addUser" name="addUser" action="AddUser.do" method="post">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="0" bgcolor="d5d4d4">
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="40%" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right" style="margin-right: 20px;">
										登录名
									</div>
								</td>
								<td width="60%" height="35" class="STYLE2">
									<div align="left">
										<input type="text" name="userName" id="userName" onfocus="writeUserName()" onblur="checkUserName()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="userNameMsg" style="color:red">*</span>
									</div>
									
								</td>
							</tr>
							<tr>
								<td width="30%" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right" style="margin-right: 20px;">
										用户密码
									</div>
								</td>
								<td width="70%" height="35" class="STYLE2">
									<div align="left">
										<input type="password" name="userPwd" onfocus="writeUserPwd()" onblur="checkUserPwd()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="userPwdMsg" style="color:red">*</span>
									</div>
								</td>
							</tr>
							<tr>
								<td width="30%" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right" style="margin-right: 20px;">
										地址
									</div>
								</td>
								<td width="70%" height="35" colspan="3" class="STYLE2">
									<div align="left">
										<input type="text" name="address" onfocus="writeAddress()" onblur="checkAddress()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="addressMsg" style="color:red">*</span>
									</div>
								</td>
							</tr>
							<tr>
								<td width="30%" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right" style="margin-right: 20px;">
										职位
									</div>
								</td>
								<td width="70%" height="35" colspan="3" class="STYLE2">
									<div align="left">
										<input type="text" name="position"  onfocus="writePosition()" onblur="checkPosition()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="positionMsg" style="color:red">*</span>
									</div>
								</td>
							</tr>
							<tr>
								<td width="30%" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right" style="margin-right: 20px;">
										用户类型
									</div>
								</td>
								<td height="35" colspan="3" class="STYLE2">
									<div align="left">
										<select name="userLevel"
											style="width: 150px; height: 17px; font-size: 12px;">
											<c:forEach items="${requestScope.list}" var="r">
												<option value="${r.roleId }">
													${r.roleName}
												</option>
											</c:forEach>

										</select>
									</div>
									
								</td>
							</tr>
							<tr>
								<td width="30%" height="35" class="STYLE2" nowrap="nowrap">
									<div align="right" style="margin-right: 20px;">
										性别
									</div>
								</td>
								<td height="35" class="STYLE2">
									<div align="left">
										<select name="sex"
											style="width: 100px; height: 17px; font-size: 12px;">
											<option>
												男
											</option>
											<option>
												女
											</option>
										</select>
									</div>
									
								</td>
							</tr>
							<tr>
									<td  width="30%" height="35" class="STYLE2">
									<div align="center" nowrap="nowrap">
										<div align="right" style="margin-right: 20px;">
											姓名
										</div>
									</div>
								</td>
								<td width="30%" height="35" class="STYLE2">
									<div align="left">
										<input type="text" name="fullName"  onfocus="writeFullName()" onblur="checkFullName()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="fullNameMsg" style="color:red">*</span>
									</div>
									
								</td>
							</tr>
							<tr>
								<td width="30%" height="35" class="STYLE2">
									<div align="center" nowrap="nowrap">
										<div align="right" style="margin-right: 20px;">
											身份证
										</div>
									</div>
								</td>
								<td  width="70%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="identity" onfocus="writeIdentity()" onblur="checkIdentity()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="identityMsg" style="color:red">*</span>
									</div>
								</td>
							</tr>
							<tr>
									<td width="30%" height="35" class="STYLE2">
									<div align="center" nowrap="nowrap">
										<div align="right" style="margin-right: 20px;">
											联系电话
										</div>
									</div>
								</td>
								<td  width="70%" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="phone" onfocus="writePhone()" onblur="checkPhone()"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									<span id="phoneMsg" style="color:red">*</span>
									</div>
								</td>
							</tr>
							<tr>
								<td height="40" class="STYLE1">
									&nbsp;
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<img  src="images/tianjia.jpg" width="57" height="20"
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
		</center>
  </body>
</html>
