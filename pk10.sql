/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : pk10

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-04-14 20:14:47
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for think_admin
-- ----------------------------
DROP TABLE IF EXISTS `think_admin`;
CREATE TABLE `think_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `is_login` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_admin
-- ----------------------------
INSERT INTO `think_admin` VALUES ('1', 'admin', '7fef6171469e80d32c0559f88b377245', '127.0.0.1', '1523722170', '', '1', '1');

-- ----------------------------
-- Table structure for think_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `think_admin_log`;
CREATE TABLE `think_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `content` varchar(200) NOT NULL DEFAULT '' COMMENT '操作内容',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作类型 1=上分 2=下分  3=修改上线  4=修改倍率  5=修改微信收款二维码 6=修改支付宝二维码  7修改客服二维码  ',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员日志表';

-- ----------------------------
-- Records of think_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for think_caiji
-- ----------------------------
DROP TABLE IF EXISTS `think_caiji`;
CREATE TABLE `think_caiji` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `game` varchar(40) NOT NULL DEFAULT '' COMMENT '类型',
  `periodnumber` varchar(50) NOT NULL DEFAULT '0' COMMENT '期号',
  `awardnumbers` varchar(200) NOT NULL DEFAULT '' COMMENT '开奖号码',
  `awardtime` varchar(50) NOT NULL DEFAULT '' COMMENT '开奖时间',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `next_term` varchar(50) NOT NULL COMMENT '下一期',
  `next_time` varchar(200) NOT NULL COMMENT '下一期开奖时间',
  PRIMARY KEY (`id`),
  KEY `game` (`game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据采集';

-- ----------------------------
-- Records of think_caiji
-- ----------------------------

-- ----------------------------
-- Table structure for think_caiji2
-- ----------------------------
DROP TABLE IF EXISTS `think_caiji2`;
CREATE TABLE `think_caiji2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `game` varchar(255) DEFAULT NULL,
  `periodnumber` varchar(255) DEFAULT NULL,
  `awardnumbers` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of think_caiji2
-- ----------------------------

-- ----------------------------
-- Table structure for think_config
-- ----------------------------
DROP TABLE IF EXISTS `think_config`;
CREATE TABLE `think_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `kefu` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_config
-- ----------------------------
INSERT INTO `think_config` VALUES ('1', '/carousel/kefu/2017-03-19/58ce3d5f18508.jpg');
INSERT INTO `think_config` VALUES ('2', '/carousel/kefu/2017-03-19/58ce3d5f18508.jpg');
INSERT INTO `think_config` VALUES ('3', '/carousel/kefu/2017-03-19/58ce3d5f18508.jpg');

-- ----------------------------
-- Table structure for think_config_one
-- ----------------------------
DROP TABLE IF EXISTS `think_config_one`;
CREATE TABLE `think_config_one` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(70) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=217 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_config_one
-- ----------------------------
INSERT INTO `think_config_one` VALUES ('11', 'CAIJI_KEY', '1', '采集接口密钥', '1507538863', '1', 'tb86f8b1f34b151efk', '3');
INSERT INTO `think_config_one` VALUES ('20', 'WEIXIN_APPID', '1', 'WEIXIN_APPID', '1384418383', '1', 'wx5e1d4135a1ba5064', '4');
INSERT INTO `think_config_one` VALUES ('21', 'WEIXIN_APPSECRET', '1', 'WEIXIN_APPSECRET', '1379313407', '1', '0d944a76448c198988970371553f726c', '6');
INSERT INTO `think_config_one` VALUES ('35', 'SERVER_IP', '1', 'SERVER_IP', '1507535879', '1', '122.114.211.37', '0');
INSERT INTO `think_config_one` VALUES ('36', 'is_ctrl_xjp28', '0', '是否控制新加坡28输赢', '1507535879', '1', '0', '0');

-- ----------------------------
-- Table structure for think_fenadd
-- ----------------------------
DROP TABLE IF EXISTS `think_fenadd`;
CREATE TABLE `think_fenadd` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `t_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(255) NOT NULL,
  `headimgurl` varchar(255) NOT NULL,
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `check` tinyint(1) NOT NULL DEFAULT '0' COMMENT '审核',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已充值',
  `addtime` int(10) NOT NULL DEFAULT '0' COMMENT '申请时间',
  `sftime` int(10) NOT NULL DEFAULT '0' COMMENT '上分时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上下分';

-- ----------------------------
-- Records of think_fenadd
-- ----------------------------

-- ----------------------------
-- Table structure for think_fenxia
-- ----------------------------
DROP TABLE IF EXISTS `think_fenxia`;
CREATE TABLE `think_fenxia` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `t_id` int(10) unsigned NOT NULL DEFAULT '0',
  `nickname` varchar(255) NOT NULL DEFAULT '',
  `headimgurl` varchar(255) NOT NULL DEFAULT '',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '充值金额',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已下分',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2 支付宝 1微信 3银行卡',
  `alipay_account` varchar(50) NOT NULL DEFAULT '' COMMENT '支付宝帐号',
  `wx_account` varchar(50) NOT NULL DEFAULT '' COMMENT '微信帐号',
  `bank_account` varchar(50) NOT NULL DEFAULT '',
  `back_address` varchar(50) NOT NULL DEFAULT '',
  `back_name` varchar(50) NOT NULL DEFAULT '',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `xftime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='上下分';

-- ----------------------------
-- Records of think_fenxia
-- ----------------------------

-- ----------------------------
-- Table structure for think_fh
-- ----------------------------
DROP TABLE IF EXISTS `think_fh`;
CREATE TABLE `think_fh` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '代理id',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '代理昵称',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '代理用户号',
  `starttime` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `endtime` int(10) NOT NULL DEFAULT '0' COMMENT '结束时间',
  `water` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总流水',
  `fh_rate` int(10) NOT NULL DEFAULT '0' COMMENT '分红比例',
  `ying` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '总输赢',
  `fh_money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '应发分红',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='代理分红记录';

-- ----------------------------
-- Records of think_fh
-- ----------------------------

-- ----------------------------
-- Table structure for think_fs_date
-- ----------------------------
DROP TABLE IF EXISTS `think_fs_date`;
CREATE TABLE `think_fs_date` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `fs_date` varchar(20) NOT NULL DEFAULT '' COMMENT '返水日期',
  `water` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '返水当天流水',
  `fs_money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '当天返水金额',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`),
  KEY `fs_date` (`fs_date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='返水记录表';

-- ----------------------------
-- Records of think_fs_date
-- ----------------------------
INSERT INTO `think_fs_date` VALUES ('1', '2018-04-12', '300.00', '4.50', '1523533984');

-- ----------------------------
-- Table structure for think_fs_details
-- ----------------------------
DROP TABLE IF EXISTS `think_fs_details`;
CREATE TABLE `think_fs_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fs_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '返水日期id',
  `date` varchar(20) NOT NULL DEFAULT '',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nickname` varchar(30) NOT NULL DEFAULT '',
  `headimgurl` varchar(200) NOT NULL DEFAULT '' COMMENT '头像',
  `money` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '返水金额',
  `water` double(10,2) NOT NULL DEFAULT '0.00' COMMENT '流水金额',
  PRIMARY KEY (`id`),
  KEY `fs_id` (`fs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='返水明细';

-- ----------------------------
-- Records of think_fs_details
-- ----------------------------
INSERT INTO `think_fs_details` VALUES ('1', '1', '2018-04-12', '1', 'bo0123', '', '3.00', '200.00');
INSERT INTO `think_fs_details` VALUES ('2', '1', '2018-04-12', '2', 'test1', '', '1.50', '100.00');

-- ----------------------------
-- Table structure for think_integral
-- ----------------------------
DROP TABLE IF EXISTS `think_integral`;
CREATE TABLE `think_integral` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `t_id` int(10) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL,
  `points` int(10) unsigned NOT NULL,
  `type` int(1) unsigned NOT NULL,
  `ip` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_integral
-- ----------------------------
INSERT INTO `think_integral` VALUES ('1', '1', '0', '1522727736', '444444', '1', '127.0.0.1', 'bo0123', 'bo0123', '444444.00');
INSERT INTO `think_integral` VALUES ('2', '2', '1', '1523533586', '5000', '1', '127.0.0.1', 'test1', 'test1', '5000.00');

-- ----------------------------
-- Table structure for think_message
-- ----------------------------
DROP TABLE IF EXISTS `think_message`;
CREATE TABLE `think_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `head_img_url` varchar(255) DEFAULT NULL,
  `from_client_name` varchar(255) DEFAULT NULL,
  `content` text,
  `time` varchar(255) DEFAULT NULL,
  `game` varchar(20) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_message
-- ----------------------------

-- ----------------------------
-- Table structure for think_number
-- ----------------------------
DROP TABLE IF EXISTS `think_number`;
CREATE TABLE `think_number` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `periodnumber` varchar(50) NOT NULL,
  `awardtime` varchar(255) NOT NULL,
  `awardnumbers` varchar(255) NOT NULL,
  `lh` varchar(255) NOT NULL COMMENT '龙虎',
  `tema` int(10) unsigned NOT NULL COMMENT '特码',
  `tema_dx` varchar(255) NOT NULL COMMENT '特码大小',
  `tema_ds` varchar(255) NOT NULL COMMENT '特码单双',
  `zx` varchar(255) NOT NULL COMMENT '庄闲',
  `q3` varchar(255) NOT NULL,
  `z3` varchar(255) NOT NULL,
  `h3` varchar(255) NOT NULL,
  `tema_dw` varchar(255) NOT NULL COMMENT '特码段位',
  `number` varchar(255) NOT NULL COMMENT '号码',
  `time` int(10) unsigned NOT NULL,
  `game` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_number
-- ----------------------------

-- ----------------------------
-- Table structure for think_order
-- ----------------------------
DROP TABLE IF EXISTS `think_order`;
CREATE TABLE `think_order` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `t_id` int(10) unsigned NOT NULL,
  `number` varchar(255) NOT NULL,
  `type` int(10) unsigned NOT NULL,
  `state` int(1) unsigned NOT NULL DEFAULT '1',
  `time` int(10) unsigned NOT NULL,
  `jincai` varchar(255) NOT NULL,
  `is_add` int(1) unsigned NOT NULL DEFAULT '0',
  `is_under` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `add_points` decimal(10,2) NOT NULL DEFAULT '0.00',
  `del_points` int(10) NOT NULL DEFAULT '0',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  `nickname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `game` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_order
-- ----------------------------

-- ----------------------------
-- Table structure for think_push_money
-- ----------------------------
DROP TABLE IF EXISTS `think_push_money`;
CREATE TABLE `think_push_money` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `orderid` int(10) NOT NULL DEFAULT '0',
  `t_uid` int(10) NOT NULL DEFAULT '0' COMMENT '代理id',
  `push_money` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rate` varchar(10) NOT NULL DEFAULT '' COMMENT '比例',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '返利',
  `time` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='返利明细';

-- ----------------------------
-- Records of think_push_money
-- ----------------------------
INSERT INTO `think_push_money` VALUES ('1', '2', '34', '1', '100.00', '0.005', '0.50', '1523533812');

-- ----------------------------
-- Table structure for think_robot
-- ----------------------------
DROP TABLE IF EXISTS `think_robot`;
CREATE TABLE `think_robot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `headimgurl` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_robot
-- ----------------------------
INSERT INTO `think_robot` VALUES ('24', '/carousel/2017-03-19/58ce04a05ca92.jpg', '坚强的一面');
INSERT INTO `think_robot` VALUES ('26', '/carousel/2017-03-19/58ce04d80a37d.jpg', '不后悔');
INSERT INTO `think_robot` VALUES ('28', '/carousel/2017-03-19/58ce0512e4405.jpg', '成功在坚持');
INSERT INTO `think_robot` VALUES ('29', '/carousel/2017-03-19/58ce052b1a45d.jpg', '人生');
INSERT INTO `think_robot` VALUES ('30', '/carousel/2017-04-01/58dfb7f642a82.jpg', '给的再多 不如懂我');
INSERT INTO `think_robot` VALUES ('31', '/carousel/2017-04-01/58dfb8048f64a.jpg', '生生生');
INSERT INTO `think_robot` VALUES ('32', '/carousel/2017-04-01/58dfb816b016d.jpg', '齐天大圣');
INSERT INTO `think_robot` VALUES ('33', '/carousel/2017-09-11/59b56b7c2ba58.JPG', '我日');
INSERT INTO `think_robot` VALUES ('34', '/carousel/2017-09-13/59b8a829bd2e2.png', '男人的味道');
INSERT INTO `think_robot` VALUES ('35', '/carousel/2017-09-13/59b8a9de22567.png', '创想');
INSERT INTO `think_robot` VALUES ('36', '/carousel/2017-09-13/59b8ab6d5dcbd.png', '狂封');
INSERT INTO `think_robot` VALUES ('37', '/carousel/2017-09-13/59b8ab9437421.png', '一个人');
INSERT INTO `think_robot` VALUES ('38', '/carousel/2017-09-13/59b8abb76a801.png', '独自偷欢');
INSERT INTO `think_robot` VALUES ('39', '/carousel/2017-09-13/59b8abf6c42ca.png', '你说我听');
INSERT INTO `think_robot` VALUES ('40', '/carousel/2017-09-13/59b8ac2dbf379.png', '不在犹豫');
INSERT INTO `think_robot` VALUES ('41', '/carousel/2017-09-13/59b8ac50758fd.png', '一生承诺');
INSERT INTO `think_robot` VALUES ('42', '/carousel/2017-09-13/59b8ac6abd64b.png', '只求一份安定');
INSERT INTO `think_robot` VALUES ('43', '/carousel/2017-09-13/59b8ac9312522.png', '无可置疑◆');
INSERT INTO `think_robot` VALUES ('44', '/carousel/2017-09-13/59b8acf8cf37a.png', '生命一旅程');
INSERT INTO `think_robot` VALUES ('45', '/carousel/2017-09-13/59b8ad167ad28.png', '志平');
INSERT INTO `think_robot` VALUES ('46', '/carousel/2017-09-13/59b8ad3b92429.png', '惊鴻【照】影');
INSERT INTO `think_robot` VALUES ('47', '/carousel/2017-09-13/59b8ad5cd9f71.png', '蛰伏');
INSERT INTO `think_robot` VALUES ('48', '/carousel/2017-09-13/59b8ad865d131.png', '超越梦想');
INSERT INTO `think_robot` VALUES ('49', '/carousel/2017-09-13/59b8adaa77f29.png', '平凡');
INSERT INTO `think_robot` VALUES ('50', '/carousel/2017-09-13/59b8ae1266924.png', '蔡仁傑');
INSERT INTO `think_robot` VALUES ('52', '/carousel/2017-09-13/59b8ae8c9a73d.png', '峰回路转');
INSERT INTO `think_robot` VALUES ('53', '/carousel/2017-09-13/59b8aece2edcb.png', '白帆');
INSERT INTO `think_robot` VALUES ('54', '/carousel/2017-09-13/59b8b161575fc.png', '6月');
INSERT INTO `think_robot` VALUES ('55', '/carousel/2017-09-13/59b8b182929b8.png', '落叶知秋');
INSERT INTO `think_robot` VALUES ('64', '/carousel/2017-09-13/59b8bee96ad81.png', 'MaRTiN');
INSERT INTO `think_robot` VALUES ('65', '/carousel/2017-09-13/59b8bf08d64b1.png', '沵算what°');
INSERT INTO `think_robot` VALUES ('66', '/carousel/2017-09-13/59b8bf27f3da7.png', 'ˋ.L.y.');
INSERT INTO `think_robot` VALUES ('67', '/carousel/2017-09-13/59b8bf413c68b.png', '稚_小_葵');
INSERT INTO `think_robot` VALUES ('69', '/carousel/2017-09-13/59b8bf9240fb4.png', '漫长の人生');
INSERT INTO `think_robot` VALUES ('70', '/carousel/2017-09-13/59b8bfb552caf.png', '不，完美。');
INSERT INTO `think_robot` VALUES ('71', '/carousel/2017-09-13/59b8bfcc8d433.png', '.....|还嬒继续|▍');
INSERT INTO `think_robot` VALUES ('72', '/carousel/2017-09-13/59b8bfe2b2b56.png', '- 物是人非。');
INSERT INTO `think_robot` VALUES ('73', '/carousel/2017-09-13/59b8bffa8a978.png', '冷了心，空了岛°');
INSERT INTO `think_robot` VALUES ('74', '/carousel/2017-09-13/59b902fbca40a.jpg', '半仙');
INSERT INTO `think_robot` VALUES ('75', '/carousel/2017-09-14/59ba3909224eb.png', '体温 ㎝ ╮');
INSERT INTO `think_robot` VALUES ('76', '/carousel/2017-09-17/59be4a274e5b1.JPG', '无所谓啦');
INSERT INTO `think_robot` VALUES ('77', '/carousel/2017-09-22/59c51645d8128.png', '感觉出了错');
INSERT INTO `think_robot` VALUES ('79', '/carousel/2017-09-22/59c516a9749be.png', 'lid');
INSERT INTO `think_robot` VALUES ('80', '/carousel/2017-09-22/59c516d8b0cf5.png', '小猪宝宝');
INSERT INTO `think_robot` VALUES ('81', '/carousel/2017-09-22/59c516fe05160.png', '别碰我');
INSERT INTO `think_robot` VALUES ('82', '/carousel/2017-09-22/59c5171c6c8fb.png', '念旧゜');
INSERT INTO `think_robot` VALUES ('83', '/carousel/2017-09-24/59c774afc0c57.png', '猴崽崽');
INSERT INTO `think_robot` VALUES ('85', '/carousel/2017-09-27/59cb9d4642d45.png', '样哇');

-- ----------------------------
-- Table structure for think_robot_message
-- ----------------------------
DROP TABLE IF EXISTS `think_robot_message`;
CREATE TABLE `think_robot_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content` varchar(255) NOT NULL,
  `type` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=134 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_robot_message
-- ----------------------------
INSERT INTO `think_robot_message` VALUES ('1', '和双200', '1');
INSERT INTO `think_robot_message` VALUES ('2', '和3511/200', '1');
INSERT INTO `think_robot_message` VALUES ('3', '和1015/100', '1');
INSERT INTO `think_robot_message` VALUES ('4', 'AC/200', '1');
INSERT INTO `think_robot_message` VALUES ('5', 'A/100', '1');
INSERT INTO `think_robot_message` VALUES ('6', 'C/300', '1');
INSERT INTO `think_robot_message` VALUES ('7', '和双200', '1');
INSERT INTO `think_robot_message` VALUES ('8', '和小1000', '1');
INSERT INTO `think_robot_message` VALUES ('9', '组/8-10/200', '1');
INSERT INTO `think_robot_message` VALUES ('11', '庄/300', '1');
INSERT INTO `think_robot_message` VALUES ('12', '庄/150', '1');
INSERT INTO `think_robot_message` VALUES ('13', '345/虎/200', '1');
INSERT INTO `think_robot_message` VALUES ('14', '245/龙/300', '1');
INSERT INTO `think_robot_message` VALUES ('15', '156/大双/200', '1');
INSERT INTO `think_robot_message` VALUES ('16', '35/小双/300', '1');
INSERT INTO `think_robot_message` VALUES ('17', '2/龙/300', '1');
INSERT INTO `think_robot_message` VALUES ('18', '569单150', '1');
INSERT INTO `think_robot_message` VALUES ('19', '567/大单/200', '1');
INSERT INTO `think_robot_message` VALUES ('20', '678单200', '1');
INSERT INTO `think_robot_message` VALUES ('21', '12345/大/200', '1');
INSERT INTO `think_robot_message` VALUES ('22', '3大300', '1');
INSERT INTO `think_robot_message` VALUES ('23', '5/大单/100', '1');
INSERT INTO `think_robot_message` VALUES ('24', '6单400', '1');
INSERT INTO `think_robot_message` VALUES ('25', '3小1000', '1');
INSERT INTO `think_robot_message` VALUES ('26', '闲/266', '1');
INSERT INTO `think_robot_message` VALUES ('27', '庄/250', '1');
INSERT INTO `think_robot_message` VALUES ('28', '和单300', '1');
INSERT INTO `think_robot_message` VALUES ('29', '庄/200', '1');
INSERT INTO `think_robot_message` VALUES ('30', 'AB/300', '1');
INSERT INTO `think_robot_message` VALUES ('31', 'B/500', '1');
INSERT INTO `think_robot_message` VALUES ('32', 'A/200', '1');
INSERT INTO `think_robot_message` VALUES ('33', '和6811/100', '1');
INSERT INTO `think_robot_message` VALUES ('35', '和单500', '1');
INSERT INTO `think_robot_message` VALUES ('36', '和11/1000', '1');
INSERT INTO `think_robot_message` VALUES ('37', '庄/1000', '1');
INSERT INTO `think_robot_message` VALUES ('38', '和单300', '1');
INSERT INTO `think_robot_message` VALUES ('39', '和小200', '1');
INSERT INTO `think_robot_message` VALUES ('40', '和17/300', '1');
INSERT INTO `think_robot_message` VALUES ('41', 'A/500', '1');
INSERT INTO `think_robot_message` VALUES ('42', '12345大200', '1');
INSERT INTO `think_robot_message` VALUES ('43', '1大1000', '1');
INSERT INTO `think_robot_message` VALUES ('44', '23456/小单/300', '1');
INSERT INTO `think_robot_message` VALUES ('45', '1/13579/200', '1');
INSERT INTO `think_robot_message` VALUES ('46', '1/13579/500', '1');
INSERT INTO `think_robot_message` VALUES ('47', '1/24680/500', '1');
INSERT INTO `think_robot_message` VALUES ('48', '1/157/500', '1');
INSERT INTO `think_robot_message` VALUES ('49', '1/479/500', '1');
INSERT INTO `think_robot_message` VALUES ('50', '特3418.19/200', '1');
INSERT INTO `think_robot_message` VALUES ('51', '特34/200', '1');
INSERT INTO `think_robot_message` VALUES ('52', '特1819/200', '1');
INSERT INTO `think_robot_message` VALUES ('53', '特319/200', '1');
INSERT INTO `think_robot_message` VALUES ('54', '特341819/50', '1');
INSERT INTO `think_robot_message` VALUES ('55', '1双1500', '1');
INSERT INTO `think_robot_message` VALUES ('56', '2双200', '1');
INSERT INTO `think_robot_message` VALUES ('57', '3双366', '1');
INSERT INTO `think_robot_message` VALUES ('58', '4双366', '1');
INSERT INTO `think_robot_message` VALUES ('59', '5双200', '1');
INSERT INTO `think_robot_message` VALUES ('60', '6双700', '1');
INSERT INTO `think_robot_message` VALUES ('61', '7双1500', '1');
INSERT INTO `think_robot_message` VALUES ('62', '8双1000', '1');
INSERT INTO `think_robot_message` VALUES ('63', '1双1000', '1');
INSERT INTO `think_robot_message` VALUES ('64', '1大1500', '1');
INSERT INTO `think_robot_message` VALUES ('65', '2大1500', '1');
INSERT INTO `think_robot_message` VALUES ('66', '3大1500', '1');
INSERT INTO `think_robot_message` VALUES ('67', '4双1500', '1');
INSERT INTO `think_robot_message` VALUES ('68', '5双1500', '1');
INSERT INTO `think_robot_message` VALUES ('69', '6双1500', '1');
INSERT INTO `think_robot_message` VALUES ('70', '7双1500', '1');
INSERT INTO `think_robot_message` VALUES ('71', '8双1500', '1');
INSERT INTO `think_robot_message` VALUES ('72', '9双1500', '1');
INSERT INTO `think_robot_message` VALUES ('73', '123/虎/400', '1');
INSERT INTO `think_robot_message` VALUES ('74', '123/龙/1500', '1');
INSERT INTO `think_robot_message` VALUES ('75', '12/龙/1500', '1');
INSERT INTO `think_robot_message` VALUES ('76', '9双1500', '1');
INSERT INTO `think_robot_message` VALUES ('77', '1大300', '2');
INSERT INTO `think_robot_message` VALUES ('78', '1/357/200', '2');
INSERT INTO `think_robot_message` VALUES ('79', '1小600', '2');
INSERT INTO `think_robot_message` VALUES ('80', '前顺子300', '2');
INSERT INTO `think_robot_message` VALUES ('81', '前豹子100', '2');
INSERT INTO `think_robot_message` VALUES ('82', '中顺子300', '2');
INSERT INTO `think_robot_message` VALUES ('83', '中对子200', '2');
INSERT INTO `think_robot_message` VALUES ('84', '大100', '2');
INSERT INTO `think_robot_message` VALUES ('85', '小300', '2');
INSERT INTO `think_robot_message` VALUES ('86', '12大500', '2');
INSERT INTO `think_robot_message` VALUES ('87', '前顺子200', '2');
INSERT INTO `think_robot_message` VALUES ('88', '前豹子200', '2');
INSERT INTO `think_robot_message` VALUES ('89', '中顺子100', '2');
INSERT INTO `think_robot_message` VALUES ('90', '中对子600', '2');
INSERT INTO `think_robot_message` VALUES ('91', '大200', '2');
INSERT INTO `think_robot_message` VALUES ('92', '小700', '2');
INSERT INTO `think_robot_message` VALUES ('93', '12大500', '2');
INSERT INTO `think_robot_message` VALUES ('94', '1大300', '2');
INSERT INTO `think_robot_message` VALUES ('95', '2/357/200', '2');
INSERT INTO `think_robot_message` VALUES ('96', '3小600', '2');
INSERT INTO `think_robot_message` VALUES ('97', '前顺子700', '2');
INSERT INTO `think_robot_message` VALUES ('98', '前豹子300', '2');
INSERT INTO `think_robot_message` VALUES ('99', '中顺子200', '2');
INSERT INTO `think_robot_message` VALUES ('100', '中对子700', '2');
INSERT INTO `think_robot_message` VALUES ('101', '大1000', '2');
INSERT INTO `think_robot_message` VALUES ('102', '小600', '2');
INSERT INTO `think_robot_message` VALUES ('103', '123大500', '2');
INSERT INTO `think_robot_message` VALUES ('104', '前顺子800', '2');
INSERT INTO `think_robot_message` VALUES ('105', '前豹子300', '2');
INSERT INTO `think_robot_message` VALUES ('106', '中顺子600', '2');
INSERT INTO `think_robot_message` VALUES ('107', '中对子300', '2');
INSERT INTO `think_robot_message` VALUES ('108', '大2000', '2');
INSERT INTO `think_robot_message` VALUES ('109', '小1500', '2');
INSERT INTO `think_robot_message` VALUES ('110', '12大500', '2');
INSERT INTO `think_robot_message` VALUES ('111', '1/12345/200', '2');
INSERT INTO `think_robot_message` VALUES ('112', '大300', '3');
INSERT INTO `think_robot_message` VALUES ('113', '大100', '3');
INSERT INTO `think_robot_message` VALUES ('114', '大500', '3');
INSERT INTO `think_robot_message` VALUES ('115', '小500', '3');
INSERT INTO `think_robot_message` VALUES ('116', '小200', '3');
INSERT INTO `think_robot_message` VALUES ('117', '大单200', '3');
INSERT INTO `think_robot_message` VALUES ('118', '小双200', '3');
INSERT INTO `think_robot_message` VALUES ('119', '小双500', '3');
INSERT INTO `think_robot_message` VALUES ('120', '6点100', '3');
INSERT INTO `think_robot_message` VALUES ('121', '12点500', '3');
INSERT INTO `think_robot_message` VALUES ('122', '1点100', '3');
INSERT INTO `think_robot_message` VALUES ('123', '极大100', '3');
INSERT INTO `think_robot_message` VALUES ('124', '极大300', '3');
INSERT INTO `think_robot_message` VALUES ('125', '极小500', '3');
INSERT INTO `think_robot_message` VALUES ('126', '庄500', '3');
INSERT INTO `think_robot_message` VALUES ('127', '闲300', '3');
INSERT INTO `think_robot_message` VALUES ('128', '豹子300', '3');
INSERT INTO `think_robot_message` VALUES ('129', '顺子200', '3');
INSERT INTO `think_robot_message` VALUES ('130', '对子500', '3');
INSERT INTO `think_robot_message` VALUES ('131', '半顺200', '3');
INSERT INTO `think_robot_message` VALUES ('132', '杂六200', '3');
INSERT INTO `think_robot_message` VALUES ('133', '顺子200', '3');

-- ----------------------------
-- Table structure for think_user
-- ----------------------------
DROP TABLE IF EXISTS `think_user`;
CREATE TABLE `think_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `sex` int(1) unsigned NOT NULL,
  `country` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `headimgurl` varchar(255) NOT NULL,
  `reg_time` int(10) unsigned NOT NULL,
  `last_time` int(10) unsigned NOT NULL,
  `reg_ip` varchar(255) NOT NULL,
  `last_ip` varchar(255) NOT NULL,
  `is_under` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `user_agent` varchar(255) NOT NULL,
  `logins` int(10) NOT NULL,
  `points` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '积分',
  `yong` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '佣金',
  `fanshui` decimal(10,2) NOT NULL DEFAULT '0.00',
  `t_id` int(10) unsigned NOT NULL COMMENT '推荐人',
  `t_add` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '分销积分',
  `qrcode` varchar(255) NOT NULL,
  `status` int(1) unsigned NOT NULL DEFAULT '1',
  `is_robot` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `dl_rate` varchar(50) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '',
  `wx_paycode` varchar(255) NOT NULL DEFAULT '',
  `zfb_paycode` varchar(255) NOT NULL DEFAULT '',
  `pkft_fs` varchar(5) NOT NULL DEFAULT '',
  `pcdd_fs` varchar(5) NOT NULL DEFAULT '',
  `k3_fs` varchar(5) NOT NULL DEFAULT '',
  `ssc_fs` varchar(5) NOT NULL DEFAULT '',
  `is_agent` tinyint(1) NOT NULL DEFAULT '0',
  `agent_fen` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pk10_is_win` tinyint(1) NOT NULL DEFAULT '0',
  `xjp28_is_win` tinyint(1) NOT NULL DEFAULT '0',
  `xjp28_is_lost` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_user
-- ----------------------------
INSERT INTO `think_user` VALUES ('1', 'bo0123', 'bo0123', 'e10adc3949ba59abbe56e057f20f883e', '0', '', '', '', '/Public/Home/img/face/6.png', '1517750498', '1523693900', '127.0.0.1', '127.0.0.1', '1', '', '0', '445042.00', '0.50', '3.00', '0', '0.50', '/Uploads/qrcode/2018-04-14/1523693900_586210177.png', '1', '0', '0', '', '', '', '', '', '', '', '1', '0.00', '0', '0', '0');
INSERT INTO `think_user` VALUES ('2', 'test1', 'test1', '96e79218965eb72c92a549dd5a330112', '0', '', '', '', '/Public/Home/img/face/3.png', '1522821889', '1523533573', '127.0.0.1', '127.0.0.1', '1', '', '0', '4900.00', '0.00', '1.50', '1', '0.00', '/Uploads/qrcode/2018-04-12/1523533574_208548951.png', '1', '0', '0', '', '', '', '', '', '', '', '0', '0.00', '0', '0', '0');

-- ----------------------------
-- Table structure for think_wx
-- ----------------------------
DROP TABLE IF EXISTS `think_wx`;
CREATE TABLE `think_wx` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `openid` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `expires_in` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of think_wx
-- ----------------------------
