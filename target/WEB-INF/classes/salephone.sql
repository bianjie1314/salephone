/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50614
Source Host           : localhost:3306
Source Database       : salephone

Target Server Type    : MYSQL
Target Server Version : 50614
File Encoding         : 65001

Date: 2019-04-14 12:17:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for evelate
-- ----------------------------
DROP TABLE IF EXISTS `evelate`;
CREATE TABLE `evelate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '评价内容',
  `order_id` int(11) DEFAULT NULL COMMENT '订单主键',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '审核状态,1待审核，2审核通过，3审核拒绝',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of evelate
-- ----------------------------
INSERT INTO `evelate` VALUES ('1', '1', '1', '2019-02-08 01:35:20', '2', '2019-04-07 00:15:59');
INSERT INTO `evelate` VALUES ('2', '挺好的', '6', '2019-02-08 01:35:22', '2', '2019-04-07 00:16:04');
INSERT INTO `evelate` VALUES ('3', 'accaasd', '11', '2019-04-07 16:07:12', '2', null);

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `url` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '链接',
  `icon` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `status` int(11) DEFAULT NULL COMMENT '状态,1正常,2禁用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `parent_id` int(11) DEFAULT NULL COMMENT '所属父菜单id',
  `index` int(11) DEFAULT NULL COMMENT '顺序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('1', '商品管理', '', '&#xe61a;', '1', '2019-01-20 21:28:02', '2019-01-20 21:28:04', null, '1');
INSERT INTO `menu` VALUES ('2', '财务管理', null, '&#xe620;', '1', '2019-01-26 16:44:41', '2019-01-26 16:44:51', null, '5');
INSERT INTO `menu` VALUES ('3', '用户管理', '', '&#xe60d;', '1', '2019-01-26 16:44:44', '2019-01-26 16:44:53', null, '4');
INSERT INTO `menu` VALUES ('4', '系统设置', null, '&#xe62e;', '1', '2019-01-26 16:44:46', '2019-01-26 16:44:55', null, '7');
INSERT INTO `menu` VALUES ('6', '商品列表', '/phone/getPhoneList', '', '1', '2019-01-20 21:27:53', '2019-01-20 21:27:55', '1', '1');
INSERT INTO `menu` VALUES ('7', '菜单列表', '/menu/getMenuList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '4', '2');
INSERT INTO `menu` VALUES ('8', '店铺管理', '', '&#xe643;', '1', '2019-01-26 16:44:48', '2019-02-25 23:21:51', null, '2');
INSERT INTO `menu` VALUES ('9', '订单管理', '', '&#xe627;', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', null, '3');
INSERT INTO `menu` VALUES ('10', '订单列表', '/order/getOrderList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '9', '1');
INSERT INTO `menu` VALUES ('11', '店铺列表', '/shop/getShopList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '8', '1');
INSERT INTO `menu` VALUES ('12', '用户列表', '/user/getUserList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '3', '1');
INSERT INTO `menu` VALUES ('13', '交易列表', '/wallet/getWalletList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '2', '1');
INSERT INTO `menu` VALUES ('14', '角色设置', '/role/getRoleList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '4', '1');
INSERT INTO `menu` VALUES ('15', '评价列表', '/evelate/getEvelateList', '', '1', '2019-01-26 16:44:48', '2019-01-26 16:44:57', '16', '1');
INSERT INTO `menu` VALUES ('16', '评论管理', null, '&#xe622;', '1', '2019-03-20 23:01:02', null, null, '6');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户编号',
  `phone_id` int(11) DEFAULT NULL COMMENT '手机编号',
  `num` int(11) DEFAULT NULL COMMENT '购买数量',
  `pay` float DEFAULT NULL COMMENT '支付费用',
  `status` int(11) DEFAULT NULL COMMENT '状态，1:未支付，2:已支付，3:待发货,4:待收获,5:已签收,6:已评价,7:取消订单,8:货物退回',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `order_code` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1', '1', '10', '2', '4222', '6', '2019-01-27 12:51:13', '2019-01-27 12:51:15', '0X201812112222');
INSERT INTO `orders` VALUES ('2', '1', '2', '33', '33.2', '4', '2019-01-27 12:51:13', '2019-04-06 22:33:27', '0X201812112223');
INSERT INTO `orders` VALUES ('3', '2', '3', '33', '33.2', '6', '2019-01-27 12:51:13', '2019-04-06 23:25:41', '0X201812112224');
INSERT INTO `orders` VALUES ('4', '2', '4', '33', '33.2', '10', '2019-01-27 12:51:13', '2019-01-27 22:36:16', '0X201812112255');
INSERT INTO `orders` VALUES ('5', '1', '5', '33', '33.2', '6', '2019-01-27 12:51:13', '2019-01-27 12:51:15', '0X201902112222');
INSERT INTO `orders` VALUES ('6', '6', '10', '1', '999', '5', '2019-03-01 12:51:13', '2019-03-08 00:20:21', '0X201902112221');
INSERT INTO `orders` VALUES ('7', '5', '10', '1', '3333', '1', '2019-03-17 00:14:39', null, '201903170014521552752892238');
INSERT INTO `orders` VALUES ('8', '1', '9', '2', '44', '1', '2019-03-17 00:16:50', null, '201903170016501552753010126');
INSERT INTO `orders` VALUES ('9', '6', '10', '1', '10.2', '1', '2019-03-22 22:01:33', null, '201903222201331553263293379');
INSERT INTO `orders` VALUES ('10', '6', '10', '2', '20.4', '7', '2019-04-05 23:56:55', '2019-04-05 23:56:57', '201904022201331553263293999');
INSERT INTO `orders` VALUES ('11', '6', '10', '2', '20.4', '5', '2019-04-05 23:56:55', '2019-04-07 16:07:12', '201904022201331553263293999');

-- ----------------------------
-- Table structure for order_process_log
-- ----------------------------
DROP TABLE IF EXISTS `order_process_log`;
CREATE TABLE `order_process_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单主键',
  `type` int(11) DEFAULT NULL COMMENT '类型1:未支付，2:待发货,3:待收获,4:已签收,5:已评价,6:取消订单,7:订单完成,8:退货申请，9:退货同意,10:退货拒绝,11:退货完成',
  `user_id` int(11) DEFAULT NULL COMMENT '操作人',
  `note` varchar(128) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of order_process_log
-- ----------------------------
INSERT INTO `order_process_log` VALUES ('1', '4', '10', '0', null, '2019-01-27 22:36:16');
INSERT INTO `order_process_log` VALUES ('2', '2', '3', '0', null, '2019-01-27 23:05:19');
INSERT INTO `order_process_log` VALUES ('3', '6', '2', '1', null, '2019-03-09 00:20:30');
INSERT INTO `order_process_log` VALUES ('4', '7', '1', '7', null, '2019-03-17 00:14:59');
INSERT INTO `order_process_log` VALUES ('5', '8', '1', '8', null, '2019-03-17 00:16:50');
INSERT INTO `order_process_log` VALUES ('6', '9', '1', '9', null, '2019-03-22 22:01:34');
INSERT INTO `order_process_log` VALUES ('7', '10', '1', null, null, '2019-04-04 23:57:41');
INSERT INTO `order_process_log` VALUES ('8', '10', '2', null, null, '2019-04-05 02:57:41');
INSERT INTO `order_process_log` VALUES ('9', '10', '3', null, null, '2019-04-05 03:57:43');
INSERT INTO `order_process_log` VALUES ('10', '10', '4', null, null, '2019-04-05 04:58:21');
INSERT INTO `order_process_log` VALUES ('11', '10', '5', null, null, '2019-04-05 05:58:23');
INSERT INTO `order_process_log` VALUES ('13', '10', '7', null, null, '2019-04-05 07:58:25');
INSERT INTO `order_process_log` VALUES ('21', '2', '4', '2', null, '2019-04-06 22:33:27');
INSERT INTO `order_process_log` VALUES ('22', '3', '6', '2', null, '2019-04-06 23:25:41');
INSERT INTO `order_process_log` VALUES ('23', '11', '5', '6', null, '2019-04-07 16:07:12');

-- ----------------------------
-- Table structure for phone
-- ----------------------------
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机名称',
  `unit_price` float(10,2) DEFAULT '0.00' COMMENT '单价',
  `type` varchar(45) CHARACTER SET utf8 DEFAULT NULL COMMENT '类型',
  `description` text CHARACTER SET utf8 COMMENT '描述',
  `store_num` int(11) DEFAULT '0' COMMENT '库存数量',
  `offer_num` int(11) DEFAULT '0' COMMENT '已经售出数量',
  `picture_ids` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '照片编号',
  `create_time` datetime DEFAULT NULL COMMENT '登记时间',
  `update_time` datetime DEFAULT NULL COMMENT '最近更新时间',
  `html_text` text CHARACTER SET utf8 COMMENT '详细页面',
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始销售时间',
  `end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束销售时间',
  `shop_id` int(11) DEFAULT NULL COMMENT '所属店铺',
  `sale_price` float(10,2) DEFAULT NULL COMMENT '销售价',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of phone
-- ----------------------------
INSERT INTO `phone` VALUES ('1', 'oppo R11', '2111.00', 'R11', '															\n				\n				\n				', '11', '2', ',16,17', '2018-11-18 21:48:28', '2019-04-12 21:25:15', '<p>sdagfs</p>', '2019-04-08 21:42:43', '2019-04-08 21:42:43', '1', '2111.00');
INSERT INTO `phone` VALUES ('2', 'oppo R7', '4333.00', 'R7', null, '22', '33', null, '2018-11-18 21:48:30', '2018-11-18 21:48:40', null, '2019-03-08 17:28:59', '2019-03-08 17:28:59', '1', '4333.00');
INSERT INTO `phone` VALUES ('5', 'oppo R7', '3333.00', 'R7', null, '22', '33', null, '2018-11-18 21:48:30', '2018-11-18 21:48:40', null, '2019-03-08 17:28:58', '2019-03-08 17:28:58', '2', '3333.00');
INSERT INTO `phone` VALUES ('6', 'oppo R7', '999.00', 'R7', null, '22', '33', null, '2018-11-18 21:48:30', '2018-11-18 21:48:40', null, '2019-03-08 17:28:57', '2019-03-08 17:28:57', '1', '999.00');
INSERT INTO `phone` VALUES ('7', 'oppo R7', '444.00', 'R7', null, '22', '33', null, '2018-11-18 21:48:30', '2018-11-18 21:48:40', null, '2019-03-08 17:28:57', '2019-03-08 17:28:57', '1', '444.00');
INSERT INTO `phone` VALUES ('8', 'oppo R7', '33.00', 'R7', null, '22', '33', null, '2018-11-18 21:48:30', '2018-11-18 21:48:40', null, '2019-03-08 17:28:55', '2019-03-08 17:28:55', '2', '33.00');
INSERT INTO `phone` VALUES ('9', '测试', '22.00', 'x22', '		得出		', '33', '0', null, '2019-03-03 18:33:13', null, '<p>&nbsp;擦擦擦</p>', '2019-03-08 12:58:21', '2019-03-08 12:58:21', '2', '22.00');
INSERT INTO `phone` VALUES ('10', '测试去', '11.20', 'x22', '							擦		\n				', '223', '0', ',9,10', '2019-03-03 18:36:25', null, '<p>ccccc</p>', '2019-04-12 20:53:17', '2019-04-12 20:53:17', '3', '10.20');
INSERT INTO `phone` VALUES ('11', 'vsdv', '22.00', 'OPPR11', '		dafd		', '23', '0', '', '2019-04-08 20:37:11', null, '<p>das</p>', '2019-04-08 21:35:41', '2019-04-08 21:35:41', null, '33.00');
INSERT INTO `phone` VALUES ('12', 'ces ', '13.00', 'OPPR15', '				测试机哦', '222', '0', ',9,10', '2019-04-08 21:33:39', null, '', '2019-04-08 21:32:42', '2019-04-08 21:32:45', null, '212.00');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '存储路径',
  `type` int(11) DEFAULT NULL COMMENT '类型,1:手机照片信息,2:用户评价照片',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '1', '1', '2019-04-07 22:38:26');
INSERT INTO `picture` VALUES ('2', '/upload/1554729735316QQ截图20180716230601.png', '1', '2019-04-08 20:30:27');
INSERT INTO `picture` VALUES ('3', 'G:\\IntelliJ IDEA space\\salephone\\target\\salephone\\WEB-INF\\upload/1554726657677QQ截图20180716230601.png', '1', '2019-04-08 20:30:58');
INSERT INTO `picture` VALUES ('4', 'G:\\IntelliJ IDEA space\\salephone\\target\\salephone\\WEB-INF\\upload/1554726757703QQ截图20180716230601.png', '1', '2019-04-08 20:32:38');
INSERT INTO `picture` VALUES ('5', 'G:\\IntelliJ IDEA space\\salephone\\target\\salephone\\WEB-INF\\upload/1554726860601QQ截图20180819031155.png', '1', '2019-04-08 20:34:21');
INSERT INTO `picture` VALUES ('6', 'G:\\IntelliJ IDEA space\\salephone\\target\\salephone\\WEB-INF\\upload/1554727015167QQ截图20180716230601.png', '1', '2019-04-08 20:36:55');
INSERT INTO `picture` VALUES ('7', '/1554728740553QQ截图20180716230601.png', '1', '2019-04-08 21:05:45');
INSERT INTO `picture` VALUES ('8', 'G:\\IntelliJ IDEA space\\salephone\\target\\salephone\\upload/1554729735316QQ截图20180716230601.png', '1', '2019-04-08 21:22:16');
INSERT INTO `picture` VALUES ('9', '/upload/1554730393270galaxy-note.jpg', '1', '2019-04-08 21:33:16');
INSERT INTO `picture` VALUES ('10', '/upload/1554730406512galaxy-note-1.jpg', '1', '2019-04-08 21:33:29');
INSERT INTO `picture` VALUES ('11', '/upload/1555074663134galaxy-note-4.jpg', '1', '2019-04-12 21:11:10');
INSERT INTO `picture` VALUES ('12', '/upload/1555075238112galaxy-note-4.jpg', '1', '2019-04-12 21:20:42');
INSERT INTO `picture` VALUES ('13', '/upload/1555075290021galaxy-note-2.jpg', '1', '2019-04-12 21:21:30');
INSERT INTO `picture` VALUES ('14', '/upload/1555075463815galaxy-note.jpg', '1', '2019-04-12 21:24:24');
INSERT INTO `picture` VALUES ('15', '/upload/1555075463812galaxy-note-1.jpg', '1', '2019-04-12 21:24:24');
INSERT INTO `picture` VALUES ('16', '/upload/1555075505654galaxy-note-2.jpg', '1', '2019-04-12 21:25:06');
INSERT INTO `picture` VALUES ('17', '/upload/1555075510868galaxy-note-4.jpg', '1', '2019-04-12 21:25:11');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '角色名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '普通用户', '2019-01-20 21:32:51', '2019-01-20 21:32:58');
INSERT INTO `role` VALUES ('2', '商户', '2019-01-20 21:32:54', '2019-01-20 21:33:01');
INSERT INTO `role` VALUES ('3', '管理员', '2019-01-20 21:32:56', '2019-01-20 21:33:03');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL COMMENT '菜单编号',
  `role_id` int(11) DEFAULT NULL COMMENT '角色编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES ('46', '1', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('47', '2', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('48', '3', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('49', '4', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('50', '6', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('51', '7', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('52', '8', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('53', '9', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('54', '10', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('55', '11', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('56', '12', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('57', '13', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('58', '14', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('59', '15', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('60', '16', '1', '2019-03-20 23:17:09', null);
INSERT INTO `role_menu` VALUES ('77', '1', '2', '2019-03-21 23:34:28', null);
INSERT INTO `role_menu` VALUES ('78', '6', '2', '2019-03-21 23:34:28', null);
INSERT INTO `role_menu` VALUES ('79', '8', '2', '2019-03-21 23:34:28', null);
INSERT INTO `role_menu` VALUES ('80', '9', '2', '2019-03-21 23:34:28', null);
INSERT INTO `role_menu` VALUES ('81', '10', '2', '2019-03-21 23:34:28', null);
INSERT INTO `role_menu` VALUES ('82', '11', '2', '2019-03-21 23:34:28', null);

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户编号',
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '简介',
  `picture_ids` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片编号',
  `location` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '店铺位置',
  `status` int(11) DEFAULT NULL COMMENT '店铺状态，1正常，2下架',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '1', '测试电', '哈哈哈哈哈哈', '1', '上海市..', '1', '2019-01-27 11:17:56', '2019-01-27 11:17:54');
INSERT INTO `shop` VALUES ('2', '2', '理想店铺', '										呵呵呵呵呵呵\n				\n				', '1', '福建省...', '1', '2019-01-27 11:17:56', '2019-01-27 11:58:53');
INSERT INTO `shop` VALUES ('3', '5', '测试店铺', '呵呵呵呵呵呵', '1', '福建省...', '1', '2019-01-27 11:17:56', '2019-04-05 20:00:12');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(13) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `username` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '姓名',
  `password` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `role_id` int(11) DEFAULT NULL COMMENT '角色编号',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `balance` float DEFAULT NULL COMMENT '余额',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1882828282', 'lin', '123', '1', '2018-11-17 19:04:56', '11', '2019-02-07 11:00:51');
INSERT INTO `user` VALUES ('2', '13110877374', 'test2', '123', '1', '2018-11-17 21:23:48', '34.2', '2019-03-22 20:13:14');
INSERT INTO `user` VALUES ('4', '13110877372', '13110877374', '123', '1', '2019-03-02 17:27:37', '1', null);
INSERT INTO `user` VALUES ('5', '13110877371', '13110877371', '123', '2', '2019-03-02 17:27:37', '1', null);
INSERT INTO `user` VALUES ('6', '13110877377', '过往2', '123', '3', '2019-03-22 23:52:25', '54', '2019-04-06 22:41:06');
INSERT INTO `user` VALUES ('7', '13110877333', 'van查', '123', '1', '2019-04-06 22:35:42', '4', null);

-- ----------------------------
-- Table structure for wallet_log
-- ----------------------------
DROP TABLE IF EXISTS `wallet_log`;
CREATE TABLE `wallet_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户编号',
  `order_id` int(11) DEFAULT NULL COMMENT '订单号主键',
  `money` double(12,2) DEFAULT NULL COMMENT '钱包',
  `type` int(11) DEFAULT '0' COMMENT '类型，1充值，2付款，3退款',
  `note` varchar(128) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of wallet_log
-- ----------------------------
INSERT INTO `wallet_log` VALUES ('2', '2', '2', '22.20', '2', null, '2019-02-08 00:55:57');
INSERT INTO `wallet_log` VALUES ('3', '2', '3', '33.20', '0', '订单取消退款', '2019-04-06 23:25:41');
INSERT INTO `wallet_log` VALUES ('5', '6', '0', '10.00', '1', '账户充值', '2019-04-07 18:33:14');
