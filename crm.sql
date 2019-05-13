/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50722
Source Host           : 39.96.11.192:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-05-13 09:32:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS `model`;
CREATE TABLE `model` (
  `m_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_name` varchar(255) DEFAULT NULL,
  `m_parentId` int(11) DEFAULT NULL,
  `m_path` varchar(255) DEFAULT NULL,
  `m_weight` int(11) DEFAULT NULL,
  `m_weitghtDescribe` varchar(255) DEFAULT NULL,
  `m_ops` varchar(255) DEFAULT NULL,
  `m_exitInt` int(11) DEFAULT NULL,
  `m_exitString` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of model
-- ----------------------------

-- ----------------------------
-- Table structure for modelroles
-- ----------------------------
DROP TABLE IF EXISTS `modelroles`;
CREATE TABLE `modelroles` (
  `mr_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL,
  `m_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`mr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of modelroles
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_name` varchar(255) DEFAULT NULL,
  `exitInt` int(11) DEFAULT NULL,
  `exitString` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '1', null, null);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(255) DEFAULT NULL,
  `stu_sex` varchar(255) DEFAULT NULL,
  `stu_age` int(11) DEFAULT NULL,
  `stu_tel` varchar(255) DEFAULT NULL,
  `stu_xueli` varchar(255) DEFAULT NULL,
  `stu_State` int(11) DEFAULT NULL,
  `stu_sourcer` varchar(255) DEFAULT NULL,
  `stu_site` varchar(255) DEFAULT NULL,
  `stu_qq` varchar(255) DEFAULT NULL,
  `stu_weiXin` varchar(255) DEFAULT NULL,
  `stu_reported` int(255) DEFAULT NULL,
  `stu_note` varchar(255) DEFAULT NULL,
  `stu_Address` varchar(255) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  `p_class` varchar(255) DEFAULT NULL,
  `p_validity` int(255) DEFAULT NULL,
  `p_whyValidity` varchar(255) DEFAULT NULL,
  `p_score` int(11) DEFAULT NULL,
  `p_isReturn` int(11) DEFAULT NULL,
  `p_firstReturnTime` date DEFAULT NULL,
  `p_isTheDoor` varchar(255) DEFAULT NULL,
  `p_timeTheDoor` date DEFAULT NULL,
  `p_isPay` varchar(255) DEFAULT NULL,
  `p_payTime` date DEFAULT NULL,
  `p_price` double DEFAULT NULL,
  `p_isRefund` varchar(255) DEFAULT NULL,
  `p_isClass` varchar(255) DEFAULT NULL,
  `p_classTime` date DEFAULT NULL,
  `p_classNote` varchar(255) DEFAULT NULL,
  `p_whyRefund` varchar(255) DEFAULT NULL,
  `p_deposit` double DEFAULT NULL,
  `p_depositTime` date DEFAULT NULL,
  `rouleNote` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '张旭', '男', '21', '15237862615', '大专', '1', '百度', 'www.baidu.com', '2659934947', '15237862615', '0', 'god', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('2', '赵晓阳', '女', '18', '15326488796', '本科', '2', '网易', '网易', '546', '+23132', '1', '哈哈', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('3', '周西亚', '男', '25', '12121213', '高中', '1', 'Alibaba', '阿里巴巴', '456123', '4894656515', '1', '厉害', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('4', '1', '1', '1', '1', '1', '1', '1', '1', '1', '11', null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('5', '2', '2', '2', '2', '2', '2', '2', '2', '2', '2', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('6', '3', '3', '3', '3', '3', '3', '3', '3', '3', '3', null, '3', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('7', '4', '4', '4', '4', '4', '4', '4', '4', '4', '4', null, '4', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('8', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', null, '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('9', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('10', '5', '5', '5', '5', '5', '5', '5', '5', '5', '5', null, '5', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `student` VALUES ('11', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for xueshenghuifang
-- ----------------------------
DROP TABLE IF EXISTS `xueshenghuifang`;
CREATE TABLE `xueshenghuifang` (
  `t_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `y_id` int(11) DEFAULT NULL,
  `t_visitTime` datetime DEFAULT NULL,
  `t_Revisit` varchar(255) DEFAULT NULL,
  `t_method` varchar(255) DEFAULT NULL,
  `t_nextTraceTime` datetime DEFAULT NULL,
  `t_note` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xueshenghuifang
-- ----------------------------

-- ----------------------------
-- Table structure for yonghu
-- ----------------------------
DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE `yonghu` (
  `y_id` int(11) NOT NULL AUTO_INCREMENT,
  `y_name` varchar(255) DEFAULT NULL,
  `y_password` varchar(255) DEFAULT NULL,
  `y_email` varchar(255) DEFAULT NULL,
  `y_lastLoginTime` datetime DEFAULT NULL,
  `y_tel` varchar(255) DEFAULT NULL,
  `y_createTime` datetime DEFAULT NULL,
  `y_pasdWrongShu` int(11) DEFAULT NULL,
  `y_isLockout` int(11) DEFAULT NULL,
  `y_weight` int(11) DEFAULT NULL,
  `y_yanzhengma` varchar(255) DEFAULT NULL,
  `y_resetPassword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`y_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yonghu
-- ----------------------------
INSERT INTO `yonghu` VALUES ('1', '11', '1', '1', '2019-05-11 15:55:51', '1', '2019-05-07 15:55:53', '1', '1', '1', '1', 'ysd123');
INSERT INTO `yonghu` VALUES ('3', '2', '1', '2', '2019-05-23 15:55:51', '1', '2019-05-14 15:55:53', '1', '1', '1', '1', 'ysd123');
INSERT INTO `yonghu` VALUES ('4', '4', '1', '1', '2019-06-01 15:55:51', '1', '2019-06-08 15:55:53', '1', '2', '1', '1', 'ysd123');
INSERT INTO `yonghu` VALUES ('5', '6', '1', '1', '2019-05-07 15:55:51', '1', '2019-06-09 15:55:53', '1', '2', '1', '1', 'ysd123');

-- ----------------------------
-- Table structure for yonghujuese
-- ----------------------------
DROP TABLE IF EXISTS `yonghujuese`;
CREATE TABLE `yonghujuese` (
  `yr_id` int(11) NOT NULL AUTO_INCREMENT,
  `y_id` int(11) DEFAULT NULL,
  `r_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`yr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yonghujuese
-- ----------------------------

-- ----------------------------
-- Table structure for yonghuqiandao
-- ----------------------------
DROP TABLE IF EXISTS `yonghuqiandao`;
CREATE TABLE `yonghuqiandao` (
  `yq_id` int(11) NOT NULL AUTO_INCREMENT,
  `y_id` int(11) DEFAULT NULL,
  `yq_state` int(255) DEFAULT NULL,
  `yq_startTime` datetime DEFAULT NULL,
  `yq_endTime` datetime DEFAULT NULL,
  PRIMARY KEY (`yq_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yonghuqiandao
-- ----------------------------
