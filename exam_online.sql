/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : exam_online

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 07/01/2023 18:23:20
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer`  (
  `answer_id` int NOT NULL AUTO_INCREMENT COMMENT '答案id',
  `stu_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `paper_id` int NOT NULL COMMENT '试卷id',
  `question_id` int NOT NULL COMMENT '题目id',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `score` int NULL DEFAULT NULL COMMENT '所得分数',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评语',
  `result_id` int NOT NULL COMMENT '结果ID',
  PRIMARY KEY (`answer_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  INDEX `paper_id`(`paper_id`) USING BTREE,
  INDEX `question_id`(`question_id`) USING BTREE,
  INDEX `fk_result_id`(`result_id`) USING BTREE,
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `answer_ibfk_4` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_result_id` FOREIGN KEY (`result_id`) REFERENCES `result` (`result_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES (1, '2020200', 7, 1, '123', 0, NULL, 1);
INSERT INTO `answer` VALUES (2, '2020200', 7, 2, 'A', 2, NULL, 1);
INSERT INTO `answer` VALUES (3, '2020200', 1, 1, '不会', 0, '答案不正确', 5);
INSERT INTO `answer` VALUES (4, '2020200', 1, 2, 'A', 0, '错误', 5);
INSERT INTO `answer` VALUES (5, '2020200', 1, 3, '错误', 1, '正确', 5);
INSERT INTO `answer` VALUES (6, '202013040505', 6, 4, 'A', NULL, NULL, 4);
INSERT INTO `answer` VALUES (7, '202013040505', 6, 5, '正确', NULL, NULL, 4);
INSERT INTO `answer` VALUES (8, '202013040505', 6, 6, '总线带宽', NULL, NULL, 4);
INSERT INTO `answer` VALUES (9, '202013040505', 6, 7, '不知道', NULL, NULL, 4);
INSERT INTO `answer` VALUES (10, '2020200', 7, 1, '不知道', 0, '', 6);
INSERT INTO `answer` VALUES (11, '2020200', 7, 2, 'A', 0, '', 6);
INSERT INTO `answer` VALUES (14, '2020200', 7, 1, 'bzd', 0, '答案不正确', 9);
INSERT INTO `answer` VALUES (15, '2020200', 7, 2, 'B', 2, 'Right', 9);
INSERT INTO `answer` VALUES (16, '2020200', 18, 10, '正确', 2, '', 10);
INSERT INTO `answer` VALUES (17, '2020200', 18, 11, 'D', 2, '', 10);
INSERT INTO `answer` VALUES (18, '2020200', 18, 14, 'B', 0, '', 10);
INSERT INTO `answer` VALUES (19, '2020200', 18, 16, '1', 0, '', 10);
INSERT INTO `answer` VALUES (20, '2020200', 18, 18, '1', 0, '', 10);
INSERT INTO `answer` VALUES (21, '2020200', 18, 20, '正确', 1, '', 10);
INSERT INTO `answer` VALUES (22, '2020200', 18, 22, '1', 0, '', 10);
INSERT INTO `answer` VALUES (23, '2020200', 18, 23, '1', 0, '', 10);

-- ----------------------------
-- Table structure for bank
-- ----------------------------
DROP TABLE IF EXISTS `bank`;
CREATE TABLE `bank`  (
  `bank_id` int NOT NULL AUTO_INCREMENT COMMENT '题库id',
  `bank_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题库名',
  `course_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  PRIMARY KEY (`bank_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bank
-- ----------------------------
INSERT INTO `bank` VALUES (1, '2022-2023数据库原理期末考试题库', 'C001');
INSERT INTO `bank` VALUES (3, '2022-2023操作系统原理期末考试', 'C002');
INSERT INTO `bank` VALUES (4, '计算机组成原理基本概念', 'C004');
INSERT INTO `bank` VALUES (6, '软件设计总题库', 'C006');
INSERT INTO `bank` VALUES (7, '软件设计期末题库', 'C006');
INSERT INTO `bank` VALUES (8, '软件设计期中题库', 'C006');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class`  (
  `class_id` int NOT NULL AUTO_INCREMENT COMMENT '班级id',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '班级名',
  `major_id` int NOT NULL COMMENT '专业id',
  PRIMARY KEY (`class_id`) USING BTREE,
  INDEX `major_id`(`major_id`) USING BTREE,
  CONSTRAINT `class_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES (1, '软件2001', 1);
INSERT INTO `class` VALUES (2, '软件2002', 1);
INSERT INTO `class` VALUES (4, '计科2001', 4);
INSERT INTO `class` VALUES (6, '软件2003', 1);
INSERT INTO `class` VALUES (7, '环工2001', 7);
INSERT INTO `class` VALUES (8, '化学2001', 10);
INSERT INTO `class` VALUES (9, '大数据2003', 2);
INSERT INTO `class` VALUES (10, '机械2001', 8);
INSERT INTO `class` VALUES (11, '人智2002', 3);
INSERT INTO `class` VALUES (12, '国贸2001', 12);
INSERT INTO `class` VALUES (13, '应数2001', 14);

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `course_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `course_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `major_id` int NOT NULL COMMENT '专业id',
  PRIMARY KEY (`course_id`) USING BTREE,
  INDEX `major_id`(`major_id`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`major_id`) REFERENCES `major` (`major_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('C001', '数据库原理及应用', 1);
INSERT INTO `course` VALUES ('C002', '操作系统原理', 1);
INSERT INTO `course` VALUES ('C003', '计算机图形学', 4);
INSERT INTO `course` VALUES ('C004', '计算机组成原理', 4);
INSERT INTO `course` VALUES ('C005', '数据结构', 1);
INSERT INTO `course` VALUES ('C006', '软件设计', 1);
INSERT INTO `course` VALUES ('C007', '软件测试', 1);
INSERT INTO `course` VALUES ('C008', '面向对象程序设计', 1);

-- ----------------------------
-- Table structure for course_teacher
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher`  (
  `course_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `tea_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师id',
  PRIMARY KEY (`course_id`, `tea_id`) USING BTREE,
  INDEX `tea_id`(`tea_id`) USING BTREE,
  CONSTRAINT `course_teacher_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `course_teacher_ibfk_2` FOREIGN KEY (`tea_id`) REFERENCES `teacher` (`tea_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES ('C001', 'T001');
INSERT INTO `course_teacher` VALUES ('C001', 'T002');
INSERT INTO `course_teacher` VALUES ('C002', 'T002');
INSERT INTO `course_teacher` VALUES ('C005', 'T003');
INSERT INTO `course_teacher` VALUES ('C006', 'T004');
INSERT INTO `course_teacher` VALUES ('C007', 'T005');
INSERT INTO `course_teacher` VALUES ('C008', 'T006');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dept_id` int NOT NULL AUTO_INCREMENT COMMENT '院系id',
  `dept_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '院系名',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, '人工智能与大数据学院');
INSERT INTO `department` VALUES (3, '信息科学与工程学院');
INSERT INTO `department` VALUES (5, '环境工程学院');
INSERT INTO `department` VALUES (6, '机电工程学院');
INSERT INTO `department` VALUES (7, '经济贸易学院');
INSERT INTO `department` VALUES (8, '外语学院');
INSERT INTO `department` VALUES (9, '化学化工学院');
INSERT INTO `department` VALUES (10, '理学院');

-- ----------------------------
-- Table structure for exam
-- ----------------------------
DROP TABLE IF EXISTS `exam`;
CREATE TABLE `exam`  (
  `exam_id` int NOT NULL AUTO_INCREMENT COMMENT '考试id',
  `exam_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '考试名',
  `paper_id` int NOT NULL COMMENT '试卷id',
  `course_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `start_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `duration` int NOT NULL COMMENT '考试时长',
  `state` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '考试状态',
  PRIMARY KEY (`exam_id`) USING BTREE,
  INDEX `paper_id`(`paper_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`paper_id`) REFERENCES `paper` (`paper_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `exam_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exam
-- ----------------------------
INSERT INTO `exam` VALUES (1, '数据库课堂测试一', 7, 'C001', '2023-01-04 01:00:00', '2023-01-04 12:00:00', 5, '已结束');
INSERT INTO `exam` VALUES (11, '计算机组成原理课堂测试一', 6, 'C004', '2023-01-04 02:21:30', '2023-01-05 05:58:53', 5, '已结束');
INSERT INTO `exam` VALUES (12, '数据库课堂测试补测', 1, 'C001', '2023-01-04 12:00:00', '2023-01-05 06:00:00', 5, '已结束');
INSERT INTO `exam` VALUES (13, '数据库课堂测试二', 7, 'C001', '2023-01-05 01:00:00', '2023-01-05 12:00:00', 5, '已结束');
INSERT INTO `exam` VALUES (17, '数据库测试试卷', 7, 'C001', '2023-01-06 07:19:58', '2023-01-07 07:19:59', 5, '已结束');
INSERT INTO `exam` VALUES (18, '软件设计小测试', 18, 'C006', '2023-01-06 08:36:32', '2023-01-07 08:36:34', 10, '已结束');
INSERT INTO `exam` VALUES (19, '数据库课堂测试三', 7, 'C001', '2023-01-04 09:22:34', '2023-01-05 09:22:36', 5, '已结束');

-- ----------------------------
-- Table structure for info
-- ----------------------------
DROP TABLE IF EXISTS `info`;
CREATE TABLE `info`  (
  `info_id` int NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `result_id` int NOT NULL COMMENT '考试id',
  `stu_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `info_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `info_time` datetime NOT NULL COMMENT '消息时间',
  `info_state` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息状态',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `result_id`(`result_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  CONSTRAINT `info_ibfk_1` FOREIGN KEY (`result_id`) REFERENCES `result` (`result_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `info_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of info
-- ----------------------------
INSERT INTO `info` VALUES (1, 5, '2020200', '成绩有误', '2023-01-04 23:48:40', '已处理');
INSERT INTO `info` VALUES (2, 10, '2020200', '成绩错误', '2023-01-06 20:49:57', '已拒绝');

-- ----------------------------
-- Table structure for major
-- ----------------------------
DROP TABLE IF EXISTS `major`;
CREATE TABLE `major`  (
  `major_id` int NOT NULL AUTO_INCREMENT COMMENT '专业id',
  `major_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专业名',
  `dept_id` int NOT NULL COMMENT '院系id',
  PRIMARY KEY (`major_id`) USING BTREE,
  INDEX `dept_id`(`dept_id`) USING BTREE,
  CONSTRAINT `major_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `department` (`dept_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of major
-- ----------------------------
INSERT INTO `major` VALUES (1, '软件工程', 1);
INSERT INTO `major` VALUES (2, '数据科学与大数据技术', 1);
INSERT INTO `major` VALUES (3, '人工智能', 1);
INSERT INTO `major` VALUES (4, '计算机科学与技术', 3);
INSERT INTO `major` VALUES (5, '电子信息工程', 3);
INSERT INTO `major` VALUES (7, '环境工程', 5);
INSERT INTO `major` VALUES (8, '机械类', 6);
INSERT INTO `major` VALUES (9, '车辆工程', 6);
INSERT INTO `major` VALUES (10, '化学', 9);
INSERT INTO `major` VALUES (11, '英语', 8);
INSERT INTO `major` VALUES (12, '国际贸易', 7);
INSERT INTO `major` VALUES (13, '应用统计学', 10);
INSERT INTO `major` VALUES (14, '应用数学', 10);

-- ----------------------------
-- Table structure for option
-- ----------------------------
DROP TABLE IF EXISTS `option`;
CREATE TABLE `option`  (
  `opt_id` int NOT NULL AUTO_INCREMENT COMMENT '选项id',
  `opt_a` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项A',
  `opt_b` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项B',
  `opt_c` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项C',
  `opt_d` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选项D',
  PRIMARY KEY (`opt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of option
-- ----------------------------
INSERT INTO `option` VALUES (1, '数据库存在计算机系统中', '数据库中的数据因为独立而没有联系', '数据结构化', '数据库以文件方式存储');
INSERT INTO `option` VALUES (2, '智能化', '交互式', '远程通信', '过程控制');
INSERT INTO `option` VALUES (3, '通过给出一个原型对象来指明所要创建的对象的类型,然后用复制这个原型对象的方法创建更多类型的对象。', '浅克隆仅仅复制所考虑的对象,而不复制它所引用的对象,也就是其中的成员对象并不复制。', '实现深克隆时通常需要编写较为复杂的代码。', '不需要为每一个类配备一个克隆方法,对于原型模式的扩展很灵活,对于已有类的改造也较为容易。');
INSERT INTO `option` VALUES (4, '操作系统中的树形目录结构', 'Windows中的应用程序快捷方式', 'JDBC中的数据库驱动程序', 'Java事件处理中的监听器接口');
INSERT INTO `option` VALUES (5, '里氏代换原则', '借口隔离原则', '单一职责原则', '开闭原则');
INSERT INTO `option` VALUES (6, '一个可以跨平台并支持多种格式的文件编辑器', '一个支持多数据源的报表生成工具，可以以不同图形方式显示报表信息', '一个可动态选择排序算法的数据操作工具', '一个支持多种编程语言的跨平台开发工具');
INSERT INTO `option` VALUES (7, '4', '5', '6', '7');

-- ----------------------------
-- Table structure for paper
-- ----------------------------
DROP TABLE IF EXISTS `paper`;
CREATE TABLE `paper`  (
  `paper_id` int NOT NULL AUTO_INCREMENT COMMENT '试卷id',
  `paper_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '试卷名',
  `course_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '试卷所包含试题id,以“,”隔开',
  `paper_score` int NOT NULL COMMENT '试卷分数',
  PRIMARY KEY (`paper_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `paper_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of paper
-- ----------------------------
INSERT INTO `paper` VALUES (1, '数据库基本概念练习题', 'C001', '1,2,3', 5);
INSERT INTO `paper` VALUES (6, '计算机组成原理基本概念习题一', 'C004', '4,5,6,7', 10);
INSERT INTO `paper` VALUES (7, '数据库测试试卷', 'C001', '1,2', 4);
INSERT INTO `paper` VALUES (13, '数据库小测试', 'C001', '2,1,,', 4);
INSERT INTO `paper` VALUES (18, '软件设计小测试', 'C006', '14,11,16,18,10,20,23,22,', 21);
INSERT INTO `paper` VALUES (21, '软件设计期中', 'C006', '10,11,12,13', 8);
INSERT INTO `paper` VALUES (22, '软件设计1', 'C006', '14,13,15,17,19,20,23,24,', 20);

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point`  (
  `point_id` int NOT NULL AUTO_INCREMENT COMMENT '知识点id',
  `point_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '知识点名',
  `course_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程id',
  PRIMARY KEY (`point_id`) USING BTREE,
  INDEX `course_id`(`course_id`) USING BTREE,
  CONSTRAINT `point_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES (1, '关系代数的应用', 'C001');
INSERT INTO `point` VALUES (2, '数据库基本概念', 'C001');
INSERT INTO `point` VALUES (3, '进程', 'C002');
INSERT INTO `point` VALUES (5, '计算机组成原理的基本概念', 'C004');
INSERT INTO `point` VALUES (7, '软件设计基本概念', 'C006');
INSERT INTO `point` VALUES (8, '软件测试基本方法', 'C007');
INSERT INTO `point` VALUES (9, '图', 'C005');
INSERT INTO `point` VALUES (10, '中央处理器', 'C004');
INSERT INTO `point` VALUES (11, '开闭原则', 'C006');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `question_id` int NOT NULL AUTO_INCREMENT COMMENT '题目id',
  `question_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目名',
  `question_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '题目类型',
  `opt` int NULL DEFAULT NULL COMMENT '选项对应ID',
  `question_answer` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '答案',
  `question_score` int NOT NULL COMMENT '分数',
  `point_id` int NULL DEFAULT 0 COMMENT '知识点id',
  `bank_id` int NOT NULL COMMENT '题库id',
  PRIMARY KEY (`question_id`) USING BTREE,
  INDEX `point_id`(`point_id`) USING BTREE,
  INDEX `bank_id`(`bank_id`) USING BTREE,
  INDEX `opt`(`opt`) USING BTREE,
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`point_id`) REFERENCES `point` (`point_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `question_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `bank` (`bank_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `question_ibfk_3` FOREIGN KEY (`opt`) REFERENCES `option` (`opt_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (1, '关系代数是指', '填空题', NULL, '一种抽象的查询语言，用对关系的运算来表达查询，作为研究关系数据语言的数学工具', 2, 1, 1);
INSERT INTO `question` VALUES (2, '下列关于数据库的说法不正确的是', '选择题', 1, 'B', 2, 2, 1);
INSERT INTO `question` VALUES (3, '数据库存在于计算机系统之外', '判断题', NULL, '错误', 1, 2, 1);
INSERT INTO `question` VALUES (4, '带有处理器的设备一般称为', '选择题', 2, 'A', 2, 5, 4);
INSERT INTO `question` VALUES (5, '多操作数指令可以是单字长指令', '判断题', NULL, '正确', 1, 5, 4);
INSERT INTO `question` VALUES (6, '衡量总线性能最重要的指标是', '填空题', NULL, '总线带宽', 2, 5, 4);
INSERT INTO `question` VALUES (7, '什么是总线带宽', '简答题', NULL, '总线的带宽指的是这条总线在单位时间内可以传输的数据总量，它等于总线位宽与工作频率的乘积。', 5, 5, 4);
INSERT INTO `question` VALUES (8, '关系代数是数据库的重要概念', '判断题', NULL, '正确', 1, 1, 1);
INSERT INTO `question` VALUES (10, '软件设计很重要', '判断题', NULL, '正确', 2, 7, 6);
INSERT INTO `question` VALUES (11, '关于原型模式叙述错误的是()。', '选择题', 3, 'D', 2, 7, 6);
INSERT INTO `question` VALUES (12, '（）是适配器模式的应用实例。', '选择题', 4, 'C', 2, 7, 6);
INSERT INTO `question` VALUES (13, '某系统通过使用配置文件，可以在不修改源代码的情况下更换数据库驱动程序，该系统满足', '选择题', 5, 'D', 2, 11, 6);
INSERT INTO `question` VALUES (14, '()不是桥接模式所适用的场景。', '选择题', 6, 'C', 2, 7, 6);
INSERT INTO `question` VALUES (15, '设计模式一般包含模式名称、问题、目的、解决方案和____', '填空题', NULL, '效果', 2, 7, 6);
INSERT INTO `question` VALUES (16, '状态模式的关键是引入了一个(___)来专门表示对象的状态,这个类我们叫做抽象状态类。', '填空题', NULL, '抽象类', 2, 7, 6);
INSERT INTO `question` VALUES (17, 'GOF总结出23个设计模式,其中有___个模式是结构型模式。', '填空题', NULL, '7', 2, 7, 6);
INSERT INTO `question` VALUES (18, '行为模式是对在不同的对象之间划分(____)和(___)抽象化。', '填空题', NULL, '责任;算法', 2, 7, 6);
INSERT INTO `question` VALUES (19, 'GOF根据模式的目标将模式分为三个类目:创建型、行为型和结构型。', '判断题', NULL, '正确', 1, 7, 6);
INSERT INTO `question` VALUES (20, '组合模式让客户端可以统—对待单个对象和组合对象。', '判断题', NULL, '正确', 1, 7, 6);
INSERT INTO `question` VALUES (21, '经常要访问一个聚合对象中的各个元素,如“数据结构”中的链表遍历,一般用迭代器模式', '判断题', NULL, '正确', 1, 7, 6);
INSERT INTO `question` VALUES (22, '简要回答设计模式定义及包含要素?(5分)', '简答题', NULL, '设计模式是一套被反复使用、多数人知晓的、经过分类编码的、代码设计的经验总结，使用设计模式是为了可重用代码，让代码更容易被他人理解、保证代码可靠性。(3分)\n设计模式包含要素为:模式名称、问题描述、解决方案和效果。（2分)', 5, 7, 6);
INSERT INTO `question` VALUES (23, '对面向对象的合成复用原则进行分析?(5分)', '简答题', NULL, '尽量使用对象组合，而不是继承来达到复用的目的。(3分）合成复用原则就是在一个新的对象里通过关联关系（包括组合关系和聚合关系）来使用一些已有的对象，使之成为新对象的一部分，新对象通过委派调用已有对象的方法达到复用功能的目的。（2分)', 5, 7, 6);
INSERT INTO `question` VALUES (24, '简要回答设计模式定义及包含要素?(5分)', '简答题', NULL, '设计模式是一套被反复使用、多数人知晓的、经过分类编码的、代码设计的经验总结，使用设计模式是为了可重用代码，让代码更容易被他人理解、保证代码可靠性。(3分)\n设计模式包含要素为:模式名称、问题描述、解决方案和效果。（2分)', 5, 7, 6);
INSERT INTO `question` VALUES (25, '软件设计很重要', '判断题', NULL, '正确', 2, 7, 7);
INSERT INTO `question` VALUES (26, '软件设计是什么时候开设的课程', '选择题', 7, 'B', 1, 7, 8);

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS `result`;
CREATE TABLE `result`  (
  `result_id` int NOT NULL AUTO_INCREMENT COMMENT '结果id',
  `exam_id` int NOT NULL COMMENT '考试id',
  `stu_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生id',
  `score` int NOT NULL COMMENT '分数',
  `stage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '该条答案所处阶段(未测评，待评分，已评分)',
  PRIMARY KEY (`result_id`) USING BTREE,
  INDEX `exam_id`(`exam_id`) USING BTREE,
  INDEX `stu_id`(`stu_id`) USING BTREE,
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`exam_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`stu_id`) REFERENCES `student` (`stu_no`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO `result` VALUES (1, 1, '2020200', 2, '已评分');
INSERT INTO `result` VALUES (4, 11, '202013040505', -1, '已结束');
INSERT INTO `result` VALUES (5, 12, '2020200', 1, '已评分');
INSERT INTO `result` VALUES (6, 13, '2020200', 0, '已评分');
INSERT INTO `result` VALUES (9, 17, '2020200', 2, '已评分');
INSERT INTO `result` VALUES (10, 18, '2020200', 5, '已评分');
INSERT INTO `result` VALUES (11, 19, '2020200', -1, '未参与');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `role_name` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '管理员');
INSERT INTO `role` VALUES (2, '学生');
INSERT INTO `role` VALUES (3, '教师');

-- ----------------------------
-- Table structure for role_user
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user`  (
  `role_id` int NOT NULL COMMENT '角色id',
  `user_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES (2, '201715010720');
INSERT INTO `role_user` VALUES (2, '201913010309');
INSERT INTO `role_user` VALUES (2, '202012020323');
INSERT INTO `role_user` VALUES (2, '202013040505');
INSERT INTO `role_user` VALUES (2, '202014020805');
INSERT INTO `role_user` VALUES (2, '202016');
INSERT INTO `role_user` VALUES (2, '202016040101');
INSERT INTO `role_user` VALUES (2, '202016040202');
INSERT INTO `role_user` VALUES (2, '202016040203');
INSERT INTO `role_user` VALUES (2, '202016040204');
INSERT INTO `role_user` VALUES (2, '202016040216');
INSERT INTO `role_user` VALUES (2, '202016040217');
INSERT INTO `role_user` VALUES (2, '2020200');
INSERT INTO `role_user` VALUES (2, '2020201');
INSERT INTO `role_user` VALUES (1, 'admin');
INSERT INTO `role_user` VALUES (3, 'J101');
INSERT INTO `role_user` VALUES (3, 'T001');
INSERT INTO `role_user` VALUES (3, 'T002');
INSERT INTO `role_user` VALUES (3, 'T003');
INSERT INTO `role_user` VALUES (3, 'T004');
INSERT INTO `role_user` VALUES (3, 'T005');
INSERT INTO `role_user` VALUES (3, 'T006');
INSERT INTO `role_user` VALUES (3, 'T007');
INSERT INTO `role_user` VALUES (3, 'T008');
INSERT INTO `role_user` VALUES (3, 'T009');
INSERT INTO `role_user` VALUES (3, 'T010');
INSERT INTO `role_user` VALUES (3, 'T011');
INSERT INTO `role_user` VALUES (3, 'T012');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `stu_id` int NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `stu_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `stu_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学生姓名',
  `class_id` int NULL DEFAULT NULL COMMENT '班级id',
  PRIMARY KEY (`stu_id`) USING BTREE,
  INDEX `stu_no`(`stu_no`) USING BTREE,
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`stu_no`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '2020200', '李元昊', 2);
INSERT INTO `student` VALUES (3, '202013040505', '童超', 4);
INSERT INTO `student` VALUES (5, '202016040101', '黎铭杰', 2);
INSERT INTO `student` VALUES (6, '202016040202', '刘忠昊', 2);
INSERT INTO `student` VALUES (7, '202016040217', '褚冬冬', 2);
INSERT INTO `student` VALUES (8, '201715010720', '王天恒', 2);
INSERT INTO `student` VALUES (9, '202016040204', '贾文聪', 2);
INSERT INTO `student` VALUES (10, '202016040216', '赵克一', 2);
INSERT INTO `student` VALUES (11, '201913010309', '褚良达', 2);
INSERT INTO `student` VALUES (12, '202012020323', '董梦情', 1);
INSERT INTO `student` VALUES (13, '202014020805', '李冉', 2);
INSERT INTO `student` VALUES (14, '202016040203', '谢瑞东', 2);
INSERT INTO `student` VALUES (15, '2020201', '王继博', 2);
INSERT INTO `student` VALUES (16, '202016', '李四', 1);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `tea_id` int NOT NULL AUTO_INCREMENT COMMENT '教师id',
  `tea_no` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师工号',
  `tea_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '教师姓名',
  `major_id` int NOT NULL COMMENT '专业id',
  PRIMARY KEY (`tea_id`) USING BTREE,
  INDEX `tea_no`(`tea_no`) USING BTREE,
  CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`tea_no`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES (1, 'T001', '苏小玲', 1);
INSERT INTO `teacher` VALUES (2, 'T002', '刘於勋', 1);
INSERT INTO `teacher` VALUES (4, 'T003', '谭玉波', 1);
INSERT INTO `teacher` VALUES (5, 'T004', '段爱玲', 1);
INSERT INTO `teacher` VALUES (6, 'T005', '王雪涛', 1);
INSERT INTO `teacher` VALUES (7, 'T006', '马丁', 1);
INSERT INTO `teacher` VALUES (8, 'T007', '赵玉娟', 1);
INSERT INTO `teacher` VALUES (9, 'T008', '费选', 1);
INSERT INTO `teacher` VALUES (10, 'T009', '韩萍', 1);
INSERT INTO `teacher` VALUES (11, 'T010', '程立', 1);
INSERT INTO `teacher` VALUES (12, 'T011', '郑丽萍', 1);
INSERT INTO `teacher` VALUES (13, 'T012', '陈亮', 1);
INSERT INTO `teacher` VALUES (14, 'J101', '闫娟', 4);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `password` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `salt` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '盐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('201715010720', '4cb69868fdf07a54f761e18e92336821', 'wth@haut.edu.cn', 'oVineZz4oEhY7Vc8cuyaqg==');
INSERT INTO `user` VALUES ('201913010309', '8bbbc3c9abd689227f671105f2576ecb', 'cld@haut.edu.cn', '6VYjB8RWxY7WJ4uJ5jDo0w==');
INSERT INTO `user` VALUES ('202012020323', '98b9978c4c00a87356261fc7d7e7e623', 'dmq@haut.edu.cn', 'LisVsRyfgFA7L6R18c3wCA==');
INSERT INTO `user` VALUES ('202013040505', '937c6486a3fcc4590745c215be5310f5', 'tctc@qq.com', '0rO5fJ3I6in3zUwYZn3ZYg==');
INSERT INTO `user` VALUES ('202014020805', '09cce92be5410efad22edfe153c9339d', 'lr@haut.edu.cn', '9GJbmFyWMTdadt+rghHQSQ==');
INSERT INTO `user` VALUES ('202016', 'ac2874411572f4430e57154a557aa2b2', NULL, 'mA/TTow19lNTUvR9iVtQCg==');
INSERT INTO `user` VALUES ('202016040101', '0e4e58da99cd3f6a659bcfa037ee465d', 'lmj@haut.edu.cn', '+J1fOQrnVcPMAYprCOuZtQ==');
INSERT INTO `user` VALUES ('202016040202', '90f0dce5131b418d701a172796a894c1', 'lzh@haut.edu.cn', 'FYi2T8rfEixi/OUTp9Tk4Q==');
INSERT INTO `user` VALUES ('202016040203', '58ad34927ebe499c49ff65a3b9aa526c', 'xrd@haut.edu.cn', 'kImMtXkbBDWW929MQeiyBg==');
INSERT INTO `user` VALUES ('202016040204', '7977a1ddfbbdecafe7072242eb7a7c05', 'jwc@haut.edu.cn', 'wQHbyhGPiXJ5wsV0sPcV5w==');
INSERT INTO `user` VALUES ('202016040216', 'e9697d30dc41da831917180d9cf09a70', 'zky@haut.edu.cn', '4H23a0trjujrTjatopVb5g==');
INSERT INTO `user` VALUES ('202016040217', '24be0ac59c3c7a923690799720f284f4', 'cdd@haut.edu.cn', 'a94bhEjc4NSHI2Lic7g8UQ==');
INSERT INTO `user` VALUES ('2020200', 'bebd3059df937ec19a7e5f532bf53489', 'liyuanhaovip@163.com', 'XnkMwCW4UjElvGNbfvw4iQ==');
INSERT INTO `user` VALUES ('2020201', 'fbd15fe62930fabb43913a445e85f209', '1612702983@qq.com', 'uwojHZtJ97xRnqtMFChK7g==');
INSERT INTO `user` VALUES ('admin', '8947c442925353e24560647716722483', 'admin@qq.com', '7qXNseuYAk3nyw70mbmdfg==');
INSERT INTO `user` VALUES ('J101', '0e6a610da697f8dba144ff4402f70f0d', 'yj@163.com', 'Gde3A5XgxmedSKWiP1wqqg==');
INSERT INTO `user` VALUES ('T001', 'bebd3059df937ec19a7e5f532bf53489', 'T001@163.com', 'XnkMwCW4UjElvGNbfvw4iQ==');
INSERT INTO `user` VALUES ('T002', 'bebd3059df937ec19a7e5f532bf53489', 'T002@163.com', 'XnkMwCW4UjElvGNbfvw4iQ==');
INSERT INTO `user` VALUES ('T003', '28b8a81796920285e2237231790eb2ec', 'tanyubo@163.com', 'DTTpu9ljnE1oYwgns26QgQ==');
INSERT INTO `user` VALUES ('T004', '6dc3f4e0ea0160edb479e75343ad60e1', 'duanailing@163.com', '/1eyLykfhfxlQ/AIFATT/Q==');
INSERT INTO `user` VALUES ('T005', '41788aef5301e174b1cc7322ccd0c430', 't5@haut.edu.cn', 'ifNmi4RtBKek/MxToPdKng==');
INSERT INTO `user` VALUES ('T006', 'd04391576fdbe22ac570b623287049ac', 't6@haut.edu.cn', 'rOp2ThZcLbExY/TxuM0Ljw==');
INSERT INTO `user` VALUES ('T007', '3909ddfae83c85345f45a483faf0b419', 't7@haut.edu.cn', '9fRrJF2O4VNDLOzw5ZoP6A==');
INSERT INTO `user` VALUES ('T008', 'ba47230d1a239382d7aa62469c6848ef', 't8@haut.edu.cn', 'WCdjcNnBhzZ6j0o5hGi/Jw==');
INSERT INTO `user` VALUES ('T009', '8487a3f96e55f5d679c44bb1c452b254', 't9@haut.edu.cn', 'A0RWlZcwl5TKU12Si2tvow==');
INSERT INTO `user` VALUES ('T010', '85a66e75e7380dea06f928f8a4053ed8', 't10@haut.edu.cn', 'KplHDzUODkBuzI0/qIi9Rw==');
INSERT INTO `user` VALUES ('T011', 'cb03f8602ba20f9899febf2db51f936d', 't11@haut.edu.cn', '466SwhXzSX56A1a5CJ7sYQ==');
INSERT INTO `user` VALUES ('T012', '1e29c0df1b2adde33d68ed65b11ebc59', 't12@haut.edu.cn', '/cuwIgJqCZzfi/SRIn8YLA==');

-- ----------------------------
-- View structure for bank_point
-- ----------------------------
DROP VIEW IF EXISTS `bank_point`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `bank_point` AS select `point`.`point_id` AS `point_id`,`point`.`point_name` AS `point_name`,`bank`.`bank_id` AS `bank_id` from (`point` join `bank`) where (`point`.`course_id` = `bank`.`course_id`);

-- ----------------------------
-- View structure for exam_score
-- ----------------------------
DROP VIEW IF EXISTS `exam_score`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `exam_score` AS select `exam`.`exam_id` AS `exam_id`,`exam`.`exam_name` AS `exam_name`,max(`result`.`score`) AS `max_score`,min(`result`.`score`) AS `min_score`,avg(`result`.`score`) AS `avg_score` from (`result` join `exam`) where ((`result`.`score` > 0) and (`result`.`exam_id` = `exam`.`exam_id`)) group by `exam`.`exam_id`;

-- ----------------------------
-- View structure for paper_result_answer
-- ----------------------------
DROP VIEW IF EXISTS `paper_result_answer`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `paper_result_answer` AS select `result`.`result_id` AS `result_id`,`paper`.`paper_id` AS `paper_id`,`question`.`question_id` AS `question_id`,`answer`.`content` AS `content`,`question`.`question_answer` AS `question_answer` from (((`result` join `answer`) join `paper`) join `question`) where ((`result`.`result_id` = `answer`.`result_id`) and (`answer`.`paper_id` = `paper`.`paper_id`) and (`answer`.`question_id` = `question`.`question_id`) and (`answer`.`result_id` = `result`.`result_id`));

-- ----------------------------
-- View structure for stu_course
-- ----------------------------
DROP VIEW IF EXISTS `stu_course`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `stu_course` AS select `student`.`stu_no` AS `stu_no`,`course`.`course_id` AS `course_id` from (`student` join `course`) where `student`.`class_id` in (select `class`.`class_id` from `class` where (`class`.`major_id` = `course`.`major_id`));

-- ----------------------------
-- Procedure structure for add_single
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_single`;
delimiter ;;
CREATE PROCEDURE `add_single`(qName varchar(100), qType varchar(20), qAnswer varchar(500), qScore int, pID int, bID int, opta varchar(500), optb varchar(500), optc varchar(500), optd varchar(500))
begin
    insert into `option`(opt_a, opt_b, opt_c, opt_d) VALUES (opta, optb, optc, optd);
    set @optid = (select opt_id from `option` order by opt_id desc limit 1);
    insert into question(question_name, question_type, opt, question_answer, question_score, point_id, bank_id) VALUES (qName, qType, @optid, qAnswer, qScore, pID, bID);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for add_student
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_student`;
delimiter ;;
CREATE PROCEDURE `add_student`(no varchar(30), pwd varchar(200), name varchar(10), sa varchar(100), classid int)
begin
    insert into user(id, password, salt) VALUES (no, pwd, sa);
    insert into role_user(role_id, user_id) VALUES (2, no);
    insert into student(stu_no, stu_name, class_id) VALUES (no, name, classid);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for add_teacher
-- ----------------------------
DROP PROCEDURE IF EXISTS `add_teacher`;
delimiter ;;
CREATE PROCEDURE `add_teacher`(no varchar(30), pwd varchar(200), name varchar(10), sa varchar(100), majorid int)
begin
    insert into user(id, password, salt) VALUES (no, pwd, sa);
    insert into role_user(role_id, user_id) VALUES (3, no);
    insert into teacher(tea_no, tea_name, major_id) VALUES (no, name, majorid);
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for auto_paper
-- ----------------------------
DROP PROCEDURE IF EXISTS `auto_paper`;
delimiter ;;
CREATE PROCEDURE `auto_paper`(courseID varchar(20),
    bankID int,
    pName varchar(100),
    singleNum int,
    fillNum int,
    judgeNum int,
    shortNum int)
begin
    set autocommit = 0;
    insert into paper(paper_name, course_id, paper_score) VALUES (pName, courseID, -1);
    set @paperID = (select paper_id from paper order by paper_id desc limit 1);
    set @singleNum = singleNum;
    set @fillNum = fillNum;
    set @judgeNum = judgeNum;
    set @shortNum = shortNum;
    set @singleID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '选择题' and bank_id = bankID
                 order by rand()
                 limit singleNum
             ) t
    );
    set @fillID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '填空题' and bank_id = bankID
                 order by rand()
                 limit fillNum
             ) t
    );
    set @judgeID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '判断题' and bank_id = bankID
                 order by rand()
                 limit judgeNum
             ) t
    );
    set @shortID = (
        select GROUP_CONCAT(question_id SEPARATOR ',') as question_ids
        from (
                 select question_id
                 from question
                 where question_type = '简答题' and bank_id = bankID
                 order by rand()
                 limit shortNum
             ) t
    );
    set @AllContent = concat(
            ifnull(@singleID, ''),
            if(@singleID = '', '', ','),
            ifnull(@fillID, ''),
            if(@fillID = '', '', ','),
            ifnull(@judgeID, ''),
            if(@judgeID = '', '', ','),
            ifnull(@shortID, ''),
            if(@shortID = '', '', ',')
        );
    set @AllScore = (select sum(question_score) from question where find_in_set(question_id, @AllContent)>0);
    update paper set content = @AllContent, paper_score = @AllScore where paper_id = @paperID;
    get diagnostics condition 1
        @error_code = RETURNED_SQLSTATE,
        @error_message = MESSAGE_TEXT;
    if @error_code is not null then
        rollback;
    else
        commit;
    end if;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_exam
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_exam`;
delimiter ;;
CREATE PROCEDURE `update_exam`()
begin
    update exam set state = '进行中' where start_time <= now() and end_time >= now();
    update exam set state = '已结束' where end_time < now();
    update exam set state = '未开始' where start_time > now();
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_result
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_result`;
delimiter ;;
CREATE PROCEDURE `update_result`()
begin
    update result set stage = '未参与' where exam_id in (select exam_id from exam where end_time < now()) and stage = '待考试';
    update result set stage = '待考试' where exam_id in (select exam_id from exam where start_time > now());
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_score
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_score`;
delimiter ;;
CREATE PROCEDURE `update_score`(rID int)
begin
    set @score = (select sum(answer.score) from answer where result_id = rID);
    update result set score = @score where result_id = rID;
    update result set stage = '已评分' where result_id = rID;
end
;;
delimiter ;

-- ----------------------------
-- Procedure structure for update_single
-- ----------------------------
DROP PROCEDURE IF EXISTS `update_single`;
delimiter ;;
CREATE PROCEDURE `update_single`(qID int, qName varchar(100), qType varchar(20), opt int, qAnswer varchar(500), qScore int, pID int, bID int, opta varchar(500), optb varchar(500), optc varchar(500), optd varchar(500))
begin
    update `option` set opt_a = opta, opt_b = optb, opt_c = optc, opt_d = optd where opt_id = opt;
    update question set question_name = qName, question_type = qType, question_answer = qAnswer, question_score = qScore, point_id = pID, bank_id = bID where question_id = qID;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table bank
-- ----------------------------
DROP TRIGGER IF EXISTS `bank_delete`;
delimiter ;;
CREATE TRIGGER `bank_delete` BEFORE DELETE ON `bank` FOR EACH ROW begin
        delete from question where bank_id = old.bank_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table class
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_class`;
delimiter ;;
CREATE TRIGGER `delete_class` BEFORE DELETE ON `class` FOR EACH ROW begin
    delete from student where class_id = old.class_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table course
-- ----------------------------
DROP TRIGGER IF EXISTS `course_teacher_delete`;
delimiter ;;
CREATE TRIGGER `course_teacher_delete` BEFORE DELETE ON `course` FOR EACH ROW begin
        delete from course_teacher where course_id = old.course_id;
        delete from bank where course_id = old.course_id;
        delete from point where course_id = old.course_id;
        delete from paper where course_id = old.course_id;
        delete from exam where course_id = old.course_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table department
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_dept`;
delimiter ;;
CREATE TRIGGER `delete_dept` BEFORE DELETE ON `department` FOR EACH ROW begin
    delete from major where dept_id = old.dept_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table exam
-- ----------------------------
DROP TRIGGER IF EXISTS `exam_insert`;
delimiter ;;
CREATE TRIGGER `exam_insert` BEFORE INSERT ON `exam` FOR EACH ROW begin
        if new.end_time < now() then
            set new.state = '已结束';
        elseif new.start_time > now() then
            set new.state = '未开始';
        else
            set new.state = '进行中';
        end if;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table exam
-- ----------------------------
DROP TRIGGER IF EXISTS `exam_delete`;
delimiter ;;
CREATE TRIGGER `exam_delete` BEFORE DELETE ON `exam` FOR EACH ROW begin
        delete from result where exam_id = old.exam_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table major
-- ----------------------------
DROP TRIGGER IF EXISTS `delete_major`;
delimiter ;;
CREATE TRIGGER `delete_major` BEFORE DELETE ON `major` FOR EACH ROW begin
    delete from class where major_id = old.major_id;
    delete from course where major_id = old.major_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table paper
-- ----------------------------
DROP TRIGGER IF EXISTS `paper_delete`;
delimiter ;;
CREATE TRIGGER `paper_delete` BEFORE DELETE ON `paper` FOR EACH ROW begin
        delete from exam where paper_id = old.paper_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table question
-- ----------------------------
DROP TRIGGER IF EXISTS `question_delete`;
delimiter ;;
CREATE TRIGGER `question_delete` AFTER DELETE ON `question` FOR EACH ROW begin
        delete from `option` where opt_id = old.opt;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table result
-- ----------------------------
DROP TRIGGER IF EXISTS `result_delete`;
delimiter ;;
CREATE TRIGGER `result_delete` BEFORE DELETE ON `result` FOR EACH ROW begin
        delete from info where result_id = old.result_id;
        delete from answer where result_id = old.result_id;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
DROP TRIGGER IF EXISTS `student_delete`;
delimiter ;;
CREATE TRIGGER `student_delete` AFTER DELETE ON `student` FOR EACH ROW begin
        delete from role_user where user_id = old.stu_no;
        delete from user where id = old.stu_no;
    end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table teacher
-- ----------------------------
DROP TRIGGER IF EXISTS `teacher_delete`;
delimiter ;;
CREATE TRIGGER `teacher_delete` AFTER DELETE ON `teacher` FOR EACH ROW begin
        delete from role_user where user_id = old.tea_no;
        delete from user where id = old.tea_no;
    end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
