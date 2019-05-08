<%@ page language="java" pageEncoding="UTF-8"%>
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

		<title>My JSP 'viewUser.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			function subForm(pageIndex){
				document.getElementById('pageIndex').value=pageIndex;
				document.forms[0].submit();
			}
			function returnPage(totalPage){
				 var pageIndex=document.getElementById('returnPage').value;
				 if(pageIndex<=totalPage){
				 	document.getElementById('pageIndex').value=pageIndex;
					document.forms[0].submit();
				 }else{
				 	alert("请输入正确的页码!");
				 }
				
			}	
			function deleteUser(identity){
				if(confirm("确定要删除吗？")){
					document.getElementById('identityTemp').value=identity;
					document.forms[0].action="DeleteUser.do";
					document.forms[0].submit();
				}
			}
			function updateUser(identity){
				document.getElementById('identityTemp').value=identity;
				document.forms[0].action="PreUpdateUser.do";
				document.forms[0].submit();
			
			}
			function selectCar(obj){
			var userInfo = document.getElementsByName("userInfo");
			if(obj==0){
				for(var i=0;i<userInfo.length;i++){
					userInfo[i].checked=true;
				}
			}
			if(obj==1){
				for(var i=0;i<userInfo.length;i++){
					userInfo[i].checked=!userInfo[i].checked;
				}
			}
			if(obj==2){
				for(var i=0;i<userInfo.length;i++){
					userInfo[i].checked=false;
				}
			}
		}
		function qxSelect(obj){
			document.getElementById(obj).checked=false;
		}
		function qxAll(obj){
			var flag=document.getElementById(obj).checked;
			if(!flag){
				var userInfo = document.getElementsByName("userInfo");
				for(var i=0;i<userInfo.length;i++){
					userInfo[i].checked=false;
				}
			}else{
				var userInfo = document.getElementsByName("userInfo");
				for(var i=0;i<userInfo.length;i++){
					userInfo[i].checked=true;
				}
			}
		}
		function deleteAll(){
			var flag=false;
			var userInfo = document.getElementsByName("userInfo");
			for(var i=0;i<userInfo.length;i++){
				if(userInfo[i].checked){
					flag=true;
					break;
				}				
			}
			if(flag){
				if(confirm("删除后不能恢复，确认删除？")){
					document.forms[0].action="DeleteAll.do";
					document.forms[0].submit();
				}
			}else{
				alert("至少选择一条");
			}
		}
	</script>
		<style type="text/css">
<!--
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

.STYLE6 {
	color: #000000;
	font-size: 12;
}

.STYLE10 {
	color: #000000;
	font-size: 12px;
}

.STYLE19 {
	color: #344b50;
	font-size: 12px;
}

.STYLE21 {
	font-size: 12px;
	color: #3b6375;
}

.STYLE22 {
	font-size: 12px;
	color: #295568;
}
-->
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
														<div align="center" style="margin-top: 4px;margin-left: 3px;">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1" style="color: white;">&nbsp;&nbsp;用户基本信息列表</span>
													</td>
												</tr>
											</table>
										</td>

										<td>
											<div align="right" style="display:none;">
												<span class="STYLE1"> <input type="radio"
														name="radio1" id="radio1" onclick="selectCar(0)"
														onblur="qxSelect(this.id)" /> 全选 &nbsp; <input
														type="radio" name="radio2" id="radio2"
														onclick="selectCar(1)" onblur="qxSelect(this.id)" /> 反选
													&nbsp; <input type="radio" name="radio3" id="radio3"
														onclick="selectCar(2)" onblur="qxSelect(this.id)" /> 取消
													&nbsp; <img src="images/del.gif" width="10" height="10" /><a
													onclick="deleteAll()" style="cursor: hand;">删除</a>
													&nbsp;&nbsp;</span><span class="STYLE1"> &nbsp;</span>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<form action="FindUser.do" method="post">
						<input type="hidden" name="userName"
							value="${ requestScope.user.userName }" />
						<input type="hidden" name="userPwd"
							value="${ requestScope.user.userPwd }" />
						<input type="hidden" name="address"
							value="${ requestScope.user.address }" />
						<input type="hidden" name="position"
							value="${ requestScope.user.position }" />
						<input type="hidden" name="userLevel"
							value="${ requestScope.user.userLevel }" />
						<input type="hidden" name="sex" value="${ requestScope.user.sex }" />
						<input type="hidden" name="fullName"
							value="${ requestScope.user.fullName }" />
						<input type="hidden" name="identity"
							value="${ requestScope.user.identity }" />
						<input type="hidden" name="identityTemp" id="identityTemp" />
						<input type="hidden" name="phone"
							value="${ requestScope.user.phone }" />
						<input type="hidden" name="pageIndex" value="" id="pageIndex" />
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							bgcolor="#a8c7ce">
							<tr>
								<td width="4%" height="20" bgcolor="d3eaef" class="STYLE10">
									<div align="center">
										
									</div>
								</td>
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">登录名</span>
									</div>
								</td>
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">身份证</span>
									</div>
								</td>
								<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">姓名</span>
									</div>
								</td>
								<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">性别</span>
									</div>
								</td>
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">职位</span>
									</div>
								</td>
								<!--  <td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">用户类型</span>
									</div>
								</td>-->
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">编辑</span>
									</div>
								</td>
							</tr>
							<c:forEach items="${requestScope.page.result}" var="user">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<input type="checkbox" name="userInfo" id="userInfo"
												value="${user.identity }" />
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE6">
										<div align="center">
											<span class="STYLE19">${user.userName }</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${user.identity }
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${user.fullName }
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${user.sex }
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${user.position }
										</div>
									</td>
									<!-- <td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											${user.userLevel==1?'管理员':(user.userLevel==2?'工作人员':'普通客户') }
										</div>
									</td> -->
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											<a href="javascript:void(0)"
												onclick="deleteUser('${user.identity }')">删除</a>
												|
											<a href="javascript:void(0)"
												onclick="updateUser('${user.identity }')">查看</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</form>
				</td>
			</tr>
			<tr>
				<td height="30">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="33%">
								<div align="left">
									<span class="STYLE22">&nbsp;&nbsp;&nbsp;&nbsp;共有<strong>
											${page.countRow }</strong> 条记录，当前第<strong>${page.currPage }</strong>
										页，共<strong>${page.totalPage }</strong>页</span>
								</div>
							</td>
							<td width="67%">
								<table width="370" border="0" align="right" cellpadding="0"
									cellspacing="0">
									<tr>
										<td width="49">
											<div align="center">
												<c:if test="${requestScope.pageIndex > 1}">
													<img src="images/main_54.gif" width="40" height="15"
														onclick="subForm('1')" />
												</c:if>
											</div>
										</td>
										<td width="49">
											<div align="center">
												<c:if test="${requestScope.pageIndex > 1}">
													<img src="images/main_56.gif" width="45" height="15"
														onclick="subForm('${requestScope.pageIndex - 1 }')" />
												</c:if>
											</div>
										</td>
										<td>
											<div align="center" style="margin-top: -2px;">
												<c:forEach begin="1" end="${requestScope.page.totalPage}"
													varStatus="c">
													<c:choose>
														<c:when test="${requestScope.pageIndex eq c.count}">
															<a style="text-decoration: none; cursor: hand;"
																onclick="subForm('${c.count }')"><font color="red">${c.count
																	}</font> </a>
														</c:when>
														<c:otherwise>
															<a style="text-decoration: none; cursor: hand;"
																onclick="subForm('${c.count }')">${c.count }</a>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</div>
										</td>
										<td width="49">
											<div align="center">
												<c:if
													test="${requestScope.pageIndex < requestScope.page.totalPage}">
													<img src="images/main_58.gif" width="45" height="15"
														onclick="subForm('${requestScope.pageIndex + 1 }')" />
												</c:if>
											</div>
										</td>
										<td width="49">
											<div align="center">
												<c:if
													test="${requestScope.pageIndex < requestScope.page.totalPage}">
													<img src="images/main_60.gif" width="40" height="15"
														onclick="subForm('${page.totalPage }')" />
												</c:if>
											</div>
										</td>
										<td width="37" class="STYLE22">
											<div align="center">
												转到
											</div>
										</td>
										<td width="22">
											<div align="center" style="margin-top: -4px;">
												<input type="text" name="returnPage" id="returnPage"
													style="width: 30px; height: 15px; font-size: 12px; border: solid 1px #7aaebd;" />
											</div>
										</td>
										<td width="22" class="STYLE22">
											<div align="center">
												页
											</div>
										</td>
										<td width="35">
											<img src="images/main_62.gif" width="26" height="15"
												onclick="returnPage('${requestScope.page.totalPage }')" />
										</td>
									</tr>
								</table>
							</td>
						</tr>

					</table>
				</td>
			</tr>
		</table>
	</body>
</html>
