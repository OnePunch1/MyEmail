/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80012
 Source Host           : localhost:3306
 Source Schema         : email

 Target Server Type    : MySQL
 Target Server Version : 80012
 File Encoding         : 65001

 Date: 20/01/2019 18:04:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for draft_box
-- ----------------------------
DROP TABLE IF EXISTS `draft_box`;
CREATE TABLE `draft_box`  (
  `id` int(255) NOT NULL,
  `reciever` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` datetime(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of draft_box
-- ----------------------------
INSERT INTO `draft_box` VALUES (6, '何浩飞', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:41.000000');
INSERT INTO `draft_box` VALUES (7, '何浩a', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:41.000000');
INSERT INTO `draft_box` VALUES (8, '何浩飞', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:41.000000');
INSERT INTO `draft_box` VALUES (9, '何浩飞', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:42.000000');
INSERT INTO `draft_box` VALUES (10, '何浩飞11', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:42.000000');
INSERT INTO `draft_box` VALUES (11, '何浩飞2', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:42.000000');
INSERT INTO `draft_box` VALUES (12, '何浩飞3', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:42.000000');
INSERT INTO `draft_box` VALUES (13, '何浩44', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:43.000000');
INSERT INTO `draft_box` VALUES (14, '何浩飞', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:43.000000');
INSERT INTO `draft_box` VALUES (15, '何浩飞', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:43.000000');
INSERT INTO `draft_box` VALUES (16, '何浩飞', '何浩飞', 'aaa', 'a', '2018-12-06 15:41:43.000000');

-- ----------------------------
-- Table structure for lianxiren
-- ----------------------------
DROP TABLE IF EXISTS `lianxiren`;
CREATE TABLE `lianxiren`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zhuren` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `fenzu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lianxiren
-- ----------------------------
INSERT INTO `lianxiren` VALUES (1, '何浩飞', 'zhu', '新建分组1');

-- ----------------------------
-- Table structure for login
-- ----------------------------
DROP TABLE IF EXISTS `login`;
CREATE TABLE `login`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login
-- ----------------------------
INSERT INTO `login` VALUES (1, '何浩飞', '�\n�9I篩V郬��>');
INSERT INTO `login` VALUES (2, 'zhu', ' ,筨琘[朘-#Kp');
INSERT INTO `login` VALUES (3, 'wang', '�\n�9I篩V郬��>');

-- ----------------------------
-- Table structure for reciever_mail
-- ----------------------------
DROP TABLE IF EXISTS `reciever_mail`;
CREATE TABLE `reciever_mail`  (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `reciever` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `date` timestamp(6) NOT NULL,
  `fujian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reciever_mail
-- ----------------------------
INSERT INTO `reciever_mail` VALUES (3, '何浩飞', 'wang', '1111', '11111111111', '2018-12-06 15:34:12.000000', ' ');
INSERT INTO `reciever_mail` VALUES (4, '何浩飞', '何浩飞', 'aaaaa', 'aaaaaaa', '2018-12-06 15:34:53.000000', ' ');
INSERT INTO `reciever_mail` VALUES (9, '何浩飞', '何浩飞', 'sadas', 'sadas', '2018-12-17 20:56:30.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则.png');
INSERT INTO `reciever_mail` VALUES (10, '何浩飞', '何浩飞', 'sss', 'sdsd', '2018-12-18 12:38:28.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则1.png');
INSERT INTO `reciever_mail` VALUES (11, '何浩飞', '何浩飞', 'sss', 'sdsd', '2018-12-18 12:38:49.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则1.png');
INSERT INTO `reciever_mail` VALUES (12, '何浩飞', '何浩飞', 'sss', 'sdaas', '2018-12-18 13:48:34.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则1.png');
INSERT INTO `reciever_mail` VALUES (13, '何浩飞', '何浩飞', 'ssss', 'sss', '2018-12-18 14:50:37.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则2.png');
INSERT INTO `reciever_mail` VALUES (14, '何浩飞', '何浩飞', 'sss', 'sdasdas', '2018-12-19 21:58:18.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则.png');

-- ----------------------------
-- Table structure for send_mail
-- ----------------------------
DROP TABLE IF EXISTS `send_mail`;
CREATE TABLE `send_mail`  (
  `id` int(255) NOT NULL AUTO_INCREMENT COMMENT 'senderid\r\n',
  `sender` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `reciever` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `date` timestamp(6) NOT NULL ON UPDATE CURRENT_TIMESTAMP(6),
  `fujian` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `recieve`(`reciever`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of send_mail
-- ----------------------------
INSERT INTO `send_mail` VALUES (2, 'wang', '何浩飞', '111111', '22222222', '2018-12-13 11:27:12.661406', ' ');
INSERT INTO `send_mail` VALUES (3, '何浩飞', 'wang', '11111111111', '1111', '2018-12-13 11:27:13.825863', ' ');
INSERT INTO `send_mail` VALUES (4, '何浩飞', '何浩飞', 'aaaaaaa', 'aaaaa', '2018-12-13 11:27:19.115542', ' ');
INSERT INTO `send_mail` VALUES (5, '何浩飞', '何浩飞', 'sss', 'sss', '2018-12-13 11:27:20.416860', ' ');
INSERT INTO `send_mail` VALUES (6, '何浩飞', '何浩飞', 'sss', 'sss', '2018-12-13 11:27:21.513997', ' ');
INSERT INTO `send_mail` VALUES (8, '何浩飞', '何浩飞', 'sdassa', 'ssss', '2018-12-17 18:16:23.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则2.png');
INSERT INTO `send_mail` VALUES (9, '何浩飞', '何浩飞', 'sadas', 'sadas', '2018-12-17 20:56:30.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则.png');
INSERT INTO `send_mail` VALUES (10, '何浩飞', '何浩飞', 'sdsd', 'sss', '2018-12-18 12:38:28.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则1.png');
INSERT INTO `send_mail` VALUES (11, '何浩飞', '何浩飞', 'sdsd', 'sss', '2018-12-18 12:38:49.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则1.png');
INSERT INTO `send_mail` VALUES (12, '何浩飞', '何浩飞', 'sdaas', 'sss', '2018-12-18 13:48:34.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则1.png');
INSERT INTO `send_mail` VALUES (13, '何浩飞', '何浩飞', 'sss', 'ssss', '2018-12-18 14:50:37.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则2.png');
INSERT INTO `send_mail` VALUES (14, '何浩飞', '何浩飞', 'sdasdas', 'sss', '2018-12-19 21:58:18.000000', 'C:\\Users\\Administrator\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\email\\\\WEB-INF\\upload\\正则.png');

SET FOREIGN_KEY_CHECKS = 1;
