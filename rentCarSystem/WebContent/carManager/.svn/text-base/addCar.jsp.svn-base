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

.borderColor {
	border: 5px solid red;
}

.message {
	color: red;
	font-size: 12px;
}
</style>
		<script type="text/javascript">
		function checkAll(){
    		var flag=true;
    		var carNumber=document.getElementById("carNumber").value;
    		var carType=document.getElementById("carType").value;
    		var color=document.getElementById("color").value;
    		var price=document.getElementById("price").value;
    		var rentPrice=document.getElementById("rentPrice").value;
    		var deposit=document.getElementById("deposit").value;
    		var file=document.getElementById("file").value;
    		var description=document.getElementById("description").value;
    		if(carNumber==""){
    			flag=false;
    			document.getElementById("carNumberMessage").innerHTML="请输入有效的车号（与图片保持一致）";
    			document.getElementById("carNumberMessage").className="message";
    		}
    		if(carType==""){
    			flag=false;
    			document.getElementById("carTypeMessage").innerHTML="请输入车型";
    			document.getElementById("carTypeMessage").className="message";
    		}
    		if(color==""){
    			flag=false;
    			document.getElementById("colorMessage").innerHTML="请选择颜色";
    			document.getElementById("colorMessage").className="message";
    		}
    		if(price=="" ||!/^[0-9]*$/.test(price) ){
    			flag=false;
    			document.getElementById("priceMessage").innerHTML="请输入价格（只能为数字）";
    			document.getElementById("priceMessage").className="message";
    		}
    		if(rentPrice=="" ||!/^[0-9]*$/.test(rentPrice) ){
    			flag=false;
    			document.getElementById("rentPriceMessage").innerHTML="请输入价格（只能为数字）";
    			document.getElementById("rentPriceMessage").className="message";
    		}
    		if(deposit=="" ||!/^[0-9]*$/.test(deposit) ){
    			flag=false;
    			document.getElementById("depositMessage").innerHTML="请输入价格（只能为数字）";
    			document.getElementById("depositMessage").className="message";
    		}
    		if(file==""){
    			flag=false;
    			document.getElementById("fileMessage").innerHTML="请选择汽车图片（格式为.jpg）";
    			document.getElementById("fileMessage").className="message";
    		}
    		if(description==""){
    			flag=false;
    			document.getElementById("descriptionMessage").innerHTML="请输入汽车简介";
    			document.getElementById("descriptionMessage").className="message";
    		}
    		
    		if(flag){
    			document.forms[0].submit();
    		}
    	}
	function WriteEach(obj){
    		var message="";
    		if(obj=="carNumber"){
    			message="请输入有效的车号（与图片保持一致）";
    		}else if(obj=="carType"){
    			message="请输入车型";
    		}else if(obj=="color"){
    			message="请选择颜色";
    		}else if(obj=="price"){
    			message="请输入价格（只能为数字）";
    		}else if(obj=="rentPrice"){
    			message="请输入租金（只能为数字）";
    		}else if(obj=="deposit"){
    			message="请输入押金（只能为数字）";
    		}
    		document.getElementById(obj).className="borderColor";
    		document.getElementById(obj+"Message").innerHTML=message;
    		document.getElementById(obj+"Message").className="message";
    	}
    	function checkEach(obj,obj1){
    		if(obj1==""){
    			document.getElementById(obj+"Message").innerHTML="";
    			document.getElementById(obj).className="";
    		}else if(obj=="carNumber"){
    			document.getElementById(obj+"Message").innerHTML="";
    			document.getElementById(obj).className="";
    		}else if(obj=="carType"){
    			document.getElementById(obj+"Message").innerHTML="";
    			document.getElementById(obj).className="";
    		}else if(obj=="color"){
    			document.getElementById(obj+"Message").innerHTML="";
    			document.getElementById(obj).className="";
    		}else if(obj=="price" && !(/\d+\.?\d*/g.test(obj1))){
    			document.getElementById(obj+"Message").innerHTML="输入内容只能为数字";
    			document.getElementById(obj).className="";
    		}else if(obj=="rentPrice" && !(/\d+\.?\d*/g.test(obj1))){
    			document.getElementById(obj+"Message").innerHTML="输入内容只能为数字";
    			document.getElementById(obj).className="";
    		}else if(obj=="deposit" && !(/\d+\.?\d*/g.test(obj1))){
    			document.getElementById(obj+"Message").innerHTML="输入内容只能为数字";
    			document.getElementById(obj).className="";
    		}else{
    			document.getElementById(obj+"Message").innerHTML="";
    			document.getElementById(obj).className="";
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
														<div align="center" style="margin-top: 4px">
															<img src="images/tb.gif" width="14" height="14" />
														</div>
													</td>
													<td width="94%" valign="middle">
														<span class="STYLE1" style="color: white;">添加汽车信息</span>
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
		<form action="addCar.do" enctype="multipart/form-data" method="post"
			id="login">
			<table width="100%" border="0" align="center" cellpadding="0"
				cellspacing="1" bgcolor="d5d4d4">
				<tr>
					<td height="22" colspan="4" background="images/bg.gif"
						bgcolor="#FFFFFF" class="STYLE3">
						<div align="center">
							添加汽车信息
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="4" bgcolor="#FFFFFF" class="STYLE1">
						<table width="70%" border="0" align="center" cellpadding="0"
							cellspacing="0">
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										车号
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="carNumber" id="carNumber"
											onfocus="WriteEach(this.id)"
											onblur="checkEach(this.id,this.value)"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>

									<span id="carNumberMessage"></span>
								</td>
								<td width="140" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										型号
									</div>
								</td>
								<td width="200" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="carType" id="carType"
											onfocus="WriteEach(this.id)"
											onblur="checkEach(this.id,this.value)"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
									<span id="carTypeMessage"></span>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										颜色
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<select name="color" id="color"
											style="width: 200px; height: 17px; font-size: 12px;">
											<option value="黑色">
												黑色
											</option>
											<option value="白色">
												白色
											</option>
											<option value="红色">
												红色
											</option>
											<option value="蓝色">
												蓝色
											</option>
											<option value="橙色">
												橙色
											</option>
											<option value="紫色">
												紫色
											</option>
											<option value="绿色">
												绿色
											</option>
											<option value="黄色">
												黄色
											</option>
											<option value="其他">
												其他
											</option>
										</select>
									</div>
									<span id="colorMessage"></span>
								</td>
								<td width="140" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										价格
									</div>
								</td>
								<td width="200" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="price" id="price"
											onfocus="WriteEach(this.id)"
											onblur="checkEach(this.id,this.value)"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
									<span id="priceMessage"></span>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										租金
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="rentPrice" id="rentPrice"
											onfocus="WriteEach(this.id)"
											onblur="checkEach(this.id,this.value)"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
									<span id="rentPriceMessage"></span>
								</td>
								<td width="140" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										押金
									</div>
								</td>
								<td width="200" height="35" class="STYLE1">
									<div align="left">
										<input type="text" name="deposit" id="deposit"
											onfocus="WriteEach(this.id)"
											onblur="checkEach(this.id,this.value)"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
									<span id="depositMessage"></span>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										出租情况
									</div>
								</td>
								<td width="352" height="35" class="STYLE1">
									<div align="left">
										<select name="isRenting" id="isRenting"
											style="width: 200px; height: 17px; font-size: 12px;">
											<option value="0">
												未出租
											</option>
											<option value="1">
												已出租
											</option>
										</select>
									</div>
								</td>
								<td width="173" height="35" class="STYLE1" nowrap="nowrap">
									<div align="left">
										上传汽车图片
									</div>
								</td>
								<td width="188" height="35" class="STYLE1">
									<div align="left">
										<input type="file" name="file" id="file"
											onblur="checkEach(this.id,this.value)"
											style="width: 200px; height: 17px; font-size: 12px; border: solid 1px #ccc;" />
									</div>
									<span id="fileMessage"></span>
								</td>
							</tr>
							<tr>
								<td width="142" height="35" class="STYLE1">
									<div align="center" nowrap="nowrap">
										<div align="left">
											汽车简介
										</div>
									</div>
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<div align="left">
										<textarea name="description" id="description"
											onblur="checkEach(this.id,this.value)"
											style="width: 600px; height: 100px;"></textarea>
									</div>
									<span id="descriptionMessage"></span>
								</td>
							</tr>
							<tr>
								<td height="40" class="STYLE1">
									&nbsp;
								</td>
								<td height="35" colspan="3" class="STYLE1">
									<div style="text-align: center">
										<img src="images/tianjia.jpg" width="57" height="20"
											onclick="checkAll()">
										<img src="images/cz.jpg" width="57" height="20"
											onclick="form_reset()">
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
