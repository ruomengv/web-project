/*
 Navicat MySQL Dump SQL

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80013 (8.0.13)
 Source Host           : localhost:3306
 Source Schema         : web

 Target Server Type    : MySQL
 Target Server Version : 80013 (8.0.13)
 File Encoding         : 65001

 Date: 21/06/2025 13:41:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '企业ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业名称',
  `contact` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '联系方式',
  `license` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '营业执照',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '企业表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (1, '腾讯科技', 'contact@tencent.com', 'LICENSE-12345');
INSERT INTO `company` VALUES (2, '阿里巴巴', 'contact@alibaba.com', 'LICENSE-67890');
INSERT INTO `company` VALUES (3, '百度集团', 'contact@baidu.com', 'LICENSE-98765');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '课程ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '摘要',
  `sort` int(11) NULL DEFAULT 0 COMMENT '排序',
  `video_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频地址',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态(0-待审核 1-已发布 2-驳回)',
  `reject_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '驳回原因',
  `creator_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_creator`(`creator_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  FULLTEXT INDEX `ft_title`(`title`),
  CONSTRAINT `fk_course_user` FOREIGN KEY (`creator_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 'Spring Boot实战', 'course1.jpg', 'Spring Boot开发教程', 1, 'video1.mp4', '王老师', 1, NULL, 2, '0000-00-00 10:00:00', NULL);
INSERT INTO `course` VALUES (2, 'MySQL优化技巧', 'course2.jpg', '数据库性能优化', 2, 'video2.mp4', '张老师', 0, NULL, 3, '0000-00-00 11:00:00', NULL);
INSERT INTO `course` VALUES (3, 'Java多线程编程', 'course3.jpg', '并发编程实践', 3, 'video3.mp4', '李老师', 2, '内容不完整', 4, '0000-00-00 12:00:00', NULL);
INSERT INTO `course` VALUES (4, '前端框架Vue3', 'course4.jpg', 'Vue3实战开发', 4, 'video4.mp4', '陈老师', 1, NULL, 2, '0000-00-00 13:00:00', NULL);

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标题',
  `cover` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '封面图',
  `summary` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '内容',
  `author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `status` tinyint(4) NULL DEFAULT 0 COMMENT '状态(0-待审核 1-已发布 2-驳回)',
  `reject_reason` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '驳回原因',
  `creator_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_creator`(`creator_id` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  FULLTEXT INDEX `ft_content`(`title`, `summary`, `content`),
  CONSTRAINT `fk_news_user` FOREIGN KEY (`creator_id`) REFERENCES `user` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '动态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '腾讯发布新产品', 'news1.jpg', '腾讯云新产品发布', '腾讯云发布新一代AI计算平台...', '腾讯新闻', 1, NULL, 2, '0000-00-00 09:00:00', NULL);
INSERT INTO `news` VALUES (2, '阿里巴巴双11活动', 'news2.jpg', '双11购物节', '阿里公布双11促销计划...', '阿里官方', 0, NULL, 3, '0000-00-00 10:00:00', NULL);
INSERT INTO `news` VALUES (3, '百度AI大会', 'news3.jpg', '人工智能峰会', '百度举办AI开发者大会...', '百度公关', 2, '内容需审核', 4, '0000-00-00 11:00:00', NULL);
INSERT INTO `news` VALUES (4, '开源技术分享', 'news4.jpg', '技术社区活动', '本周六举办开源技术沙龙...', '技术社区', 1, NULL, 5, '0000-00-00 12:00:00', NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `telephone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `gender` tinyint(4) NULL DEFAULT 0 COMMENT '性别(0-未知 1-男 2-女)',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态(0-禁用 1-启用)',
  `role` tinyint(4) NOT NULL COMMENT '角色(0-超级管理员 1-企业用户)',
  `company_id` bigint(20) NULL DEFAULT NULL COMMENT '企业ID',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username` ASC) USING BTREE,
  INDEX `idx_company`(`company_id` ASC) USING BTREE,
  CONSTRAINT `fk_user_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '123456', '系统管理员', '13800000000', 'admin@example.com', 0, 1, 0, NULL, '0000-00-00 00:00:00', NULL);
INSERT INTO `user` VALUES (2, 'tencent_user', 'pass123', '腾讯员工', '13911112222', 'user1@tencent.com', 1, 1, 1, 1, '0000-00-00 00:00:00', NULL);
INSERT INTO `user` VALUES (3, 'alibaba_user', 'pass456', '阿里员工', '13733334444', 'user2@alibaba.com', 2, 1, 1, 2, '0000-00-00 00:00:00', NULL);
INSERT INTO `user` VALUES (4, 'baidu_user', 'pass789', '百度员工', '13655556666', 'user3@baidu.com', 1, 1, 1, 3, '0000-00-00 00:00:00', NULL);
INSERT INTO `user` VALUES (5, 'test_user', 'testpass', '测试用户', '13577778888', 'test@example.com', 0, 1, 1, NULL, '0000-00-00 00:00:00', NULL);

SET FOREIGN_KEY_CHECKS = 1;
