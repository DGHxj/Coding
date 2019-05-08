<%@ page language="java" pageEncoding="UTF-8"%>
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

		<title>汽车租赁管理平台</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<script type="text/javascript" src="js/js.js"></script>
		<script type="text/javascript">
	if(window.parent.length > 0 ){
	window.parent.location="login.jsp";
	}
		//刷新验证码
		function reloadImg(url){
		 document.getElementById('safecode').src ="ValidateCodeServlet.do?"+Math.random();
		}
</script>
	</head>
	<body>
		<div id="top">
		</div>
		<form id="login" name="login" action="loginUser.do" method="post">
			<br />
			<div id="center">
				<div id="center_left"></div>
				<div id="center_middle">

					<div class="user">
						<label>
							用户名：
							<input type="text" name="userName" id="user" />
						</label>
					</div>
					<div class="user">
						<label>
							密&nbsp;&nbsp;&nbsp;&nbsp;码：
							<input type="password" name="userPwd" id="pwd" />
						</label>
					</div>
					<div class="chknumber">
						<label>
							验证码：
							<input name="validateCode" type="text" id="chknumber"
								maxlength="4" class="chknumber_input" />
						</label>

						<img alt="点击换一张" src="ValidateCodeServlet.do" id="safecode"
							style="margin-bottom: -4px" onclick="reloadImg()"/>
					</div>
					<div style="margin-top: 10px;margin-left: 30px;">
						<font style="color: red">${requestScope.msg}</font>
					</div>
				</div>
				
				<div id="center_middle_right"></div>
				<div id="center_submit">
					<div class="button">
						<img src="images/dl.gif" width="57" height="20"
							onclick="form_submit()">
					</div>
					<div class="button">
						<img src="images/cz.gif" width="57" height="20"
							onclick="form_reset()">
					</div>
				</div>
				<div id="center_right"></div>
			</div>
		</form>
		<div id="footer"></div>
	</body>
</html>
