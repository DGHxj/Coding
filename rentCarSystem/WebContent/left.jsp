<%@page import="com.rentCarSystem.domain.Menu"%>
<%@page import="com.rentCarSystem.domain.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%><%@page import="com.rentCarSystem.commons.Constants"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>My JSP 'menu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    <SCRIPT language=javascript src="js/dtree/dtree.js"></SCRIPT>
    <script type="text/javascript" src="js/java-like.util.js"></script>
    <link rel="stylesheet" href="js/dtree/dtree.css" type="text/css">

  </head>
  
  <body>
  <form action="" name="form1" method=POST>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td rowspan="5" width="1" bgcolor="CCCCCC"></td>
            <td bgcolor="CCCCCC" height="1"></td>
            <td rowspan="4" bgcolor="CCCCCC" width="1"></td>
        </tr>
 
        <tr>
            <td bgcolor="E3E7FF" align="center" height="5"></td>
        </tr>
 
        <tr>
            <td bgcolor="CCCCCC" height="1"></td>
        </tr>
 
        <tr>
            <td bgcolor="F9F9F9" align="center" valign="top">
                <table width="90%" border="0" align="center" cellpadding="1" cellspacing="1" bgcolor="F5F5F5">
                    <tr bgcolor="F3F9FF">
                        <td bgcolor="F5F5F5">
                            <script LANGUAGE="JavaScript">
                                d = new dTree('d');
                                d.config.target = "right";
                                d.config.imageDir = 'js/dtree/img';
                                d.reSetImagePath();
                                d.config.folderLinks = false;
                                d.config.closeSameLevel = true;
                                var isOpen ;
                                //根节点
                             <%
                                	User user = (User)session.getAttribute(Constants.SESSION_KEY);
                            
                                	if(user != null){
                                	List menus=user.getMenus();
                                	for(int i=0;i<menus.size();i++){
                                	Menu m = (Menu)menus.get(i);
                                %>
                                d.add(<%=m.getMenuId() %>, <%=m.getFatherId() %>, '<%=m.getMenuName() %>', '<%=m.getConnURL() %>', '', 'rightFrame');
                                <%
                                	}
                                	}
                                %>
                                document.write(d);
                            </script>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
 
        <tr>
            <td background="images/jao1.gif" colspan="2" align="right"><img
                    src="images/jao.gif" width="8" height="8"></td>
        </tr>
 
    </table>
</form>

  </body>
</html>
