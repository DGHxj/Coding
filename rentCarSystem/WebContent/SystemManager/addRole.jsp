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
			function subForm(){
				document.forms[0].action="addRole.do";
				document.forms[0].submit();
			}
			function selectSub(fatherId){
			var elms = document.getElementsByName("s"+fatherId.name.substring(1,fatherId.name.length));
			var flag = fatherId.checked;
			for(var i=0;i<elms.length;i++){
				elms[i].checked = flag;
			}
        }
		function selectFather(sunId){
			var fatherId = document.getElementsByName("f"+sunId.name.substring(1,sunId.name.length));
			var elms = document.getElementsByName(sunId.name);
			var flag = false;
			for(var i=0;i<elms.length;i++){
				if(elms[i].checked){
					flag=true;
					break;
				}
		 }
	    fatherId[0].checked=flag;
   }
	</script>
	</head>

	<body>
		<form action="" method="post">

			<input type="hidden" name="f1" value="1">
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
			<center style="margin-top: 20px;">
				<table>
					<tr>
						<td>
							<input type="hidden" name="roleName" value="" />

							角色名称：
							<input type="text" name="roleName1" value="${role.roleName }"
								id="roleName" />
							<br />
							<a style="color: blue; text-decoration: underline; cursor: hand"
								onclick="subForm()">确认</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a style="color: blue; text-decoration: underline; cursor: hand"
								onclick="history.back()">返回</a>
						</td>
						<td>
							<c:forEach var="menus" items="${requestScope.menus}">
								<c:if test="${menus.fatherId==1}" var="father">
									<li>
										<input type="checkbox" name="f${menus.menuId }"
											id="f${menus.menuId }" onclick="selectSub(this)"
											value="${menus.menuId }">
										${menus.menuName }
									</li>
									<ul>
										<c:forEach var="sun" items="${requestScope.menus}">
											<c:if test="${sun.fatherId==menus.menuId}">
												<input type="checkbox" name="s${sun.fatherId }"
													id="s${sun.fatherId }" onclick="selectFather(this)"
													value="${sun.menuId }">${sun.menuName }<br />
											</c:if>
										</c:forEach>
									</ul>
								</c:if>
							</c:forEach>
						</td>
					</tr>
				</table>
			</center>
		</form>
	</body>
</html>
