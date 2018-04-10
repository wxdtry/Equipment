/*
Navicat MySQL Data Transfer

Source Server         : admin
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : equipment

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-06-07 15:55:00
*/

SET FOREIGN_KEY_CHECKS=0;

create database equipment;
use equipment;
-- ----------------------------
-- Table structure for academy
-- ----------------------------
DROP TABLE IF EXISTS `academy`;
CREATE TABLE `academy` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of academy
-- ----------------------------
INSERT INTO `academy` VALUES ('1', '电气学院');
INSERT INTO `academy` VALUES ('2', '轻工学院');
INSERT INTO `academy` VALUES ('3', '外国语学院');
INSERT INTO `academy` VALUES ('5', '化工学院');
INSERT INTO `academy` VALUES ('6', '外国语学院');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`adid`),
  KEY `FKffk85rogjm0fbknnwvl3ol5v2` (`aid`),
  CONSTRAINT `FKffk85rogjm0fbknnwvl3ol5v2` FOREIGN KEY (`aid`) REFERENCES `academy` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '管理员', 'admin', '1192975847@qq.com', '1');

-- ----------------------------
-- Table structure for classinfo
-- ----------------------------
DROP TABLE IF EXISTS `classinfo`;
CREATE TABLE `classinfo` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `FKb3mfijucou2xd3a0i6s042wbd` (`aid`),
  CONSTRAINT `FKb3mfijucou2xd3a0i6s042wbd` FOREIGN KEY (`aid`) REFERENCES `academy` (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classinfo
-- ----------------------------
INSERT INTO `classinfo` VALUES ('1', '电子13-1', '1');
INSERT INTO `classinfo` VALUES ('2', '电子13-2', '1');
INSERT INTO `classinfo` VALUES ('3', '通信13-1', '1');
INSERT INTO `classinfo` VALUES ('4', '材料13-1', '5');
INSERT INTO `classinfo` VALUES ('5', '通信13-2', '1');
INSERT INTO `classinfo` VALUES ('6', '电气13-1', '1');
INSERT INTO `classinfo` VALUES ('7', '电气13-2', '1');
INSERT INTO `classinfo` VALUES ('8', '电气13-3', '1');
INSERT INTO `classinfo` VALUES ('9', '电气13-4', '1');

-- ----------------------------
-- Table structure for equipmentinfo
-- ----------------------------
DROP TABLE IF EXISTS `equipmentinfo`;
CREATE TABLE `equipmentinfo` (
  `eid` int(11) NOT NULL,
  `ename` varchar(255) DEFAULT NULL,
  `buydate` date DEFAULT NULL,
  `site` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `aid` int(11) DEFAULT NULL,
  PRIMARY KEY (`eid`),
  KEY `FKfm4lplaaygmjx58elbjbu1wgh` (`aid`),
  CONSTRAINT `FKfm4lplaaygmjx58elbjbu1wgh` FOREIGN KEY (`aid`) REFERENCES `academy` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipmentinfo
-- ----------------------------
INSERT INTO `equipmentinfo` VALUES ('1', '单片机', '2017-04-26', '机电楼c228', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('10501', '单片机开发板', '2017-06-06', '机电楼c座105', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('10502', '单片机开发板', '2017-06-06', '机电楼c座105', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('10601', 'EDA开发板', '2017-06-06', '机电楼c座106', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('10602', 'EDA开发板', '2017-06-06', '机电楼c座106', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('11501', '数电实验箱', '2017-06-07', '机电楼c座115', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('11502', '数电实验箱', '2017-06-07', '机电楼c座115', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('22801', '高频实验箱', '2017-05-11', '机电楼c座228', '1', '1');
INSERT INTO `equipmentinfo` VALUES ('22802', '高频实验箱', '2017-05-11', '机电楼c座228', '1', '1');

-- ----------------------------
-- Table structure for repairrecord
-- ----------------------------
DROP TABLE IF EXISTS `repairrecord`;
CREATE TABLE `repairrecord` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) DEFAULT NULL,
  `rdate` datetime DEFAULT NULL,
  `person` varchar(255) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rid`),
  KEY `FKkegvflea7agymsqjuosq552il` (`eid`),
  CONSTRAINT `FKkegvflea7agymsqjuosq552il` FOREIGN KEY (`eid`) REFERENCES `equipmentinfo` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repairrecord
-- ----------------------------
INSERT INTO `repairrecord` VALUES ('2', '哈哈哈', '2017-05-11 23:46:59', '温晓东', '1');
INSERT INTO `repairrecord` VALUES ('3', '哈哈哈', '2017-05-11 23:49:27', '温晓东', '1');
INSERT INTO `repairrecord` VALUES ('4', '大地啊高射炮打算的', '2017-05-12 09:40:20', '温晓东', '1');
INSERT INTO `repairrecord` VALUES ('5', '1', '2017-05-13 10:12:33', '温晓东', '22801');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `sid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `FKmpfeflgexuel1e5qa5lrynsjk` (`cid`),
  CONSTRAINT `FKmpfeflgexuel1e5qa5lrynsjk` FOREIGN KEY (`cid`) REFERENCES `classinfo` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('201302031021', '王浩', '201302031021', '1');
INSERT INTO `student` VALUES ('201302031037', '张健', '201302031037', '1');
INSERT INTO `student` VALUES ('201302031038', '温晓东', 'wxd5844011', '1');

-- ----------------------------
-- Table structure for userecord
-- ----------------------------
DROP TABLE IF EXISTS `userecord`;
CREATE TABLE `userecord` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `start` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `eid` int(11) DEFAULT NULL,
  `sid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `FKdimn8tv2w3w8bt3nv2h2351tg` (`eid`),
  KEY `FK5711sq0v3w40r3q85l6r7du9q` (`sid`),
  CONSTRAINT `FK5711sq0v3w40r3q85l6r7du9q` FOREIGN KEY (`sid`) REFERENCES `student` (`sid`),
  CONSTRAINT `FKdimn8tv2w3w8bt3nv2h2351tg` FOREIGN KEY (`eid`) REFERENCES `equipmentinfo` (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userecord
-- ----------------------------
INSERT INTO `userecord` VALUES ('14', '2017-05-07 00:00:00', '2017-05-07 00:00:00', '0', '电源线接触不良', '1', '201302031038');
INSERT INTO `userecord` VALUES ('16', '2017-05-07 00:00:00', '2017-05-07 00:00:00', '0', '333', '1', '201302031038');
INSERT INTO `userecord` VALUES ('17', '2017-05-07 00:00:00', '2017-05-07 00:00:00', '0', '222', '1', '201302031038');
INSERT INTO `userecord` VALUES ('18', '2017-05-07 00:00:00', '2017-05-07 00:00:00', '1', '', '1', '201302031038');
INSERT INTO `userecord` VALUES ('19', '2017-05-02 00:00:00', '2017-05-01 00:00:00', '1', '', '1', '201302031038');
INSERT INTO `userecord` VALUES ('23', '2017-05-07 00:00:00', '2017-05-07 00:00:00', '1', '', '1', '201302031038');
INSERT INTO `userecord` VALUES ('24', '2017-05-07 04:04:05', '2017-05-07 10:10:10', '0', '999', '1', '201302031038');
INSERT INTO `userecord` VALUES ('25', '2017-05-08 00:00:00', '2017-05-08 00:00:00', '0', '11', '1', '201302031038');
INSERT INTO `userecord` VALUES ('26', '2017-05-08 09:48:39', '2017-05-08 09:48:41', '1', '', '1', '201302031038');
INSERT INTO `userecord` VALUES ('56', '2017-05-12 18:27:27', '2017-05-12 18:27:29', '0', '插上电源没反应', '22801', '201302031038');
INSERT INTO `userecord` VALUES ('57', '2017-05-12 18:40:44', '2017-05-12 18:40:45', '0', '1111111111', '22802', '201302031038');
INSERT INTO `userecord` VALUES ('62', '2017-05-15 08:41:30', '2017-05-15 08:41:31', '0', '111', '22801', '201302031038');
INSERT INTO `userecord` VALUES ('63', '2017-05-26 10:01:37', '2017-05-27 00:00:00', '0', 'xxxx', '1', '201302031038');
INSERT INTO `userecord` VALUES ('64', '2017-06-07 00:00:00', '2017-06-14 00:00:00', '0', '11111', '1', '201302031038');
INSERT INTO `userecord` VALUES ('65', '2017-06-03 15:23:00', '2017-06-03 15:23:02', '1', '', '1', '201302031038');
INSERT INTO `userecord` VALUES ('66', '2017-06-03 15:23:11', '2017-06-03 15:23:13', '0', '1111', '1', '201302031038');
INSERT INTO `userecord` VALUES ('67', '2017-06-03 15:25:24', '2017-06-03 15:25:26', '0', '5646565165165', '1', '201302031038');
INSERT INTO `userecord` VALUES ('68', '2017-06-03 16:02:42', '2017-06-03 16:02:43', '0', '111111111111', '1', '201302031038');
INSERT INTO `userecord` VALUES ('69', '2017-06-05 00:15:01', '2017-06-05 00:15:03', '0', '4565', '1', '201302031038');
