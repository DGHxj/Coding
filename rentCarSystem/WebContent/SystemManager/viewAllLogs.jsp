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

		<title>My JSP 'sp.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
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
		<script type="text/javascript">
function subForm(pageIndex){
	document.getElementById('pageIndex').value=pageIndex;
	document.forms[0].submit();
}
function checkDel(id){
	if(confirm("您确定要删除吗？")){
		
		document.forms[0].action="deleteLogsServlet.do";
	document.getElementById('id1').value=id;
	document.forms[0].submit();
	}
}
function subZForm(){
			var pageIndex=document.getElementById('textfield').value;
			document.getElementById('pageIndex').value=pageIndex;
			
			document.forms[0].submit();
		}
function subTiaoForm(totalPage){
			var pageIndex=document.getElementById('textfield').value;
			if(pageIndex<1||pageIndex>totalPage){
				alert("请输入正确页码");
			}else{
			document.getElementById('pageIndex').value=pageIndex;
			document.forms[0].submit();
			}
		}
<!-- 复选框批量删除js-->
	function selectCar(obj){
	<!-- 获取所有的复选框-->
			var cust = document.getElementsByName("logsid");
			<!-- 设置全选-->
			if(obj==0){
				for(var i=0;i<cust.length;i++){
					cust[i].checked=true;
				}
			}
			<!-- 设置反选-->
			if(obj==1){
				for(var i=0;i<cust.length;i++){
					cust[i].checked=!cust[i].checked;
				}
			}
			<!-- 设置取消-->
			if(obj==2){
				for(var i=0;i<cust.length;i++){
					cust[i].checked=false;
				}
			}
		}
		
function qxSelect(obj){
		document.getElementById(obj).checked=false;
}

		function qxAll(obj){
			var flag=document.getElementById(obj).checked;
			var cust = document.getElementsByName("logsid");
			if(!flag){
				var cust = document.getElementsByName("logsid");
				for(var i=0;i<cust.length;i++){
					cust[i].checked=false;
				}
			}else{
			var cust = document.getElementsByName("logsid");
				for(var i=0;i<cust.length;i++){
					cust[i].checked=true;
					}
			}
		}
		function deleteAll(){
			var flag=false;
			var cust = document.getElementsByName("logsid");
		
			for(var i=0;i<cust.length;i++){
				if(cust[i].checked){
					flag=true;
					break;
				}				
			}
			if(flag){
				if(confirm("删除后不能恢复，确认删除？")){
					document.forms[0].action="deleteAllLogs.do";
					document.forms[0].submit();
				}
			}else{
				alert("至少选择一个日志");
			}
		}

</script>
	</head>

	<body>
		<form action="findLogsServlet.do" method="post">
			<!-- 隐藏域 -->

			<input type="hidden" name="id1" id="id1" />
			<input type="hidden" name="id" value="${requestScope.logs.id }" />
			<input type="hidden" name="userName"
				value="${requestScope.logs.userName}" />
			<input type="hidden" name="action1"
				value="${requestScope.logs.action}" />
			<input type="hidden" name="actionTime"
				value="${requestScope.logs.actionTime }" />
			<input type="hidden" name="flag" value="${requestScope.logs.flag}" />
			<input type="hidden" name="pageIndex" value="" id="pageIndex" />
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
															<div align="center"
																style="margin-top: 4px; margin-left: 3px;">
																<img src="images/tb.gif" width="14" height="14" />
															</div>
														</td>
														<td width="94%" valign="middle">
															<span class="STYLE1" style="color: white;">&nbsp;&nbsp;日志信息列表</span>
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
														&nbsp; <img src="images/del.gif" width="10" height="10" />
														<a onclick="deleteAll()" style="cursor: hand;">删除</a>
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
						<table width="100%" border="0" cellpadding="0" cellspacing="1"
							bgcolor="#a8c7ce">



							<tr>
								<td width="6%" height="20" bgcolor="d3eaef" class="STYLE10">
									<div align="center">
										
									</div>
								</td>
								<td width="6%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">序号</span>
									</div>
								</td>
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">用户名</span>
									</div>
								</td>
								<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">用户ID</span>
									</div>
								</td>
								<td width="16%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">日志内容</span>
									</div>
								</td>
								<td width="24%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">事件时间</span>
									</div>
								</td>
								<td width="12%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">事件类型</span>
									</div>
								</td>
								<td width="" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">基本操作</span>
									</div>
								</td>
							</tr>
							<c:forEach var="u" items="${requestScope.page.result }"
								varStatus="r">
								<tr>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center">
											<input type="checkbox" name="logsid" id="logsid"
												value="${u.id}" />

										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE6">
										<div align="center">
											<span class="STYLE19">${r.index+1}</span>
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${u.userName}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${u.id}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${u.action}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF" class="STYLE19">
										<div align="center">
											${u.actionTime}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											${u.flag==1?"出租单操作":"检查单操作"}
										</div>
									</td>
									<td height="20" bgcolor="#FFFFFF">
										<div align="center" class="STYLE21">
											<a onclick="checkDel(${u.id })"
												style="color: blue; text-decoration: underline; cursor: hand;">删除</a>
										</div>
									</td>
								</tr>
							</c:forEach>



						</table>
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
											页，共 <strong>${page.totalPage }</strong> 页</span>
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
												<div align="center" style="margin-top: -2px;">
													<input type="text" name="textfield" id="textfield"
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
													onclick="subTiaoForm(${page.totalPage })" />
											</td>
										</tr>
									</table>
								</td>
							</tr>

						</table>
					</td>
				</tr>
			</table>
			<font color="red">${requestScope.msg }</font>
		</form>
	</body>
</html>
