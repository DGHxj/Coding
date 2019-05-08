/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_car_rent

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-06-08 16:28:13
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cars`
-- ----------------------------
DROP TABLE IF EXISTS `cars`;
CREATE TABLE `cars` (
  `CARNUMBER` varchar(20) NOT NULL,
  `CARTYPE` varchar(50) DEFAULT NULL,
  `COLOR` varchar(10) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `RENTPRICE` decimal(10,2) DEFAULT NULL,
  `DEPOSIT` decimal(10,2) DEFAULT NULL,
  `ISRENTING` varchar(20) DEFAULT NULL,
  `CARDESC` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`CARNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cars
-- ----------------------------
INSERT INTO `cars` VALUES ('沪A0002', '宝马X5', '橙色', '1560000.00', '4999.00', '40000.00', '0', '宝马。');
INSERT INTO `cars` VALUES ('沪A00078', '奥迪A8', '蓝色', '1360000.00', '3999.00', '50000.00', '0', '奥迪车，很高大上。');
INSERT INTO `cars` VALUES ('沪B0002', '奔驰c300', '黑色', '988888.00', '566.00', '5000.00', '0', '奔驰。');
INSERT INTO `cars` VALUES ('湘A-8881', '2', '黑色', '2.00', '222.00', '2.00', '1', '2');
INSERT INTO `cars` VALUES ('湘A-8884', '湘A-8884', '黑色', '111.00', '111.00', '111.00', '0', '111');
INSERT INTO `cars` VALUES ('湘A-88886', 'BAOMA', '黑色', '1.00', '1.00', '1.00', '0', ' 特好');
INSERT INTO `cars` VALUES ('苏A0001', '奇骏四驱2.5L豪华版', '白色', '239888.00', '398.00', '3000.00', '0', '奇骏，suv。');

-- ----------------------------
-- Table structure for `checktable`
-- ----------------------------
DROP TABLE IF EXISTS `checktable`;
CREATE TABLE `checktable` (
  `CHECKID` decimal(18,0) NOT NULL,
  `CHECKDATE` datetime DEFAULT NULL,
  `FIELD` varchar(100) DEFAULT NULL,
  `PROBLEM` varchar(100) DEFAULT NULL,
  `PAYING` decimal(10,2) DEFAULT NULL,
  `CHECKUSERID` varchar(40) DEFAULT NULL,
  `RENTID` decimal(18,0) DEFAULT NULL,
  PRIMARY KEY (`CHECKID`),
  KEY `CHECKTABLE_USERS_FK1` (`CHECKUSERID`),
  KEY `CHECKTABLE_RENTTABLE_FK2` (`RENTID`),
  CONSTRAINT `CHECKTABLE_RENTTABLE_FK2` FOREIGN KEY (`RENTID`) REFERENCES `renttable` (`TABLEID`),
  CONSTRAINT `CHECKTABLE_USERS_FK1` FOREIGN KEY (`CHECKUSERID`) REFERENCES `users` (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of checktable
-- ----------------------------
INSERT INTO `checktable` VALUES ('1527669120000', '2018-05-30 00:00:00', '可以', '没有问题', '0.00', 'admin', '1527668440880');
INSERT INTO `checktable` VALUES ('1527669317801', '2018-05-30 00:00:00', '很好', '没有问题', '2.00', 'admin', '1527669225041');
INSERT INTO `checktable` VALUES ('1527672056268', '2018-05-30 00:00:00', '可以', '没有问题', '0.00', 'admin', '1527669390307');
INSERT INTO `checktable` VALUES ('1527832864643', '2018-06-01 00:00:00', '可以呀', '么的问题', '300.00', 'admin', '1527831524732');
INSERT INTO `checktable` VALUES ('1527833026218', '2018-06-01 00:00:00', '可以的', '嗯', '0.00', 'admin', '1527668440880');

-- ----------------------------
-- Table structure for `customers`
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `IDENTITY` varchar(40) NOT NULL,
  `CUSTNAME` varchar(40) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `CAREER` varchar(20) DEFAULT NULL,
  `CUSTPWD` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IDENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('111111111111111111', '马云', '男', '杭州', '13111111111', '董事长', '123456');
INSERT INTO `customers` VALUES ('13070319901020091x', '马化腾', '男', '张家口', '18910221124', 'CEO', '112358');
INSERT INTO `customers` VALUES ('323232322222222222', '张三', '男', '上海市浦东新区幻林东路', '13565656888', '卡车司机', '111111');
INSERT INTO `customers` VALUES ('323232322222222226', '李四', '男', '上海市', '13918621985', '设计师', '111111');
INSERT INTO `customers` VALUES ('323232322222222228', '王麻子', '男', '北京三里屯', '18888888888', '司机', '111111');
INSERT INTO `customers` VALUES ('333333333333333333', '刘强东', '男', '上海市浦东新区幻林东路', '18888888888', '董事长', '111111');

-- ----------------------------
-- Table structure for `funs`
-- ----------------------------
DROP TABLE IF EXISTS `funs`;
CREATE TABLE `funs` (
  `FUNID` decimal(8,0) NOT NULL,
  `FUNNAME` varchar(40) DEFAULT NULL,
  `FUNURL` varchar(40) DEFAULT NULL,
  `MENUID` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`FUNID`),
  KEY `FUNS_FK` (`MENUID`),
  CONSTRAINT `FUNS_FK` FOREIGN KEY (`MENUID`) REFERENCES `menus` (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funs
-- ----------------------------
INSERT INTO `funs` VALUES ('1', '主页面', 'main.jsp', '1');
INSERT INTO `funs` VALUES ('2', '头页面', 'top.jsp', '1');
INSERT INTO `funs` VALUES ('3', '菜单页面', 'left.jsp', '1');
INSERT INTO `funs` VALUES ('4', '脚页面', 'down.jsp', '1');
INSERT INTO `funs` VALUES ('5', '操作页面', 'right.jsp', '1');
INSERT INTO `funs` VALUES ('6', '权限提示页面', 'norole.jsp', '1');
INSERT INTO `funs` VALUES ('7', '中心页面', 'center.jsp', '1');
INSERT INTO `funs` VALUES ('8', '退出系统动作', 'ExitUser.do', '1');
INSERT INTO `funs` VALUES ('9', '菜单导航', 'modNavTop.jsp', '1');
INSERT INTO `funs` VALUES ('10', '菜单条', 'splitor.jsp', '1');
INSERT INTO `funs` VALUES ('11', '操作失败提示页面', 'error.jsp', '1');
INSERT INTO `funs` VALUES ('12', '系统崩溃提示页面', 'appError.jsp', '1');
INSERT INTO `funs` VALUES ('13', '成功页面', 'success.jsp', '1');
INSERT INTO `funs` VALUES ('50', '添加用户角色查询动作', 'PreAddUser.do', '3');
INSERT INTO `funs` VALUES ('51', '添加用户页面', 'addUser.jsp', '3');
INSERT INTO `funs` VALUES ('52', '添加用户动作', 'AddUser.do', '3');
INSERT INTO `funs` VALUES ('53', '查询用户角色查询动作', 'PreFindUser.do', '4');
INSERT INTO `funs` VALUES ('54', '查询用户页面', 'findUser.jsp', '4');
INSERT INTO `funs` VALUES ('55', '显示查询用户结果页面', 'viewUser.jsp', '4');
INSERT INTO `funs` VALUES ('56', '查询用户动作', 'FindUser.do', '4');
INSERT INTO `funs` VALUES ('57', '预更新查询用户动作', 'PreUpdateUser.do', '4');
INSERT INTO `funs` VALUES ('58', '显示更新用户页面', 'updateUser.jsp', '4');
INSERT INTO `funs` VALUES ('59', '更新用户动作', 'UpdateUser.do', '4');
INSERT INTO `funs` VALUES ('60', '删除用户动作', 'DeleteUser.do', '4');
INSERT INTO `funs` VALUES ('61', '预修改用户密码', 'PreChangeUserPwd.do', '4');
INSERT INTO `funs` VALUES ('62', '修改用户密码页面', 'changeUserPwd.jsp', '4');
INSERT INTO `funs` VALUES ('63', '修改用户密码动作', 'ChangeUserPwd.do', '4');
INSERT INTO `funs` VALUES ('100', '添加客户页面', 'addCustomers.jsp', '6');
INSERT INTO `funs` VALUES ('101', '添加客户动作', 'addCustomersServlet.do', '6');
INSERT INTO `funs` VALUES ('102', '查询客户页面', 'findCustomers.jsp', '7');
INSERT INTO `funs` VALUES ('103', '查询客户信息动作', 'findCustomersServlet.do', '7');
INSERT INTO `funs` VALUES ('104', '显示查询客户结果页面', 'viewCustomers.jsp', '7');
INSERT INTO `funs` VALUES ('105', '预更新客户查询动作', 'PreCustomers.do', '7');
INSERT INTO `funs` VALUES ('106', '显示更新客户页面', 'updateCustomers.jsp', '7');
INSERT INTO `funs` VALUES ('107', '更新客户动作', 'updateCustomersServlet.do', '7');
INSERT INTO `funs` VALUES ('108', '删除客户动作', 'deleteCustomersServlet.do', '7');
INSERT INTO `funs` VALUES ('109', '预修改客户密码', 'preChangeCustomerPwd.do', '7');
INSERT INTO `funs` VALUES ('110', '修改客户密码页面', 'chengeCustomersPwd.jsp', '7');
INSERT INTO `funs` VALUES ('111', '修改客户密码动作', 'chengeCustomersPwdServlet.do', '7');
INSERT INTO `funs` VALUES ('112', '查询所有客户动作', 'findAllCustomersServlet.do', '7');
INSERT INTO `funs` VALUES ('113', '删除多个客户动作', 'deleteAllCustomersServlet.do', '7');
INSERT INTO `funs` VALUES ('200', '添加汽车页面', 'addCar.jsp', '9');
INSERT INTO `funs` VALUES ('201', '添加汽车动作', 'addCar.do', '9');
INSERT INTO `funs` VALUES ('202', '查询汽车页面', 'findCar.jsp', '10');
INSERT INTO `funs` VALUES ('203', '显示查询汽车结果页面', 'viewCar.jsp', '10');
INSERT INTO `funs` VALUES ('204', '查询汽车信息动作', 'findCar.do', '10');
INSERT INTO `funs` VALUES ('205', '预更新查询汽车动作', 'PreUpdateCar.do', '10');
INSERT INTO `funs` VALUES ('206', '显示更新汽车结果页面', 'updateCar.jsp', '10');
INSERT INTO `funs` VALUES ('207', '更新汽车动作', 'UpdateCar.do', '10');
INSERT INTO `funs` VALUES ('209', '删除汽车动作', 'deleteCar.do', '10');
INSERT INTO `funs` VALUES ('210', '查询所有汽车动作', 'findAllCar.do', '10');
INSERT INTO `funs` VALUES ('211', '删除多个汽车动作', 'DeleteAllCarServlet.do', '10');
INSERT INTO `funs` VALUES ('300', '租车页面', 'rentCar.jsp', '12');
INSERT INTO `funs` VALUES ('301', '预生成出租单动作', 'preCreateRentCarTableServlet.do', '12');
INSERT INTO `funs` VALUES ('302', '预生成出租单页面', 'preCreateRenting.jsp', '12');
INSERT INTO `funs` VALUES ('303', '生成出租单动作', 'createRentCarTableServlet.do', '12');
INSERT INTO `funs` VALUES ('304', '汽车出租单查询页面', 'returnCar.jsp', '13');
INSERT INTO `funs` VALUES ('305', '预还车查询动作', 'PreReturnCarSearch.do', '13');
INSERT INTO `funs` VALUES ('306', '创建检查单页面', 'createCheckTable.jsp', '13');
INSERT INTO `funs` VALUES ('307', '创建检查单动作', 'CreateCheckTable.do', '13');
INSERT INTO `funs` VALUES ('308', '出租单管理页面', 'rentManager.jsp', '14');
INSERT INTO `funs` VALUES ('309', '出租单管理查询动作', 'RentManagerSearch.do', '14');
INSERT INTO `funs` VALUES ('310', '显示查询出租单结果页面', 'viewRenttables.jsp', '14');
INSERT INTO `funs` VALUES ('311', '预更新出租单查询动作', 'PreUpdateRenttable.do', '14');
INSERT INTO `funs` VALUES ('312', '更新出租单页面', 'updateRenttable.jsp', '14');
INSERT INTO `funs` VALUES ('313', '更新出租单动作', 'updeateRentTable.do', '14');
INSERT INTO `funs` VALUES ('314', '删除出租单动作', 'DeleteRenttable.do', '14');
INSERT INTO `funs` VALUES ('315', '检查单管理页面', 'checkManager.jsp', '15');
INSERT INTO `funs` VALUES ('316', '查询检查单动作', 'findCheckTableById.do', '15');
INSERT INTO `funs` VALUES ('317', '显示查询检查单结果页面', 'viewCheckTables.jsp', '15');
INSERT INTO `funs` VALUES ('318', '预更新检查单查询动作', 'PreUdateCheckTable.do', '15');
INSERT INTO `funs` VALUES ('319', '更新检查单页面', 'updateCheckTable.jsp', '15');
INSERT INTO `funs` VALUES ('320', '更新检查单动作', 'updateCheckTable.do', '15');
INSERT INTO `funs` VALUES ('321', '删除检查单动作', 'deleteCheckTableServlet.do', '15');
INSERT INTO `funs` VALUES ('322', '查询当月应还汽车动作', 'MonthReturnCar.do', '17');
INSERT INTO `funs` VALUES ('323', '查询所有出租单动作', 'findAllRentCarTable.do', '14');
INSERT INTO `funs` VALUES ('324', '查询单个出租单动作', 'findRentCarTableById.do', '14');
INSERT INTO `funs` VALUES ('325', '删除单个出租单动作', 'deleteRentTableServlet.do', '14');
INSERT INTO `funs` VALUES ('326', '查询所有检查单动作', 'findAllCheckTable.do', '15');
INSERT INTO `funs` VALUES ('327', '删除多个检查单动作', 'deleteAllCheckTableServlet.do', '15');
INSERT INTO `funs` VALUES ('328', '删除多个出租单动作', 'deleteAllRentTableServlet.do', '14');
INSERT INTO `funs` VALUES ('400', '显示当月应还车结果页面', 'viewMonthReturnCarResult.jsp', '17');
INSERT INTO `funs` VALUES ('401', '查询当月应归还汽车相信信息', 'FindMonthReturnCarByInfo.do', '17');
INSERT INTO `funs` VALUES ('402', '显示当月应还汽车详细信息', 'findMonthReturnCarByInfo.jsp', '17');
INSERT INTO `funs` VALUES ('600', '日志查询页面', 'findLogs.jsp', '20');
INSERT INTO `funs` VALUES ('601', '日志查询动作', 'findLogsServlet.do', '20');
INSERT INTO `funs` VALUES ('602', '日志显示页面', 'viewAllLogs.jsp', '20');
INSERT INTO `funs` VALUES ('603', '删除单个日志动作', 'deleteLogsServlet.do', '20');
INSERT INTO `funs` VALUES ('604', '删除多个日志动作', 'deleteAllLogs.do', '20');
INSERT INTO `funs` VALUES ('800', '角色管理页面', 'roleMain.jsp', '18');
INSERT INTO `funs` VALUES ('801', '查询角色页面', 'viewRole.jsp', '18');
INSERT INTO `funs` VALUES ('802', '查询角色动作', 'findAllRole.do', '18');
INSERT INTO `funs` VALUES ('803', '添加角色动作', 'addRole.do', '18');
INSERT INTO `funs` VALUES ('804', '添加角色页面', 'addRole.jsp', '18');
INSERT INTO `funs` VALUES ('805', '修改角色动作', 'updateRole.do', '18');
INSERT INTO `funs` VALUES ('806', '删除角色动作', 'deleteRole.do', '18');
INSERT INTO `funs` VALUES ('807', '显示所有角色页面', 'viewAllRole.jsp', '18');
INSERT INTO `funs` VALUES ('808', '预添加角色动作', 'PreAddRole.do', '18');
INSERT INTO `funs` VALUES ('809', '添加角色动作', 'addRole.do', '18');
INSERT INTO `funs` VALUES ('810', '查询单个角色动作', 'findRole.do', '18');

-- ----------------------------
-- Table structure for `logs`
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs` (
  `ID` int(8) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(40) DEFAULT NULL,
  `ACTION` varchar(40) DEFAULT NULL,
  `ACTIONTIME` datetime DEFAULT NULL,
  `FLAG` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES ('1', 'admin', '生成出租单', '2018-05-30 16:20:53', '1');
INSERT INTO `logs` VALUES ('2', 'admin', '生成检查单', '2018-05-30 16:32:12', '2');
INSERT INTO `logs` VALUES ('3', 'admin', '生成检查单', '2018-05-30 16:33:03', '2');
INSERT INTO `logs` VALUES ('4', 'admin', '生成出租单', '2018-05-30 16:34:09', '1');
INSERT INTO `logs` VALUES ('5', 'admin', '生成检查单', '2018-05-30 16:35:48', '2');
INSERT INTO `logs` VALUES ('6', 'admin', '生成出租单', '2018-05-30 16:36:44', '1');
INSERT INTO `logs` VALUES ('7', 'admin', '生成检查单', '2018-05-30 17:21:08', '2');
INSERT INTO `logs` VALUES ('8', 'admin', '生成出租单', '2018-06-01 13:39:03', '1');
INSERT INTO `logs` VALUES ('9', 'admin', '生成检查单', '2018-06-01 14:01:16', '2');

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `MENUID` decimal(8,0) NOT NULL,
  `MENUNAME` varchar(40) DEFAULT NULL,
  `CONNURL` varchar(40) DEFAULT NULL,
  `FATHERID` decimal(8,0) DEFAULT NULL,
  PRIMARY KEY (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', '汽车租赁管理系统', null, '-1');
INSERT INTO `menus` VALUES ('2', '用户管理', null, '1');
INSERT INTO `menus` VALUES ('3', '添加用户', 'PreAddUser.do', '2');
INSERT INTO `menus` VALUES ('4', '查询用户', 'PreFindUser.do', '2');
INSERT INTO `menus` VALUES ('5', '客户管理', null, '1');
INSERT INTO `menus` VALUES ('6', '添加客户信息', 'custManager/addCustomers.jsp', '5');
INSERT INTO `menus` VALUES ('7', '查询客户信息', 'custManager/findCustomers.jsp', '5');
INSERT INTO `menus` VALUES ('8', '汽车管理', null, '1');
INSERT INTO `menus` VALUES ('9', '添加汽车信息', 'carManager/addCar.jsp', '8');
INSERT INTO `menus` VALUES ('10', '查询汽车信息', 'carManager/findCar.jsp', '8');
INSERT INTO `menus` VALUES ('11', '业务管理', null, '1');
INSERT INTO `menus` VALUES ('12', '汽车出租', 'operatorManager/rentCar.jsp', '11');
INSERT INTO `menus` VALUES ('13', '汽车入库', 'operatorManager/returnCar.jsp', '11');
INSERT INTO `menus` VALUES ('14', '出租单管理', 'operatorManager/rentManager.jsp', '11');
INSERT INTO `menus` VALUES ('15', '检查单管理', 'operatorManager/checkManager.jsp', '11');
INSERT INTO `menus` VALUES ('16', '业务统计', null, '1');
INSERT INTO `menus` VALUES ('17', '车辆出租概览', 'MonthReturnCar.do', '16');
INSERT INTO `menus` VALUES ('18', '系统管理', null, '1');
INSERT INTO `menus` VALUES ('20', '日志管理', 'SystemManager/findLogs.jsp', '18');

-- ----------------------------
-- Table structure for `renttable`
-- ----------------------------
DROP TABLE IF EXISTS `renttable`;
CREATE TABLE `renttable` (
  `TABLEID` decimal(18,0) NOT NULL,
  `IMPREST` decimal(10,2) DEFAULT NULL,
  `SHOULDPAYPRICE` decimal(10,2) DEFAULT NULL,
  `PRICE` decimal(10,2) DEFAULT NULL,
  `BEGINDATE` datetime DEFAULT NULL,
  `SHOULDRETURNDATE` datetime DEFAULT NULL,
  `RETURNDATE` datetime DEFAULT NULL,
  `RENTFLAG` decimal(8,0) DEFAULT NULL,
  `CUSTID` varchar(20) DEFAULT NULL,
  `CARID` varchar(20) DEFAULT NULL,
  `USERID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`TABLEID`),
  KEY `RENTTABLE_CUSTIONERS_FK3` (`USERID`),
  KEY `RENTTABLE_CUSTOMERS_FK1` (`CUSTID`),
  KEY `RENTTABLE_CUSTONERS_FK2` (`CARID`),
  CONSTRAINT `RENTTABLE_CUSTIONERS_FK3` FOREIGN KEY (`USERID`) REFERENCES `users` (`USERNAME`),
  CONSTRAINT `RENTTABLE_CUSTOMERS_FK1` FOREIGN KEY (`CUSTID`) REFERENCES `customers` (`IDENTITY`),
  CONSTRAINT `RENTTABLE_CUSTONERS_FK2` FOREIGN KEY (`CARID`) REFERENCES `cars` (`CARNUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of renttable
-- ----------------------------
INSERT INTO `renttable` VALUES ('1527668440880', '3000.00', '2000.00', '2000.00', '2018-05-30 00:00:00', '2018-05-31 00:00:00', '2018-05-31 00:00:00', '1', '323232322222222226', '沪A0002', 'admin');
INSERT INTO `renttable` VALUES ('1527669225041', '5000.00', '3000.00', '3000.00', '2018-05-30 00:00:00', '2018-06-01 00:00:00', '2018-06-01 00:00:00', '1', '111111111111111111', '沪A00078', 'admin');
INSERT INTO `renttable` VALUES ('1527669390307', '3.00', '2.00', '2.00', '2018-05-29 00:00:00', '2018-05-30 00:00:00', '2018-05-30 00:00:00', '1', '111111111111111111', '沪A0002', 'admin');
INSERT INTO `renttable` VALUES ('1527831524732', '3000.00', '3000.00', '3000.00', '2018-06-01 00:00:00', '2018-06-05 00:00:00', '2018-06-02 00:00:00', '1', '323232322222222228', '湘A-8884', 'admin');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `ROLEID` int(8) NOT NULL AUTO_INCREMENT,
  `ROLENAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ROLEID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '管理员');
INSERT INTO `roles` VALUES ('2', '工作人员');
INSERT INTO `roles` VALUES ('3', '普通客户');

-- ----------------------------
-- Table structure for `roles_menus`
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus` (
  `ROLEID` int(8) NOT NULL,
  `MENUID` decimal(8,0) NOT NULL,
  PRIMARY KEY (`ROLEID`,`MENUID`),
  KEY `ROLES_MENUS_FK2` (`MENUID`),
  CONSTRAINT `ROLES_MENUS_FK1` FOREIGN KEY (`ROLEID`) REFERENCES `roles` (`ROLEID`),
  CONSTRAINT `ROLES_MENUS_FK2` FOREIGN KEY (`MENUID`) REFERENCES `menus` (`MENUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES ('1', '1');
INSERT INTO `roles_menus` VALUES ('1', '2');
INSERT INTO `roles_menus` VALUES ('1', '3');
INSERT INTO `roles_menus` VALUES ('1', '4');
INSERT INTO `roles_menus` VALUES ('1', '5');
INSERT INTO `roles_menus` VALUES ('1', '6');
INSERT INTO `roles_menus` VALUES ('1', '7');
INSERT INTO `roles_menus` VALUES ('1', '8');
INSERT INTO `roles_menus` VALUES ('1', '9');
INSERT INTO `roles_menus` VALUES ('1', '10');
INSERT INTO `roles_menus` VALUES ('1', '11');
INSERT INTO `roles_menus` VALUES ('1', '12');
INSERT INTO `roles_menus` VALUES ('1', '13');
INSERT INTO `roles_menus` VALUES ('1', '14');
INSERT INTO `roles_menus` VALUES ('1', '15');
INSERT INTO `roles_menus` VALUES ('1', '16');
INSERT INTO `roles_menus` VALUES ('1', '17');
INSERT INTO `roles_menus` VALUES ('1', '18');
INSERT INTO `roles_menus` VALUES ('1', '20');
INSERT INTO `roles_menus` VALUES ('2', '1');
INSERT INTO `roles_menus` VALUES ('2', '2');
INSERT INTO `roles_menus` VALUES ('2', '4');
INSERT INTO `roles_menus` VALUES ('2', '5');
INSERT INTO `roles_menus` VALUES ('2', '6');
INSERT INTO `roles_menus` VALUES ('2', '7');
INSERT INTO `roles_menus` VALUES ('2', '8');
INSERT INTO `roles_menus` VALUES ('2', '9');
INSERT INTO `roles_menus` VALUES ('2', '10');
INSERT INTO `roles_menus` VALUES ('2', '11');
INSERT INTO `roles_menus` VALUES ('2', '12');
INSERT INTO `roles_menus` VALUES ('2', '13');
INSERT INTO `roles_menus` VALUES ('2', '14');
INSERT INTO `roles_menus` VALUES ('2', '15');
INSERT INTO `roles_menus` VALUES ('2', '16');
INSERT INTO `roles_menus` VALUES ('2', '17');
INSERT INTO `roles_menus` VALUES ('3', '1');
INSERT INTO `roles_menus` VALUES ('3', '8');
INSERT INTO `roles_menus` VALUES ('3', '10');
INSERT INTO `roles_menus` VALUES ('3', '11');
INSERT INTO `roles_menus` VALUES ('3', '12');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `USERNAME` varchar(40) NOT NULL,
  `IDENTITY` varchar(20) DEFAULT NULL,
  `FULLNAME` varchar(20) DEFAULT NULL,
  `SEX` varchar(10) DEFAULT NULL,
  `ADDRESS` varchar(40) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `POSITION` varchar(20) DEFAULT NULL,
  `USERLEVEL` int(8) DEFAULT NULL,
  `USERPWD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`),
  KEY `USERS_UK` (`IDENTITY`),
  KEY `USER_FK` (`USERLEVEL`),
  CONSTRAINT `USER_FK` FOREIGN KEY (`USERLEVEL`) REFERENCES `roles` (`ROLEID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('admin', '130723199003011225', '猿来入此', '男', '上海市浦东新区', '13888888888', '总经理', '1', 'admin');
INSERT INTO `users` VALUES ('llqqxf', '62555554545', '张三丰', '男', '上海市浦东新区幻林东路', '13948485826', '程序员', '1', '111111');
INSERT INTO `users` VALUES ('ylrc', '656265656566565656', '赵雅琴', '女', '上海市浦东新区幻林东路', '13565656888', '英语老师', '1', '111111');
