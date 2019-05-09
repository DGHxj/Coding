<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:if test="#attr.car!=null && #attr.car.car_id!=0">编辑</s:if><s:else>添加</s:else>汽车信息</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script language="javascript" type="text/javascript">
$(document).ready(function(){
	 var num = /^\d+$/;
	 $("#addBtn").bind('click',function(){
		if($("#paramsCar\\.car_name").val()==''){
			alert('汽车品牌不能为空');
			return;
		}
		if($("#paramsCar\\.car_model").val()==''){
			alert('汽车型号不能为空');
			return;
		}
		$("#paramsCar\\.car_id").val(0);
		$("#info").attr('action','Admin_addCar.action').submit();
		 
	 });
	 
	 $("#editBtn").bind('click',function(){
		 if($("#paramsCar\\.car_name").val()==''){
				alert('汽车品牌不能为空');
				return;
			}
			if($("#paramsCar\\.car_model").val()==''){
				alert('汽车型号不能为空');
				return;
			}
			$("#info").attr('action','Admin_saveCar.action').submit();
			 
	});
	
});
</script>
<style type="text/css">
</style>
</head>
<body>
<div class="pageTitle">
	&nbsp;&nbsp;<img src="images/right1.gif" align="middle" /> &nbsp;<span id="MainTitle" style="color:white">汽车管理&gt;&gt;<s:if test="#attr.car!=null && #attr.car.car_id!=0">编辑</s:if><s:else>添加</s:else>汽车</span>
</div>
<form id="info" name="info" action="Admin_addCar.action" enctype="multipart/form-data" method="post">   
<s:hidden id="paramsCar.car_id" name="paramsCar.car_id" value="%{#attr.car.car_id}" /> 
<table width="100%" align="center" cellpadding="0" cellspacing="0" style="margin-top:0px;margin-bottom:0px;">
  <tr> 
     <td height="24">
       <Table border="0" cellspacing="0" cellpadding="0" align="center" width="100%"> 
            <TR>
              <TD height="24" class="edittitleleft">&nbsp;</TD>
              <TD class="edittitle"><s:if test="#attr.car!=null && #attr.car.car_id!=0">编辑</s:if><s:else>添加</s:else>汽车</TD>
              <TD class="edittitleright">&nbsp;</TD>
            </TR>
        </TABLE>
     </td>
   </tr>
   <tr>
     <td height="1" bgcolor="#8f8f8f"></td>
   </tr>
   <tr>
     <td >
     <table width="100%" align="center" cellpadding="1" cellspacing="1" class="editbody">
       <tr>
          <td width="50%" align="right" style="padding-right:5px"><font color="red">*</font> 汽车品牌：</td>
          <td width="50%" >
          	<s:textfield name="paramsCar.car_name" id="paramsCar.car_name" value="%{#attr.car.car_name}" style="width:300px"/>
          </td>
        </tr> 
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 汽车型号：</td>
          <td colspan="3">
            <s:textfield name="paramsCar.car_model" id="paramsCar.car_model" value="%{#attr.car.car_model}" style="width:300px"/>
          </td>
        </tr>
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 汽车颜色：</td>
          <td colspan="3">
            <s:textfield name="paramsCar.car_color" id="paramsCar.car_color" value="%{#attr.car.car_color}" style="width:300px"/>
          </td>
        </tr>  
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 汽车油耗：</td>
          <td colspan="3">
            <s:textfield name="paramsCar.car_oil" id="paramsCar.car_oil" value="%{#attr.car.car_oil}" style="width:300px"/>
          </td>
        </tr>   
        <tr>
          <td align="right" style="padding-right:5px"><font color="red">*</font> 汽车排量：</td>
          <td colspan="3">
            <s:textfield name="paramsCar.car_dis" id="paramsCar.car_dis" value="%{#attr.car.car_dis}" style="width:300px"/>
          </td>
        </tr>    
         <tr>
          <td align="right" style="padding-right:5px">汽车描述：</td>
          <td>
          	<s:textarea cssStyle="width:305px;height:80px" name="paramsCar.car_desc" id="paramsCar.car_desc" value="%{#attr.car.car_desc}"/>
          </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px" align="right">汽车图片：</td>
            <td>
                <s:file name="paramsCar.car_img" class="form-control" label="上传图片"/>
            </td>
            
        </tr>
     </table>
     </td>
   </tr>  
   <tr>
     <td>
       <table width="100%" align="center" cellpadding="0" cellspacing="0" class="editbody">
        <tr class="editbody">
          <td align="center" height="30">
          	<s:if test="#attr.car!=null && #attr.car.car_id!=0">
          	<input type="button" id="editBtn" Class="btnstyle" value="编 辑"/> 
          	</s:if>
          	<s:else>
          	<input type="button" id="addBtn" Class="btnstyle" value="添 加" />
          	</s:else>
            &nbsp;<label style="color:red">${tip}</label>
          </td>
        </tr>
      </table>
     </td>
   </tr>
</table>
</form>
</body>
</html>