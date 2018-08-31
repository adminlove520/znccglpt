/*
Navicat MySQL Data Transfer

Source Server         : Local
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : znccglpt

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-08-31 16:18:30
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
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '蕉龙', '123456', '香♂蕉♂君', '15869100556', '0', '', '香蕉君可能会迟到，但绝不会缺席。', '\\picture\\userphoto\\20180831161627.gif');
INSERT INTO `user` VALUES ('2', 'admin2', '123456', '铁甲小宝', '13336077906', '0', '', null, null);
INSERT INTO `user` VALUES ('3', 'admin3', '123456', '习习蛤蛤', '13588756387', '0', '', null, null);
INSERT INTO `user` VALUES ('4', '守护神', '123456', '赤さん', '14311307145', '1', '蕉龙', '拥有天真无邪的笑容的能力是日暮里的守护神拥有天真无邪的笑容的能力，是日暮里的守护神，名义上的王：妖精王', '\\picture\\userphoto\\20180831160847.jpg');
INSERT INTO `user` VALUES ('5', '森の大統領', '123456', 'チャべス♂オバマ', '13574945635', '1', '蕉龙', '实际掌握权力的人，拥有肉体演说的能力', '\\picture\\userphoto\\20180831161318.png');
INSERT INTO `user` VALUES ('6', '森の妖精', '123456', '比利·海灵顿', '13957145932', '1', '蕉龙', '实际上是新日暮里数一数二的强者，世人爱称：王の兄貴、森の妖精。曾与カズヤ和贝奥兰迪等众多高手过招，并都战胜了他们。能力：空手道 、尻の击打 、光の力（光明方大妖精赐予比利的高于常人的超强力量）、光の舞 、开启光明形态（攻击附带光明属性，主要克制亡灵和恶魔）、哲学の说教。', '\\picture\\userphoto\\20180831160855.jpg');
INSERT INTO `user` VALUES ('7', '暗の妖精', '123456', 'VAN様', '13674958745', '1', '蕉龙', '黑暗方绝对统领：暗の妖精  受到了日暮里上古恶魔King石井的感召从TDN♂コスギ变成了Van Darkholme，并致力于将石井再次复活。分为表层形态和暗黑形态：表层形态战斗力一般，不过善用计策，附带说教和挑衅。VAN様真正的实力是开暗黑形态后，此形态下属性全面提升，能施放多种技能。', '\\picture\\userphoto\\20180831161216.jpg');
INSERT INTO `user` VALUES ('8', '力之♂金阁', '123456', 'Jirka Kalvoda ', '12345678900', '1', '蕉龙', null, null);
INSERT INTO `user` VALUES ('9', '技之♂银阁', '123456', 'Jarda Kolar ', '12345678900', '1', '蕉龙', null, null);
INSERT INTO `user` VALUES ('10', '动之♂铜阁', '123456', 'Beau Bradley', '12345678900', '1', '蕉龙', null, null);
INSERT INTO `user` VALUES ('11', '壁之♂铁阁', '123456', 'Sonny Markham ', '12345678900', '1', '蕉龙', null, null);
INSERT INTO `user` VALUES ('12', '蛤蛤', '123456', '江信江疑', '11011011011', '1', '蕉龙', '', '\\picture\\userphoto\\20180831160904.gif');
INSERT INTO `user` VALUES ('13', '窃格瓦拉', '123456', '周某', '', '1', '蕉龙', '打工是不可能打工的，这辈子都不可能打工的', '\\picture\\userphoto\\20180831160912.jpg');
INSERT INTO `user` VALUES ('14', '社会主义好', '123456', '社会主义接班人', '', '1', '蕉龙', '', '\\picture\\userphoto\\20180831160918.jpg');
INSERT INTO `user` VALUES ('15', '屎忽鬼', '123456', '乌蝇哥', '', '1', '蕉龙', '呀屎啊你', '\\picture\\userphoto\\20180831160926.gif');
INSERT INTO `user` VALUES ('16', 'Duang', '123456', '成龙大哥', '', '1', '蕉龙', '', '\\picture\\userphoto\\20180831160932.gif');
INSERT INTO `user` VALUES ('17', '金坷垃', '123456', '农民伯伯', '', '1', '蕉龙', '金坷垃的好处都有啥,谁说对了分就给他', '\\picture\\userphoto\\20180831160940.gif');
INSERT INTO `user` VALUES ('18', '吟诗鬼才', '123456', '梁逸峰', '', '1', '蕉龙', '', '\\picture\\userphoto\\20180831160946.jpg');
