/*
Navicat MySQL Data Transfer

Source Server         : localhost_3309
Source Server Version : 50162
Source Host           : localhost:3309
Source Database       : carrental2

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2019-05-08 21:43:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `car`
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `car_id` int(11) NOT NULL AUTO_INCREMENT,
  `car_name` varchar(50) DEFAULT NULL,
  `car_model` varchar(100) DEFAULT NULL,
  `car_desc` varchar(255) DEFAULT NULL,
  `car_color` varchar(50) DEFAULT NULL,
  `car_oil` varchar(50) DEFAULT NULL,
  `car_dis` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of car
-- ----------------------------
INSERT INTO `car` VALUES ('1', '宝马', 'X5', '非常棒', '白色', '15', '3.0');
INSERT INTO `car` VALUES ('2', '奔驰', '404', '非常快', '黑色', '12', '2.0');
INSERT INTO `car` VALUES ('3', '马自达', 'CX-5', '巴适得板哈', '魂动红', '8', '2.5');
INSERT INTO `car` VALUES ('4', '福特', '野马', '野马标志尾灯，让人欲罢不能', '白色', '15', '5.0');

-- ----------------------------
-- Table structure for `custom`
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_name` varchar(300) DEFAULT NULL,
  `custom_phone` varchar(50) DEFAULT NULL,
  `custom_address` varchar(300) DEFAULT NULL,
  `custom_date` datetime DEFAULT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of custom
-- ----------------------------
INSERT INTO `custom` VALUES ('1', '张三', '15888888881', '地址1', '2016-04-05 00:24:36');
INSERT INTO `custom` VALUES ('2', '李四', '15888888882', '地址2', '2016-04-05 00:24:53');

-- ----------------------------
-- Table structure for `rental`
-- ----------------------------
DROP TABLE IF EXISTS `rental`;
CREATE TABLE `rental` (
  `rental_id` int(11) NOT NULL AUTO_INCREMENT,
  `apply_date` datetime DEFAULT NULL,
  `custom_id` int(11) DEFAULT NULL,
  `car_id` int(11) DEFAULT NULL,
  `rental_count` int(11) DEFAULT NULL,
  `rental_date1` date DEFAULT NULL,
  `rental_date2` date DEFAULT NULL,
  `rental_money` double DEFAULT NULL,
  `rental_flag` int(11) DEFAULT '1' COMMENT '1:租赁中 2:续租中 3:已归还',
  PRIMARY KEY (`rental_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rental
-- ----------------------------
INSERT INTO `rental` VALUES ('1', '2016-04-05 00:00:00', '1', '1', '2', '2016-04-05', '2016-04-09', '2100', '3');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL,
  `user_pass` varchar(200) DEFAULT NULL,
  `real_name` varchar(50) DEFAULT NULL,
  `user_sex` int(11) DEFAULT '1' COMMENT '1：男 2：女',
  `user_phone` varchar(50) DEFAULT NULL,
  `user_mail` varchar(50) DEFAULT NULL,
  `user_date` datetime DEFAULT NULL,
  `user_type` int(11) DEFAULT '0' COMMENT '1:用户（预留） 2:管理员',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'admin', '4cb0a5502e9aa44a0ca99e96742f2e788aad875a', '方海苗', '2', '18888888888', '18888888888@163.com', '2015-12-23 14:40:26', '2');
