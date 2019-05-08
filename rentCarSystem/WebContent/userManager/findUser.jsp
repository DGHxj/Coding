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
function form_submit() {
	document.getElementById("addUser").submit();
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
														<span class="STYLE1" style="color: white;">查询用户信息</span>
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
		<form id="addUser" name="addUser" action="FindUser.do" method="post">
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
										<input type="text" name="userName" id="userName"
											style="width: 150px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									
									</div>
									
								</td>
							</tr>
							
							<tr>
								<td height="40" class="STYLE1">
									&nbsp;
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<img style="cursor: pointer;" src="images/cx.jpg" width="57" height="20"
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
