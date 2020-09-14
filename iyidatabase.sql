/*
Navicat MySQL Data Transfer

Source Server         : test
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : iyidatabase

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2020-09-01 01:27:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `is_default` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `imgsrc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES ('1', '夏季热销', 'https://a.vpimg2.com/upload/flow/2020/08/28/193/15986107438378.jpg');
INSERT INTO `banner` VALUES ('2', '限时特惠', 'https://a.vpimg2.com/upload/flow/2020/08/28/87/15986087705437.jpg');
INSERT INTO `banner` VALUES ('3', '限时抢购', 'https://img.adidas.com.cn/resources/2020kvbanner/aug/zx/oldkv/kv-pc.jpg?version=000000');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `rest` int(11) DEFAULT NULL,
  `desimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '【双层防透丝滑绸面】2020新款宽松显瘦女式吊带打底背心女 吊带', 'https://a.vpimg4.com/upload/merchandise/pdcvis/610778/2020/0618/169/74ec9d12-9a58-45b8-b0d4-5b83f7394b5a_503x503_90.jpg', '30', '【双层防透丝滑绸面】2020新款宽松显瘦女式吊带打底背心女 吊带', '女装', '200', 'https://a.vpimg2.com/upload/merchandise/pdcvis/610778/2020/0510/190/302a7cd4-ed3c-4aac-8e5c-c92836af48b1.jpg https://a.vpimg3.com/upload/merchandise/pdcvis/610778/2020/0510/91/81891384-7919-492e-b38b-9f1c08cac5b0.jpg');
INSERT INTO `goods` VALUES ('2', '三十而已刺绣连衣裙夏秋20新款运动polo衫女裙子中长款t恤裙', 'https://h2.appsimg.com/a.appsimg.com/upload/merchandise/pdcvis/2020/02/28/91/9a537c75-35e0-4c96-b5a8-4a00e34e700b_282x282_90.jpg', '231', '最好看的连衣裙', '女装', '100', 'https://a.vpimg2.com/upload/merchandise/pdcvis/2020/02/28/160/75b7db17-81cd-4d75-9e97-94e8737d756c.jpg https://a.vpimg4.com/upload/merchandise/pdcvis/2020/02/28/27/49992b62-12e4-4750-98ee-0a940f9fc447.jpg');
INSERT INTO `goods` VALUES ('3', '三十而已新款时尚拼接春秋爆款卫衣女连帽卫衣女式卫衣', 'https://h2.appsimg.com/a.appsimg.com/upload/merchandise/pdcvis/607777/2020/0716/22/30f7a68b-9faf-416d-bde7-36a349af0062_282x282_90.jpg', '60', '三十而已新款时尚拼接春秋爆款卫衣女连帽卫衣女式卫衣', '女装', '100', 'https://a.vpimg3.com/upload/merchandise/pdcvis/607777/2020/0826/130/d1ce40e4-c7ac-415a-aafa-0a1d6178362f.jpg https://a.vpimg4.com/upload/merchandise/pdcvis/607777/2020/0826/151/2952b60f-634e-49eb-9785-cda7c2617f78.jpg');
INSERT INTO `goods` VALUES ('4', '2020新款韩版女气质收腰长袖纯色连衣裙', 'https://h2.appsimg.com/a.appsimg.com/upload/merchandise/pdcvis/2020/01/21/40/e230d008-a554-4529-8a8b-c6f1d20bf121_282x282_90.jpg', '100', '2020新款韩版女气质收腰长袖纯色连衣裙', '女装', '100', 'https://a.vpimg3.com/upload/merchandise/pdcvis/2020/01/21/41/cb5588a7-7450-4311-a481-a40414d4f4f7.jpg https://a.vpimg3.com/upload/merchandise/pdcvis/2020/01/21/81/e0156b23-8e88-41f7-ab3c-04f1633e15c5.jpg');
INSERT INTO `goods` VALUES ('5', '女士衬衫女格子长袖衬衫女上衣女衬衣格子衬衫宽松休闲衬衫女衬衫', 'https://h2.appsimg.com/a.appsimg.com/upload/merchandise/pdcvis/2020/06/10/71/e932c3f8-fd7c-4207-85b7-b09bf1823942_420_531.jpg', '100', '女士衬衫女格子长袖衬衫女上衣女衬衣格子衬衫宽松休闲衬衫女衬衫', '女装', '100', 'https://a.vpimg4.com/upload/merchandise/pdcvis/2020/06/10/94/29ab10a8-cc45-4579-8936-16ac66df8ada.jpg https://a.vpimg2.com/upload/merchandise/pdcvis/2020/06/10/31/887f9d53-9c72-4c75-b705-822ea4920460.jpg');
INSERT INTO `goods` VALUES ('6', '\r\n\r\n\r\n\r\n\r\n\r\n收藏宝贝 (320人气)\r\n2020夏季新款韩版V领套头字母印花人物T恤女短袖宽松白搭休闲上衣', 'https://img.alicdn.com/imgextra/i2/27562227/O1CN01I85TYi1SK0eJweKJA_!!0-saturn_solar.jpg_220x220.jpg_.webp', '200', '2020夏季新款韩版V领套头字母印花人物T恤女短袖宽松白搭休闲上衣', '女装', '20', 'https://img.alicdn.com/imgextra/i3/652002248/O1CN01RU070l1STcxaG5M3Q_!!652002248.jpg https://img.alicdn.com/imgextra/i1/652002248/O1CN01ME9PlM1STcxU7avuV_!!652002248.jpg');
INSERT INTO `goods` VALUES ('7', '2020黑色碎花连衣裙女春季新款雪纺v领长袖法式长裙子及踝复古', 'https://img.alicdn.com/imgextra/i1/1290000029/O1CN01zr1n6y1C5K6Vlrm6x_!!0-saturn_solar.jpg_220x220.jpg_.webp', '30', '2020黑色碎花连衣裙女春季新款雪纺v领长袖法式长裙子及踝复古', '女装', '10', 'https://img.alicdn.com/imgextra/i2/3790201884/O1CN01BeRzzU1PmunyIMiHI_!!3790201884.jpg https://img.alicdn.com/imgextra/i2/3790201884/O1CN01adfXG11Pmunyw89yZ_!!3790201884.jpg');
INSERT INTO `goods` VALUES ('8', '收腰显瘦白色蕾丝连衣裙中长款超仙女泡泡袖夏季短袖气质初恋裙子', 'https://img.alicdn.com/imgextra/i1/13664235/O1CN01pzQQvy1h9fwzD3lMo_!!0-saturn_solar.jpg_220x220.jpg_.webp', '300', '收腰显瘦白色蕾丝连衣裙中长款超仙女泡泡袖夏季短袖气质初恋裙子', '女装', '10', 'https://img.alicdn.com/imgextra/i1/73255395/O1CN01WDyR2L1pixN4O4pTc_!!73255395.jpg https://img.alicdn.com/imgextra/i4/73255395/O1CN01SVCroW1pixN69xhxI_!!73255395.jpg');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `addressid` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for shopcart
-- ----------------------------
DROP TABLE IF EXISTS `shopcart`;
CREATE TABLE `shopcart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) DEFAULT NULL,
  `goodsid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `state` tinyint(4) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopcart
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `headimg` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '小王', '12345678', 'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1812993978,4158651947&fm=26&gp=0.jpg', '12345678123');
INSERT INTO `user` VALUES ('31', '唐文心', 'a12345678', null, '19149847273');
INSERT INTO `user` VALUES ('32', '小王头', 'a123456789', null, '12345678129');
