/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : znccglpt

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-28 17:17:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `in_id` int(10) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1578948946 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1578948944', '1151864949', '奶酪', '14', 'A2', '502');
INSERT INTO `goods` VALUES ('1578948945', '1151864950', '奶酪', '14', 'A1', '102');

-- ----------------------------
-- Table structure for inlibrary
-- ----------------------------
DROP TABLE IF EXISTS `inlibrary`;
CREATE TABLE `inlibrary` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `intime` datetime DEFAULT NULL,
  `inuser` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1151865024 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inlibrary
-- ----------------------------
INSERT INTO `inlibrary` VALUES ('1151864949', '奶酪', '14', 'A2', '205', '2018-08-13 15:25:26', 'Mike');
INSERT INTO `inlibrary` VALUES ('1151864950', '起司', '14', 'A2', '205', '2018-08-13 15:25:27', 'Mike');
INSERT INTO `inlibrary` VALUES ('1151864975', '蛤蛤', '15', 'A2', '156', '2018-08-16 10:17:46', '蛤蛤');
INSERT INTO `inlibrary` VALUES ('1151864989', '肥宅快乐水', '123', 'A1', '101', '2018-08-16 11:53:27', '长者');
INSERT INTO `inlibrary` VALUES ('1151864992', '肥宅快乐水', '1', 'A1', '101', '2018-08-16 11:56:11', '钢闸门');
INSERT INTO `inlibrary` VALUES ('1151865012', '肥宅快乐奶茶', '1123', 'A2', '102', '2018-08-16 13:35:00', '上海市委书记');
INSERT INTO `inlibrary` VALUES ('1151865013', '一颗赛艇', '1123', 'A2', '102', '2018-08-16 13:35:00', '一颗赛艇');
INSERT INTO `inlibrary` VALUES ('1151865014', '二院视察', '50', 'A1', '101', '2018-08-16 13:37:21', '二院视察');
INSERT INTO `inlibrary` VALUES ('1151865015', '三个代表', '50', 'A1', '101', '2018-08-16 13:39:01', '三个代表');
INSERT INTO `inlibrary` VALUES ('1151865016', '四次起身', '5', 'A1', '101', '2018-08-16 13:42:40', '四次起身');
INSERT INTO `inlibrary` VALUES ('1151865017', '无可奉告', '50', 'A1', '101', '2018-08-16 13:58:10', '无可奉告');
INSERT INTO `inlibrary` VALUES ('1151865018', '六月水柜', '50', 'A1', '101', '2018-08-16 16:07:10', '六月水柜');
INSERT INTO `inlibrary` VALUES ('1151865019', '七因国服', '50', 'A1', '101', '2018-08-16 16:08:12', '七因国服');
INSERT INTO `inlibrary` VALUES ('1151865020', '八门外语', '165', 'A2', '102', '2018-08-17 11:12:35', '八门外语');
INSERT INTO `inlibrary` VALUES ('1151865021', '九十大寿', '561', 'A4', '205', '2018-08-17 11:12:52', '九十大寿');
INSERT INTO `inlibrary` VALUES ('1151865022', '十全长者', '65', 'A3', '405', '2018-08-17 11:13:01', '十全长者');
INSERT INTO `inlibrary` VALUES ('1151865023', '张宝华', '1', 'A1', '101', '2018-08-17 11:51:52', '张宝华');

-- ----------------------------
-- Table structure for move
-- ----------------------------
DROP TABLE IF EXISTS `move`;
CREATE TABLE `move` (
  `pid` int(10) NOT NULL,
  `goods_id` int(10) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `before_area` varchar(255) DEFAULT NULL,
  `before_room` varchar(255) DEFAULT NULL,
  `after_area` varchar(255) DEFAULT NULL,
  `after_room` varchar(255) DEFAULT NULL,
  `move_time` datetime DEFAULT NULL,
  `move_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of move
-- ----------------------------
INSERT INTO `move` VALUES ('1184949777', '1578948945', '奶酪', '14', 'A2', '503', 'A1', '102', '2018-08-13 15:56:17', 'Bob');

-- ----------------------------
-- Table structure for outlibrary
-- ----------------------------
DROP TABLE IF EXISTS `outlibrary`;
CREATE TABLE `outlibrary` (
  `pid` int(10) NOT NULL AUTO_INCREMENT,
  `pname` varchar(255) DEFAULT NULL,
  `pnum` int(255) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT NULL,
  `out_date` datetime DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `out_user` varchar(255) DEFAULT NULL,
  `goods_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=1156498518 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outlibrary
-- ----------------------------
INSERT INTO `outlibrary` VALUES ('1156498495', '一颗赛艇', '1', 'A3', '101', '2018-08-17 14:36:46', '科院超市', '一颗赛艇', '1151865013');
INSERT INTO `outlibrary` VALUES ('1156498496', '二院视察', '2', 'A3', '101', '2018-08-17 14:36:49', '科院超市', '二院视察', '1151865014');
INSERT INTO `outlibrary` VALUES ('1156498497', '三个代表', '3', 'A3', '101', '2018-08-17 14:36:52', '科院超市', '三个代表', '1151865015');
INSERT INTO `outlibrary` VALUES ('1156498498', '四次起身', '4', 'A3', '101', '2018-08-17 14:36:55', '科院超市', '四次起身', '1151865016');
INSERT INTO `outlibrary` VALUES ('1156498499', '无可奉告', '5', 'A3', '101', '2018-08-17 14:36:58', '科院超市', '无可奉告', '1151865017');
INSERT INTO `outlibrary` VALUES ('1156498500', '六月水柜', '6', 'A3', '101', '2018-08-17 14:37:01', '科院超市', '六月水柜', '1151865018');
INSERT INTO `outlibrary` VALUES ('1156498501', '七因祸福', '7', 'A3', '101', '2018-08-17 14:37:04', '科院超市', '七因祸福', '1151865019');
INSERT INTO `outlibrary` VALUES ('1156498502', '八门外语', '8', 'A3', '101', '2018-08-17 14:37:06', '科院超市', '八门外语', '1151865020');
INSERT INTO `outlibrary` VALUES ('1156498503', '九十大寿', '9', 'A3', '101', '2018-08-17 14:37:08', '科院超市', '九十大寿', '1151865021');
INSERT INTO `outlibrary` VALUES ('1156498504', '十全长者', '10', 'A3', '101', '2018-08-17 14:37:16', '科院超市', '十全长者', '1151865022');
INSERT INTO `outlibrary` VALUES ('1156498505', '张宝华', null, null, null, '2018-08-17 16:23:59', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498506', '彭定康', null, null, null, '2018-08-17 16:24:02', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498507', '彭定康', null, null, null, '2018-08-17 16:24:04', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498508', '彭定康', null, null, null, '2018-08-17 16:24:07', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498509', '彭定康', null, null, null, '2018-08-17 16:24:09', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498510', '彭定康', null, null, null, '2018-08-17 16:24:12', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498511', '彭定康', null, null, null, '2018-08-17 16:24:14', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498512', '彭定康', null, null, null, '2018-08-17 16:24:17', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498513', '彭定康', null, null, null, '2018-08-17 16:24:22', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498514', '彭定康', null, null, null, '2018-08-17 16:24:25', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498515', '彭定康', null, null, null, '2018-08-17 16:24:27', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498516', '彭定康', null, null, null, '2018-08-17 16:24:35', null, null, null);
INSERT INTO `outlibrary` VALUES ('1156498517', '彭定康', null, null, null, '2018-08-17 16:24:38', null, null, null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `realname` varchar(20) DEFAULT NULL,
  `phonumber` varchar(20) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `director` varchar(20) DEFAULT NULL,
  `userdescribe` varchar(255) DEFAULT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=695 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '123456', '超级管理员', '15869100556', '0', '', '超级管理员账号', '\\picture\\userphoto\\1_admin.gif');
INSERT INTO `user` VALUES ('2', 'admin2', '123456789', '铁甲小宝', '13336077906', '0', '', null, null);
INSERT INTO `user` VALUES ('3', 'admin3', '123', '习习蛤蛤', '15869100556', '0', '', null, null);
INSERT INTO `user` VALUES ('4', '蛤蛤', '123456', '蛤蛤', '13588756387', '1', 'admin', '', '\\picture\\userphoto\\4_蛤蛤.jpg');
INSERT INTO `user` VALUES ('5', '江信江疑', '123', '江信江疑', '11011011011', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('6', '董先生', '123456', '董先生', '13588756387', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('7', '华莱士', '123', '华莱士', '10000000000', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('8', '西方记者', '123456', '西方记者', '13588756387', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('9', '长者', '123', '长者', '10000000000', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('10', '-1s', '123456', '-1s', '13588756387', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('11', '青蛙长老', '123', '青蛙长老', '10000000000', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('12', '呱呱', '123456', '呱呱', '13588756387', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('13', '真香教徒', '123456', '王境泽', '15869100556', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('14', '时间长者', '123456', '时间长者', '13588756387', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('15', 'The  让', '123', '五五让', '4396', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('16', 'UZI', '123', '乌兹', '15860321057', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('17', '赛文老祖', '158', '七酱', '4396777', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('18', '因缺思厅', '666', 'interesting', '15366694581', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('19', '一颗赛艇', '123456', '一颗赛艇', '13522015368', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('21', '力之金阁', '123456', '内马尼亚·维迪奇', '四dark♂金刚', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('22', '技之银阁', '123456', '弗兰克·兰帕德', '四dark♂金刚', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('23', '动之铜阁', '123456', '韦恩·鲁尼', '四dark♂金刚', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('24', '壁之铁阁', '123456', '里奥·梅西', '四dark♂金刚', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('25', '我，五五开，没开挂', '123', '卢本伟', '11011011011', '1', 'admin', null, null);
INSERT INTO `user` VALUES ('26', '吾王', '666', '比利·海灵顿', '乖乖♂站好', '1', 'admin', null, null);
