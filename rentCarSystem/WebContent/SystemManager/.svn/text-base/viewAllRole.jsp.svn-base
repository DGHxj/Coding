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
	function checkDel(roleid)
	{
		if(confirm("您确定要删除吗？"))
		{
			document.getElementById("roleid").value=roleid;
			document.getElementById("roleName").value="";
			document.forms[0].action="deleteRole.do";
			document.forms[0].submit();
		}
	}
	function checkShow(roleid,roleName)
	{
			document.getElementById("roleid").value=roleid;
			document.getElementById("roleName").value=roleName;
			document.forms[0].action="findRole.do";
			document.forms[0].submit();
	}
	
</script>
	</head>

	<body>
	
	<form action="deleteRole.do" method="post">
	
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
														<span class="STYLE1" style="color: white;"> 系统管理 </span>
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
		
		<input type="hidden" name="roleid" id="roleid">
		<input type="hidden" name="roleName" id="roleName" value="${requestScope.roleName}">
		<center style="margin-top: 20px;">
			<table width="80%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4"
				style="font-size: 12px; text-align: center;">
				<tr>
					<td height="22" colspan="4" background="images/bg.gif"
						bgcolor="#FFFFFF" class="STYLE3">
						<div align="center">
							查询角色信息
						</div>
					</td>
				</tr>
				<tr>
					<td width="20%" height="20" bgcolor="d3eaef" class="STYLE10">
						序号
					</td>
					<td width="20%" height="20" bgcolor="d3eaef" class="STYLE10">
						角色名称
					</td>
					<td width="20%" height="20" bgcolor="d3eaef" class="STYLE10">
						操作
					</td>
				</tr>
				<c:forEach var="r" items="${requestScope.list }">
					<tr>
						<td height="20" bgcolor="#FFFFFF">
							${r.rowNum }
						</td>
						<td height="20" bgcolor="#FFFFFF">
							${r.roleName }
						</td>
						<td height="20" bgcolor="#FFFFFF">
							<div align="center" class="STYLE21">
								<a href="javascript:void(0)"
									onclick="checkDel('${r.roleId}')">删除</a> |
								<a href="javascript:void(0)"
									onclick="checkShow('${r.roleId }','${r.roleName }')">修改</a>
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
			<table width="80%" border="0" cellpadding="0" cellspacing="1"
				bgcolor="#a8c7ce" style="font-size: 12px; text-align: center;">

			</table>
		</center>
		</form>
	</body>
</html>
