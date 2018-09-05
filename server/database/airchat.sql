/*
Navicat MySQL Data Transfer

Source Server         : localhost1
Source Server Version : 50717
Source Host           : localhost:3308
Source Database       : airchat

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-09-05 14:37:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `group_info`
-- ----------------------------
DROP TABLE IF EXISTS `group_info`;
CREATE TABLE `group_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '群id',
  `group_id` char(100) NOT NULL,
  `group_name` varchar(20) NOT NULL DEFAULT '交流群' COMMENT '群名称',
  `group_notice` varchar(100) NOT NULL DEFAULT '欢迎大家入群交流~' COMMENT '群公告',
  `group_avator` varchar(50) NOT NULL DEFAULT 'http://ooytyiziz.bkt.clouddn.com/peoples1.jpg' COMMENT '群头像',
  `group_creater` varchar(10) NOT NULL DEFAULT '' COMMENT '群创建人',
  `creater_time` int(11) NOT NULL COMMENT '群创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_info
-- ----------------------------
INSERT INTO `group_info` VALUES ('1', '8eeccfc0-0f1e-11e8-892e-5ba8fc68dc36', '交流群', '交流群', 'http://ooytyiziz.bkt.clouddn.com/peoples1.jpg', '罗宾', '1518348455');
INSERT INTO `group_info` VALUES ('2', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'test群', 'chanjoey群123456', 'http://ooytyiziz.bkt.clouddn.com/peoples1.jpg', 'chanjoey', '1534316067');
INSERT INTO `group_info` VALUES ('7', 'f3226a70-aa98-11e8-aaa0-47896a55ff8f', 'chanjoey的群', '123456', 'http://ooytyiziz.bkt.clouddn.com/peoples1.jpg', 'chanjoey', '1535443452');

-- ----------------------------
-- Table structure for `group_msg`
-- ----------------------------
DROP TABLE IF EXISTS `group_msg`;
CREATE TABLE `group_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL COMMENT '谁发的',
  `to_group` char(100) NOT NULL DEFAULT '' COMMENT '群id',
  `message` text NOT NULL COMMENT '聊天信息',
  `time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `to_group` (`to_group`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_msg
-- ----------------------------
INSERT INTO `group_msg` VALUES ('1', '1', '8eeccfc0-0f1e-11e8-892e-5ba8fc68dc36', '路飞 : 有人不？', '1518348482');
INSERT INTO `group_msg` VALUES ('2', '14', '8eeccfc0-0f1e-11e8-892e-5ba8fc68dc36', '罗宾 : 有呀  我呀', '1518348493');
INSERT INTO `group_msg` VALUES ('3', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是群主', '1534316082');
INSERT INTO `group_msg` VALUES ('4', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 群主你好,我是chen123', '1534316223');
INSERT INTO `group_msg` VALUES ('5', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : chen123你好', '1534316236');
INSERT INTO `group_msg` VALUES ('6', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : chanjoey', '1534320845');
INSERT INTO `group_msg` VALUES ('7', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : chen123', '1534320850');
INSERT INTO `group_msg` VALUES ('8', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是:chanjoey', '1534320962');
INSERT INTO `group_msg` VALUES ('9', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是:chen123', '1534320964');
INSERT INTO `group_msg` VALUES ('10', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534321569');
INSERT INTO `group_msg` VALUES ('11', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534321570');
INSERT INTO `group_msg` VALUES ('12', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534321623');
INSERT INTO `group_msg` VALUES ('13', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534321683');
INSERT INTO `group_msg` VALUES ('14', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534321923');
INSERT INTO `group_msg` VALUES ('15', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534321934');
INSERT INTO `group_msg` VALUES ('16', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534321996');
INSERT INTO `group_msg` VALUES ('17', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534322006');
INSERT INTO `group_msg` VALUES ('18', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534322249');
INSERT INTO `group_msg` VALUES ('19', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534324496');
INSERT INTO `group_msg` VALUES ('20', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534324498');
INSERT INTO `group_msg` VALUES ('21', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534324572');
INSERT INTO `group_msg` VALUES ('22', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534324575');
INSERT INTO `group_msg` VALUES ('23', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534324608');
INSERT INTO `group_msg` VALUES ('24', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534324611');
INSERT INTO `group_msg` VALUES ('25', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534324613');
INSERT INTO `group_msg` VALUES ('26', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534325108');
INSERT INTO `group_msg` VALUES ('27', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534325112');
INSERT INTO `group_msg` VALUES ('28', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534325119');
INSERT INTO `group_msg` VALUES ('29', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534325556');
INSERT INTO `group_msg` VALUES ('30', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534325593');
INSERT INTO `group_msg` VALUES ('31', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534325594');
INSERT INTO `group_msg` VALUES ('32', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534325672');
INSERT INTO `group_msg` VALUES ('33', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534325673');
INSERT INTO `group_msg` VALUES ('34', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534326549');
INSERT INTO `group_msg` VALUES ('35', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534326552');
INSERT INTO `group_msg` VALUES ('36', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534326810');
INSERT INTO `group_msg` VALUES ('37', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534326841');
INSERT INTO `group_msg` VALUES ('38', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534389334');
INSERT INTO `group_msg` VALUES ('39', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534389340');
INSERT INTO `group_msg` VALUES ('40', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1534389952');
INSERT INTO `group_msg` VALUES ('41', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534918383');
INSERT INTO `group_msg` VALUES ('42', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534918384');
INSERT INTO `group_msg` VALUES ('43', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534918384');
INSERT INTO `group_msg` VALUES ('44', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534921467');
INSERT INTO `group_msg` VALUES ('45', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534921470');
INSERT INTO `group_msg` VALUES ('46', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好', '1534921470');
INSERT INTO `group_msg` VALUES ('47', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535510020');
INSERT INTO `group_msg` VALUES ('48', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535510023');
INSERT INTO `group_msg` VALUES ('49', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好1111111111111', '1535510059');
INSERT INTO `group_msg` VALUES ('50', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好22222', '1535510096');
INSERT INTO `group_msg` VALUES ('51', '15', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chanjoey : 我是chanjoey,大家好11111', '1535510128');
INSERT INTO `group_msg` VALUES ('52', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好22222', '1535510130');
INSERT INTO `group_msg` VALUES ('53', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535512388');
INSERT INTO `group_msg` VALUES ('54', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535512391');
INSERT INTO `group_msg` VALUES ('55', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535512391');
INSERT INTO `group_msg` VALUES ('56', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535512391');
INSERT INTO `group_msg` VALUES ('57', '16', '0d5e9a30-a058-11e8-84c1-4d8cded92688', 'chen123 : 我是chen123,大家好', '1535512859');

-- ----------------------------
-- Table structure for `group_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `group_user_relation`;
CREATE TABLE `group_user_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` char(100) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_user_relation
-- ----------------------------
INSERT INTO `group_user_relation` VALUES ('2', '8eeccfc0-0f1e-11e8-892e-5ba8fc68dc36', '1');
INSERT INTO `group_user_relation` VALUES ('3', '8eeccfc0-0f1e-11e8-892e-5ba8fc68dc36', '14');
INSERT INTO `group_user_relation` VALUES ('4', '0d5e9a30-a058-11e8-84c1-4d8cded92688', '17');
INSERT INTO `group_user_relation` VALUES ('5', '0d5e9a30-a058-11e8-84c1-4d8cded92688', '18');
INSERT INTO `group_user_relation` VALUES ('6', '015f4860-aa99-11e8-8a17-555a35734d26', '15');
INSERT INTO `group_user_relation` VALUES ('8', '0d5e9a30-a058-11e8-84c1-4d8cded92688', '15');
INSERT INTO `group_user_relation` VALUES ('9', '0d5e9a30-a058-11e8-84c1-4d8cded92688', '16');

-- ----------------------------
-- Table structure for `new_friends`
-- ----------------------------
DROP TABLE IF EXISTS `new_friends`;
CREATE TABLE `new_friends` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL COMMENT '主动加方',
  `to_user` int(11) NOT NULL COMMENT '被加方',
  `content` varchar(50) NOT NULL DEFAULT '' COMMENT '加好友验证内容',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1同意，0未同意',
  `time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of new_friends
-- ----------------------------
INSERT INTO `new_friends` VALUES ('1', '14', '1', '您好，我想加您为好友', '1', '1518348301');
INSERT INTO `new_friends` VALUES ('2', '1', '14', '咋把我删了呢', '1', '1518349582');
INSERT INTO `new_friends` VALUES ('3', '1', '14', '您好，我想加您为好友', '1', '1518350494');
INSERT INTO `new_friends` VALUES ('4', '1', '14', '您好，我想加您为好友', '1', '1518350921');
INSERT INTO `new_friends` VALUES ('5', '1', '14', '咋把我删了呢，重新加一下', '1', '1518351200');
INSERT INTO `new_friends` VALUES ('6', '14', '1', '您好，我想加您为好友', '1', '1518485362');
INSERT INTO `new_friends` VALUES ('11', '16', '15', '您好我是chen123，我想加您为好友', '1', '1534326975');
INSERT INTO `new_friends` VALUES ('14', '15', '16', '您好，我想加您为好友', '1', '1535097668');
INSERT INTO `new_friends` VALUES ('15', '15', '16', '您好，我想加您为好友', '1', '1535098830');
INSERT INTO `new_friends` VALUES ('16', '15', '16', '您好，我想加您为好友', '1', '1535098879');
INSERT INTO `new_friends` VALUES ('20', '18', '15', '您好，我是chen456,我想加您为好友', '1', '1535353931');

-- ----------------------------
-- Table structure for `private__msg`
-- ----------------------------
DROP TABLE IF EXISTS `private__msg`;
CREATE TABLE `private__msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `from_user` int(11) NOT NULL COMMENT '谁发的',
  `to_user` int(11) NOT NULL COMMENT '发给谁',
  `message` text NOT NULL COMMENT '聊天信息',
  `time` int(11) NOT NULL COMMENT '发送时间',
  PRIMARY KEY (`id`),
  KEY `from_user` (`from_user`),
  KEY `to_user` (`to_user`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of private__msg
-- ----------------------------
INSERT INTO `private__msg` VALUES ('1', '1', '14', '路飞 : 你好罗宾', '1518348322');
INSERT INTO `private__msg` VALUES ('2', '14', '1', '罗宾 : 你好呀路飞', '1518348331');
INSERT INTO `private__msg` VALUES ('3', '14', '1', '罗宾 : 我建个群去 ，你待会加哈    叫 交流群', '1518348364');
INSERT INTO `private__msg` VALUES ('6', '1', '14', '路飞 : 咋把我删了呢，重新加一下', '1518351218');
INSERT INTO `private__msg` VALUES ('7', '14', '1', '罗宾 : 额 误删.', '1518351226');
INSERT INTO `private__msg` VALUES ('8', '14', '1', '罗宾 : 在么', '1519377863');
INSERT INTO `private__msg` VALUES ('9', '15', '16', 'chanjoey : 你好', '1534326915');
INSERT INTO `private__msg` VALUES ('10', '16', '15', 'chen123:hello', '1514444444');
INSERT INTO `private__msg` VALUES ('11', '15', '16', 'chanjoey :hello123', '1535010342');
INSERT INTO `private__msg` VALUES ('12', '15', '16', 'chanjoey : hello5555', '1535010515');
INSERT INTO `private__msg` VALUES ('13', '15', '16', 'chanjoey : hello6666', '1535010566');
INSERT INTO `private__msg` VALUES ('14', '16', '15', 'chen123 : hello599999', '1535010581');
INSERT INTO `private__msg` VALUES ('15', '15', '16', 'chanjoey : hello55555', '1535014970');
INSERT INTO `private__msg` VALUES ('16', '15', '16', 'chanjoey : hello', '1535099957');
INSERT INTO `private__msg` VALUES ('17', '16', '15', 'chen123 : 我是chen123', '1535099965');
INSERT INTO `private__msg` VALUES ('18', '18', '15', 'chen456 : 我是chen456,你好', '1535354183');
INSERT INTO `private__msg` VALUES ('19', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535354189');
INSERT INTO `private__msg` VALUES ('20', '18', '15', 'chen456 : 我是chen456,你好', '1535355128');
INSERT INTO `private__msg` VALUES ('21', '18', '15', 'chen456 : 我是chen456,你好', '1535355232');
INSERT INTO `private__msg` VALUES ('22', '18', '15', 'chen456 : 我是chen456,你好', '1535355240');
INSERT INTO `private__msg` VALUES ('23', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535355297');
INSERT INTO `private__msg` VALUES ('24', '18', '15', 'chen456 : 我是chen456,你好', '1535355325');
INSERT INTO `private__msg` VALUES ('25', '18', '15', 'chen456 : 我是chen456,你好', '1535355363');
INSERT INTO `private__msg` VALUES ('26', '18', '15', 'chen456 : 我是chen456,你好', '1535355611');
INSERT INTO `private__msg` VALUES ('27', '18', '15', 'chen456 : 我是chen456,你好', '1535357110');
INSERT INTO `private__msg` VALUES ('28', '18', '15', 'chen456 : 我是chen456,你好', '1535357382');
INSERT INTO `private__msg` VALUES ('29', '18', '15', 'chen456 : 我是chen456,你好', '1535357475');
INSERT INTO `private__msg` VALUES ('30', '18', '15', 'chen456 : 我是chen456,你好', '1535357581');
INSERT INTO `private__msg` VALUES ('31', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535357683');
INSERT INTO `private__msg` VALUES ('32', '18', '15', 'chen456 : 我是chen456,你好', '1535357686');
INSERT INTO `private__msg` VALUES ('33', '18', '15', 'chen456 : 我是chen456,你好', '1535357738');
INSERT INTO `private__msg` VALUES ('34', '18', '15', 'chen456 : 我是chen456,你好', '1535357767');
INSERT INTO `private__msg` VALUES ('35', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535357785');
INSERT INTO `private__msg` VALUES ('36', '18', '15', 'chen456 : 我是chen456,你好', '1535357937');
INSERT INTO `private__msg` VALUES ('37', '18', '15', 'chen456 : 我是chen456,你好', '1535357953');
INSERT INTO `private__msg` VALUES ('38', '18', '15', 'chen456 : 我是chen456,你好11111111', '1535357983');
INSERT INTO `private__msg` VALUES ('39', '18', '15', 'chen456 : 我是chen456,你好', '1535358100');
INSERT INTO `private__msg` VALUES ('40', '16', '15', 'chen123 : 我是chen123,你好', '1535358175');
INSERT INTO `private__msg` VALUES ('41', '16', '15', 'chen123 : 我是chen123,你好', '1535359400');
INSERT INTO `private__msg` VALUES ('42', '16', '15', 'chen123 : 你好', '1535359411');
INSERT INTO `private__msg` VALUES ('43', '16', '15', 'chen123 : 我是chen123,你好', '1535359466');
INSERT INTO `private__msg` VALUES ('44', '16', '15', 'chen123 : 我是chen123,你好11111', '1535359471');
INSERT INTO `private__msg` VALUES ('45', '16', '15', 'chen123 : 我是chen123,你好', '1535359476');
INSERT INTO `private__msg` VALUES ('46', '16', '15', 'chen123 : 我是chen123,你好', '1535359517');
INSERT INTO `private__msg` VALUES ('47', '16', '15', 'chen123 : 我是chen123,你好', '1535360407');
INSERT INTO `private__msg` VALUES ('48', '16', '15', 'chen123 : 我是chen123,你好111111111111', '1535360509');
INSERT INTO `private__msg` VALUES ('49', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360516');
INSERT INTO `private__msg` VALUES ('50', '16', '15', 'chen123 : 我是chen123,你好2222222', '1535360523');
INSERT INTO `private__msg` VALUES ('51', '18', '15', 'chen456 : 我是chen456,你好', '1535360617');
INSERT INTO `private__msg` VALUES ('52', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360619');
INSERT INTO `private__msg` VALUES ('53', '18', '15', 'chen456 : 我是chen456,你好', '1535360669');
INSERT INTO `private__msg` VALUES ('54', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360671');
INSERT INTO `private__msg` VALUES ('55', '18', '15', 'chen456 : 我是chen456,你好', '1535360672');
INSERT INTO `private__msg` VALUES ('56', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360673');
INSERT INTO `private__msg` VALUES ('57', '18', '15', 'chen456 : 我是chen456,你好', '1535360821');
INSERT INTO `private__msg` VALUES ('58', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360822');
INSERT INTO `private__msg` VALUES ('59', '18', '15', 'chen456 : 我是chen456,你好', '1535360824');
INSERT INTO `private__msg` VALUES ('60', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360825');
INSERT INTO `private__msg` VALUES ('61', '18', '15', 'chen456 : 我是chen456,你好', '1535360843');
INSERT INTO `private__msg` VALUES ('62', '18', '15', 'chen456 : 我是chen456,你好', '1535360865');
INSERT INTO `private__msg` VALUES ('63', '18', '15', 'chen456 : 我是chen456,你好', '1535360867');
INSERT INTO `private__msg` VALUES ('64', '18', '15', 'chen456 : 我是chen456,你好', '1535360867');
INSERT INTO `private__msg` VALUES ('65', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360898');
INSERT INTO `private__msg` VALUES ('66', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360898');
INSERT INTO `private__msg` VALUES ('67', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360901');
INSERT INTO `private__msg` VALUES ('68', '15', '18', 'chanjoey : 我是chanjoey,你好123', '1535360909');
INSERT INTO `private__msg` VALUES ('69', '18', '15', 'chen456 : 我是chen456,你好', '1535360927');
INSERT INTO `private__msg` VALUES ('70', '18', '15', 'chen456 : 我是chen456,你好', '1535360929');
INSERT INTO `private__msg` VALUES ('71', '18', '15', 'chen456 : 我是chen456,你好', '1535360929');
INSERT INTO `private__msg` VALUES ('72', '18', '15', 'chen456 : 我是chen456,你好', '1535360929');
INSERT INTO `private__msg` VALUES ('73', '18', '15', 'chen456 : 我是chen456,你好1111', '1535360933');
INSERT INTO `private__msg` VALUES ('74', '18', '15', 'chen456 : 我是chen456,你好111145', '1535360938');
INSERT INTO `private__msg` VALUES ('75', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360956');
INSERT INTO `private__msg` VALUES ('76', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535360957');
INSERT INTO `private__msg` VALUES ('77', '15', '18', 'chanjoey : 我是chanjoey,你好123', '1535360958');
INSERT INTO `private__msg` VALUES ('78', '18', '15', 'chen456 : 我是chen456,你好', '1535361090');
INSERT INTO `private__msg` VALUES ('79', '18', '15', 'chen456 : 我是chen456,你好', '1535361090');
INSERT INTO `private__msg` VALUES ('80', '18', '15', 'chen456 : 我是chen456,你好', '1535361090');
INSERT INTO `private__msg` VALUES ('81', '18', '15', 'chen456 : 我是chen456,你好', '1535361094');
INSERT INTO `private__msg` VALUES ('82', '18', '15', 'chen456 : 我是chen456,你好', '1535361094');
INSERT INTO `private__msg` VALUES ('83', '18', '15', 'chen456 : 我是chen456,你好11111', '1535361100');
INSERT INTO `private__msg` VALUES ('84', '18', '15', 'chen456 : 我是chen456,你好1111122', '1535361105');
INSERT INTO `private__msg` VALUES ('85', '18', '15', 'chen456 : 我是chen456,你好1', '1535361138');
INSERT INTO `private__msg` VALUES ('86', '18', '15', 'chen456 : 我是chen456,你好12', '1535361139');
INSERT INTO `private__msg` VALUES ('87', '18', '15', 'chen456 : 我是chen456,你好123', '1535361140');
INSERT INTO `private__msg` VALUES ('88', '18', '15', 'chen456 : 我是chen456,你好1234', '1535361141');
INSERT INTO `private__msg` VALUES ('89', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535424688');
INSERT INTO `private__msg` VALUES ('90', '16', '15', 'chen123 : 我是chen123,你好', '1535424690');
INSERT INTO `private__msg` VALUES ('91', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535425210');
INSERT INTO `private__msg` VALUES ('92', '16', '15', 'chen123 : 我是chen123,你好', '1535425216');
INSERT INTO `private__msg` VALUES ('93', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535425224');
INSERT INTO `private__msg` VALUES ('94', '16', '15', 'chen123 : 我是chen123,你好', '1535425226');
INSERT INTO `private__msg` VALUES ('95', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535435285');
INSERT INTO `private__msg` VALUES ('96', '16', '15', 'chen123 : 我是chen123,你好', '1535435286');
INSERT INTO `private__msg` VALUES ('97', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535438093');
INSERT INTO `private__msg` VALUES ('98', '16', '15', 'chen123 : 我是chen123,你好', '1535438095');
INSERT INTO `private__msg` VALUES ('99', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535438100');
INSERT INTO `private__msg` VALUES ('100', '16', '15', 'chen123 : 我是chen123,你好', '1535438102');
INSERT INTO `private__msg` VALUES ('101', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535442229');
INSERT INTO `private__msg` VALUES ('102', '16', '15', 'chen123 : 我是chen123,你好', '1535442230');
INSERT INTO `private__msg` VALUES ('103', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535506078');
INSERT INTO `private__msg` VALUES ('104', '16', '15', 'chen123 : 我是chen123,你好', '1535506079');
INSERT INTO `private__msg` VALUES ('105', '15', '18', 'chanjoey : 我是chanjoey,你好', '1535957132');
INSERT INTO `private__msg` VALUES ('106', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535968739');
INSERT INTO `private__msg` VALUES ('107', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535968740');
INSERT INTO `private__msg` VALUES ('108', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535968740');
INSERT INTO `private__msg` VALUES ('109', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535968741');
INSERT INTO `private__msg` VALUES ('110', '15', '16', 'chanjoey : 我是chanjoey,你好', '1535968741');
INSERT INTO `private__msg` VALUES ('111', '15', '18', 'chanjoey : 我是chanjoey,你好', '1536026983');
INSERT INTO `private__msg` VALUES ('112', '15', '18', 'chanjoey : 我是chanjoey,你好', '1536129351');
INSERT INTO `private__msg` VALUES ('113', '15', '18', 'chanjoey : 我是chanjoey,你好', '1536129351');

-- ----------------------------
-- Table structure for `user_info`
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT 'NOT NULL' COMMENT '用户名',
  `password` varchar(40) NOT NULL DEFAULT 'NOT NULL' COMMENT '密码',
  `sex` varchar(2) NOT NULL DEFAULT '0' COMMENT '性别',
  `avator` varchar(100) NOT NULL DEFAULT 'http://ooytyiziz.bkt.clouddn.com/people5.jpg' COMMENT '头像',
  `place` varchar(50) DEFAULT NULL COMMENT '来自哪里',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '在线状态,0离线,1在线',
  `socketid` varchar(20) NOT NULL DEFAULT '' COMMENT '登陆时的socketid',
  `website` varchar(50) DEFAULT NULL COMMENT '个人网站',
  `github` varchar(50) DEFAULT NULL,
  `intro` varchar(20) DEFAULT NULL,
  `createdAt` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', '路飞', '6512bd43d9caa6e02c990b0a82652dca', '0', 'http://ooytyiziz.bkt.clouddn.com/people1.jpg', '厦门', '0', 'tIckUQsrpFm_Wki0AAAF', '', 'https://github.com/Hxvin', null, null);
INSERT INTO `user_info` VALUES ('2', '索隆', 'b6d767d2f8ed5d21a44b0e5886680cb9', '1', 'http://ooytyiziz.bkt.clouddn.com/people2.jpg', '深圳', '0', 'l12EoQ8PbnmvupNQAAAP', null, '', null, null);
INSERT INTO `user_info` VALUES ('3', '乔治', '182be0c5cdcd5072bb1864cdee4d3d6e', '1', 'http://ooytyiziz.bkt.clouddn.com/people3.jpg', '杭州', '0', 'ue0dCyN0zAyJurW-AABQ', null, null, null, null);
INSERT INTO `user_info` VALUES ('4', 'chen1', 'f7177163c833dff4b38fc8d2872f1ec6', '1', 'http://ooytyiziz.bkt.clouddn.com/people4.jpg', '', '0', '67kamGg8ibMLEjpZAAAD', null, null, null, null);
INSERT INTO `user_info` VALUES ('14', '罗宾', 'e10adc3949ba59abbe56e057f20f883e', '1', 'http://ooytyiziz.bkt.clouddn.com/people6.jpg', null, '0', '9sictmm25dBk8tj2AAAC', null, null, null, null);
INSERT INTO `user_info` VALUES ('15', 'chanjoey', 'e10adc3949ba59abbe56e057f20f883e', '1', 'http://ooytyiziz.bkt.clouddn.com/people5.jpg', '123456', '0', '2HyhsADJ7M6ddFz6AAAA', 'http://www.baidulcom', 'http://www.baicu.dom', null, null);
INSERT INTO `user_info` VALUES ('16', 'chen123', 'e10adc3949ba59abbe56e057f20f883e', '0', 'https://www.baidu.com/img/bd_logo1.png?where=super', null, '0', 'hkdhWY5stKwEjtczAAAC', null, null, null, null);
INSERT INTO `user_info` VALUES ('18', 'chen456', 'e10adc3949ba59abbe56e057f20f883e', '0', 'http://ooytyiziz.bkt.clouddn.com/people5.jpg', null, '0', 'bTKLnsRygAK785nzAAAB', null, null, null, null);
INSERT INTO `user_info` VALUES ('19', 'chanjoey76762412', 'e10adc3949ba59abbe56e057f20f883e', '0', 'http://ooytyiziz.bkt.clouddn.com/people5.jpg', null, '0', '', null, null, null, '2018-08-30');
INSERT INTO `user_info` VALUES ('20', 'chanjoey54454', 'e10adc3949ba59abbe56e057f20f883e', '0', 'http://ooytyiziz.bkt.clouddn.com/people5.jpg', null, '0', '', null, null, null, '2018-08-30');

-- ----------------------------
-- Table structure for `user_user_relation`
-- ----------------------------
DROP TABLE IF EXISTS `user_user_relation`;
CREATE TABLE `user_user_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户',
  `other_user_id` int(11) NOT NULL COMMENT '用户的朋友',
  `remark` varchar(10) DEFAULT '' COMMENT '备注',
  `shield` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0不屏蔽 1屏蔽',
  `time` int(11) NOT NULL,
  `relationId` tinyint(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_user_relation
-- ----------------------------
INSERT INTO `user_user_relation` VALUES ('1', '1', '14', '网友', '0', '1518348308', '0');
INSERT INTO `user_user_relation` VALUES ('2', '14', '1', '23333', '0', '1518745801', '0');
INSERT INTO `user_user_relation` VALUES ('8', '16', '15', '', '0', '1535098965', '0');
INSERT INTO `user_user_relation` VALUES ('9', '15', '16', '陈123', '0', '1535098965', '16');
INSERT INTO `user_user_relation` VALUES ('10', '15', '18', '陈456', '0', '1535353974', '0');
INSERT INTO `user_user_relation` VALUES ('11', '18', '15', '备注chen456', '0', '1535353974', '0');
