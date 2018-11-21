/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : fruit_manage

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 21/11/2018 11:27:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for accessory
-- ----------------------------
DROP TABLE IF EXISTS `accessory`;
CREATE TABLE `accessory` (
  `accessoryid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `fruitid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` double DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`accessoryid`),
  UNIQUE KEY `accessory_PK` (`accessoryid`),
  KEY `关系4_FK` (`fruitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of accessory
-- ----------------------------
BEGIN;
INSERT INTO `accessory` VALUES ('4587egaskh-9j65-87s4-9245-9347ajasd', '88e6ec6c-6d17-43a7-8782-38904ajskdh', '包装袋', 0.1, '2017-09-13 19:47:19');
INSERT INTO `accessory` VALUES ('4758zhuyrg-2l4t-4d6e-1754-1342ujify', '88e6ec6c-6d17-43a7-8782-38904ajskdh', '纸板盒', 0.3, '2017-09-13 19:50:12');
INSERT INTO `accessory` VALUES ('fbfec4d6-6510-4c83-9ef2-5467ef6b07ca', '88e6ec6c-6d17-43a7-8782-38904ajskdh', '捆绳', 0.1, '2017-09-13 21:17:39');
INSERT INTO `accessory` VALUES ('sdasdugy8c-27hkj-dj9-sd-93hsd9834hk', '88e6ec6c-6d17-43a7-8782-48957ajskdf', '塑料袋', 0.05, '2017-09-16 12:20:03');
COMMIT;

-- ----------------------------
-- Table structure for commodities
-- ----------------------------
DROP TABLE IF EXISTS `commodities`;
CREATE TABLE `commodities` (
  `fruitid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` double DEFAULT NULL,
  `locality` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`fruitid`),
  UNIQUE KEY `commodities_PK` (`fruitid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of commodities
-- ----------------------------
BEGIN;
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-38904ajskdh', '黄桃', 2.5, '浙江省金华市', '2017-09-09 09:34:12');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-48957ajskdf', '火龙果', 6.68, '浙江省绍兴市', '2017-09-09 09:35:17');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-89asdjh389a', '橙子', 0.4, '江苏省南京市', '2017-09-09 09:36:44');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-9534sd23h90', '柚子', 0.5, '上海市金山区', '2017-09-09 09:37:51');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-csrjdsk8347', '猕猴桃', 2.2, '上海市嘉定区', '2017-09-09 09:38:03');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-d1eae391234', '苹果', 0.7, '山东省青岛市', '2017-09-09 09:39:22');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-d1eae394106', '橘子', 1.6, '上海市普陀区', '2017-09-09 09:40:11');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-d1eae84dj46', '香蕉', 1.3, '江苏省昆山市', '2017-09-09 09:41:23');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-dhk327894aj', '柿子', 0.5, '江苏省苏州市', '2017-09-09 09:42:52');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-dijhksd2367', '榴莲', 13, '江苏省盐城县', '2017-09-09 09:43:31');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-hc2374gasd8', '葡萄', 2.3, '上海市马陆镇', '2017-09-09 09:43:57');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-jhk8340a783', '荔枝', 1.8, '江苏省无锡市', '2017-09-09 09:44:05');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-kduidfh3435', '西瓜', 0.3, '江苏省常州市', '2017-09-09 09:45:14');
INSERT INTO `commodities` VALUES ('88e6ec6c-6d17-43a7-8782-xce3940hsd4', '芒果', 3.6, '浙江省杭州市', '2017-09-09 09:46:34');
COMMIT;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `contractid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `retailerid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `barcode` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`contractid`),
  UNIQUE KEY `contract_PK` (`contractid`),
  KEY `关系1_FK` (`retailerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of contract
-- ----------------------------
BEGIN;
INSERT INTO `contract` VALUES ('3fe6a2c4-6400-4052-8330-3de3ce9fc316', '5c353cd1-e36d-48e9-8225-f66b9ce33633', '201808110001', 1, '2018-08-11 21:56:23');
INSERT INTO `contract` VALUES ('7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '90h7dv5c-9j87-24r6-9087-anune089x325', '201808110002', 1, '2018-08-11 22:19:57');
INSERT INTO `contract` VALUES ('d3d7e68b-bd6e-4efa-a98f-fd138348fe66', '90h7dv5c-9j87-24r6-9087-anune089x978', '201808120001', 0, '2018-08-12 10:43:21');
COMMIT;

-- ----------------------------
-- Table structure for middle_tab
-- ----------------------------
DROP TABLE IF EXISTS `middle_tab`;
CREATE TABLE `middle_tab` (
  `middleid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `contractid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `fruitid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`middleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of middle_tab
-- ----------------------------
BEGIN;
INSERT INTO `middle_tab` VALUES ('09a1d258-a734-4fb7-9a13-abac8e472166', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-d1eae394106', 19);
INSERT INTO `middle_tab` VALUES ('0a928e0c-a6b9-4920-8b79-15f294ef0b39', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-xce3940hsd4', 291);
INSERT INTO `middle_tab` VALUES ('22b829e5-dc05-43ce-aab3-5dd1e1340caf', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-dhk327894aj', 912);
INSERT INTO `middle_tab` VALUES ('37d0d726-56e6-47a6-89bf-1da87957ee02', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-csrjdsk8347', 191);
INSERT INTO `middle_tab` VALUES ('4c1f8074-4901-46d7-a799-ea5e993a0797', '3fe6a2c4-6400-4052-8330-3de3ce9fc316', '88e6ec6c-6d17-43a7-8782-48957ajskdf', 900);
INSERT INTO `middle_tab` VALUES ('4e28018e-beb7-48f4-9df5-4af9675aac2e', 'd3d7e68b-bd6e-4efa-a98f-fd138348fe66', '88e6ec6c-6d17-43a7-8782-csrjdsk8347', 902);
INSERT INTO `middle_tab` VALUES ('53f15c77-ef8e-4495-9acc-3c93d133bd18', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-kduidfh3435', 93);
INSERT INTO `middle_tab` VALUES ('57d3d052-5789-4052-b38a-433cd65c6433', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-d1eae391234', 191);
INSERT INTO `middle_tab` VALUES ('5cef4694-4a82-4624-94d7-e0a459a68cb0', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-d1eae84dj46', 199);
INSERT INTO `middle_tab` VALUES ('6d5be869-513b-4315-b41f-5c19f8ca1bea', 'd3d7e68b-bd6e-4efa-a98f-fd138348fe66', '88e6ec6c-6d17-43a7-8782-38904ajskdh', 109);
INSERT INTO `middle_tab` VALUES ('7c2df447-e79b-40a6-8e70-a9ac8fb50c47', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-38904ajskdh', 100);
INSERT INTO `middle_tab` VALUES ('8b776056-2dd1-408c-bb61-ffad39cb3831', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-dijhksd2367', 239);
INSERT INTO `middle_tab` VALUES ('aa3c64c9-dda0-441b-be66-4c14b8f4e1f6', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-jhk8340a783', 921);
INSERT INTO `middle_tab` VALUES ('b561b2ea-fed7-45c4-ac10-2d246917c505', '3fe6a2c4-6400-4052-8330-3de3ce9fc316', '88e6ec6c-6d17-43a7-8782-38904ajskdh', 500);
INSERT INTO `middle_tab` VALUES ('c38bdeea-6e2c-4900-aa6e-207b6c89deac', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-9534sd23h90', 111);
INSERT INTO `middle_tab` VALUES ('ccda2cd4-c5f5-4342-a68d-4bfc996617e1', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-89asdjh389a', 111);
INSERT INTO `middle_tab` VALUES ('d7b64ba0-7e10-456d-a727-c5fb3b25d593', 'd3d7e68b-bd6e-4efa-a98f-fd138348fe66', '88e6ec6c-6d17-43a7-8782-9534sd23h90', 901);
INSERT INTO `middle_tab` VALUES ('e39daca3-7c22-4866-8609-7669300aa32e', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-48957ajskdf', 100);
INSERT INTO `middle_tab` VALUES ('f54da5fa-ba6b-4438-955e-7850bcb0541a', '7ef0d779-b3cf-4e57-9c45-11c1e6b05226', '88e6ec6c-6d17-43a7-8782-hc2374gasd8', 392);
COMMIT;

-- ----------------------------
-- Table structure for retailer
-- ----------------------------
DROP TABLE IF EXISTS `retailer`;
CREATE TABLE `retailer` (
  `retailerid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  PRIMARY KEY (`retailerid`),
  UNIQUE KEY `retailer_PK` (`retailerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of retailer
-- ----------------------------
BEGIN;
INSERT INTO `retailer` VALUES ('45j8r40p-4fu7-87t4-8723-sdfjh789x907', '石恩华', '13777777778', '上海市普陀区', 1, '2017-09-02 12:33:40');
INSERT INTO `retailer` VALUES ('5c353cd1-e36d-48e9-8225-f66b9ce33633', '刘成成', '13566666666', '上海市黄浦区', 1, '2018-08-09 12:08:58');
INSERT INTO `retailer` VALUES ('88e6ec6c-6d17-43a7-8782-d1eae394d802', '蒋虎子', '13888888888', '上海市嘉定区', 1, '2017-09-02 12:31:20');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x021', '胡晓丽', '15522222222', '上海市闵行区', 1, '2017-09-04 09:14:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x096', '蒋俊佳', '13666666666', '上海市宝山区', 1, '2017-09-03 09:14:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x294', '施俊杰', '13444444444', '上海市徐汇区', 1, '2017-09-04 09:16:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x325', '钱晓晓', '15533333333', '上海市长宁区', 1, '2017-09-04 09:17:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x365', '王二小', '13555555555', '上海市杨浦区', 1, '2017-09-04 09:18:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x476', '任宇', '13222222222', '上海市虹口区', 1, '2017-09-04 09:19:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x734', '周佳', '15566666666', '上海市金山区', 1, '2017-09-04 09:20:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x954', '牛夏利', '13333333333', '上海市松江区', 1, '2017-09-04 09:22:55');
INSERT INTO `retailer` VALUES ('90h7dv5c-9j87-24r6-9087-anune089x978', '刘浩', '13111111111', '上海市青浦区', 1, '2017-09-04 09:23:55');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `user_PK` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('392f9ee6-7864-4c30-9178-be7f88af4b0a', 'julin', '123456', '李四', '138545283921');
INSERT INTO `user` VALUES ('3af57d0545766ec940d2c32a6567cc06ae5', 'jack', '1234', '张三', '15588888888');
INSERT INTO `user` VALUES ('734hdak3kfd389jgh3kll4590wejrh983jk', 'tom', '4321', '张茜茜', '13888888888');
INSERT INTO `user` VALUES ('88e6ec6c-6d17-43a7-8782-d1eae394d802', 'jackson', '2222', '刘霜', '13782345627');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
