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

		<title>My JSP 'right].jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript" src="js/js.js"></script>
		<style type="text/css">
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
</style>
		<script type="text/javascript">
	function form_submit(){
		var tableId=document.getElementById("tableId").value;
		if(tableId==""){
			document.getElementById("tableIdError").innerHTML="请输入有效的出租单";
		}else{
			document.forms[0].submit();
		}
		
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
		<center>
			<form action="PreReturnCarSearch.do" method="post">
				<div style="margin-top: 20px; margin-left: 20px; font-size: 12px;">
					<table>
						<tr>
							<td>
								<font
									style="font-weight: bolder; color: #1E5494; font-size: 14px;">出租单号码</font>:&nbsp;&nbsp;&nbsp;
							</td>
							<td>
								<input type="text" name="tableId" id="tableId"
									style="width: 150px; height: 20px; font-size: 12px; border: solid 1px #ccc;">
							</td>
							<td>
								<img src="images/tijiao.jpg" width="57" height="20"
									onclick="form_submit()">
							</td>
						</tr>
						<tr>
							<td colspan="3" align="center">
								<span id="tableIdError" style="color: red; font-size: 12px;">${requestScope.msg
									}</span>
							</td>
						</tr>
					</table>
				</div>
			</form>
		</center>
	</body>
</html>
