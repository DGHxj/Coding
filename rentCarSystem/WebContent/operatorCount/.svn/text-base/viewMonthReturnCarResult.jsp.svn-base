<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>My JSP 'viewMonthReturnCarResult.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		function	subForm(pageIndex){
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
			function viewInfo(tableId,custId,carId,userId){
				document.getElementById('tableId').value=tableId;
				document.getElementById('custId').value=custId;
				document.getElementById('carId').value=carId;
				document.getElementById('userId').value=userId;
				document.forms[0].action="FindMonthReturnCarByInfo.do";
				document.forms[0].submit();
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
													<td width="1%" height="14" valign="middle">
														<div align="left" style="margin-top: 4px;margin-left: 3px;">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="99%" valign="middle">

														<span class="STYLE1" style="color: white;">&nbsp;&nbsp;当月应还车辆</span>

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
				<td>
					<form id="MonthReturnCar" action="MonthReturnCar.do" method="post">
						<input type="hidden" name="tableId" value="" id="tableId"/>
						<input type="hidden" name="custId" value="" id="custId"/>
						<input type="hidden" name="carId" value="" id="carId"/>
						<input type="hidden" name="userId" value="" id="userId"/>
						<input type="hidden" name="pageIndex" value="" id="pageIndex" />

						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							bgcolor="#a8c7ce">
							<tr>
								<td width="6%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">序号</span>
									</div>
								</td>
								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">出租单编号</span>
									</div>
								</td>
								<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">起租日期</span>
									</div>
								</td>
								<td width="8%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">应归还日期</span>
									</div>
								</td>
								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">客户号</span>
									</div>
								</td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">车号</span>
									</div>
								</td>
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">出租单状态</span>
									</div>
								</td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">服务人员编号</span>
									</div>
								</td>
								<td width="14%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">编辑</span>
									</div>
								</td>
							</tr>
							<c:forEach items="${requestScope.page.result}" var="rent" varStatus="r">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<span class="STYLE19">${r.index+1 }</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE6">
										<div align="center">
											<span class="STYLE19">${rent.tableId }</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${rent.beginDate }
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${rent.shouldReturnDate}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${rent.custId}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${rent.carId}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											${rent.rentFlag}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											${rent.userId}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											<a href="javascript:void(0)" onclick="viewInfo(${rent.tableId },'${rent.custId }','${rent.carId}','${rent.userId }')">查看</a>
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
