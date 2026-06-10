/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : localhost:3306
 Source Schema         : chronic-disease-analysis

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : 65001

 Date: 04/06/2026 22:15:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_chronic_disease_data
-- ----------------------------
DROP TABLE IF EXISTS `t_chronic_disease_data`;
CREATE TABLE `t_chronic_disease_data`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_id` bigint(20) NOT NULL COMMENT '地区ID',
  `time_id` bigint(20) NOT NULL COMMENT '时间ID',
  `disease_id` bigint(20) NOT NULL COMMENT '疾病ID',
  `population_id` bigint(20) NOT NULL COMMENT '人群ID',
  `prevalence_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '患病率(%)',
  `incidence_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '发病率(%)',
  `mortality_rate` decimal(10, 4) NULL DEFAULT NULL COMMENT '死亡率(%)',
  `sample_size` int(11) NULL DEFAULT NULL COMMENT '样本量',
  `data_source` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '数据来源',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_region_id`(`region_id` ASC) USING BTREE,
  INDEX `idx_time_id`(`time_id` ASC) USING BTREE,
  INDEX `idx_disease_id`(`disease_id` ASC) USING BTREE,
  INDEX `idx_population_id`(`population_id` ASC) USING BTREE,
  INDEX `idx_composite`(`region_id` ASC, `time_id` ASC, `disease_id` ASC, `population_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '慢性病数据事实表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_chronic_disease_data
-- ----------------------------
INSERT INTO `t_chronic_disease_data` VALUES (1, 1, 1, 1, 1, 27.5000, 5.8000, 1.2000, 8500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (2, 1, 1, 1, 2, 22.3000, 4.5000, 0.8000, 6200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (3, 1, 1, 1, 3, 31.2000, 7.2000, 1.8000, 7800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (4, 1, 1, 1, 4, 38.6000, 8.5000, 2.5000, 9200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (5, 1, 1, 1, 5, 45.2000, 9.8000, 3.8000, 5600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (6, 1, 1, 2, 1, 8.5000, 2.1000, 0.3000, 8500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (7, 1, 1, 2, 2, 6.2000, 1.5000, 0.2000, 6200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (8, 1, 1, 2, 3, 11.8000, 3.2000, 0.5000, 7800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (9, 1, 1, 2, 4, 15.6000, 4.5000, 0.8000, 9200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (10, 1, 1, 2, 5, 18.2000, 5.8000, 1.2000, 5600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (11, 1, 2, 1, 1, 28.2000, 6.0000, 1.2500, 8800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (12, 1, 2, 1, 2, 22.8000, 4.7000, 0.8500, 6500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (13, 1, 2, 1, 3, 32.0000, 7.5000, 1.9000, 8100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (14, 1, 2, 1, 4, 39.5000, 8.8000, 2.6000, 9500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (15, 1, 2, 1, 5, 46.5000, 10.2000, 4.0000, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (16, 1, 2, 2, 1, 9.0000, 2.3000, 0.3500, 8800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (17, 1, 2, 2, 2, 6.5000, 1.6000, 0.2200, 6500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (18, 1, 2, 2, 3, 12.5000, 3.5000, 0.5500, 8100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (19, 1, 2, 2, 4, 16.5000, 4.8000, 0.8500, 9500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (20, 1, 2, 2, 5, 19.0000, 6.2000, 1.3000, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (21, 2, 1, 1, 1, 25.8000, 5.2000, 1.1000, 7800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (22, 2, 1, 1, 2, 20.5000, 4.0000, 0.7500, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (23, 2, 1, 1, 3, 29.5000, 6.8000, 1.6500, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (24, 2, 1, 1, 4, 36.8000, 8.0000, 2.3500, 8600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (25, 2, 1, 1, 5, 42.5000, 9.2000, 3.5000, 5200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (26, 2, 1, 2, 1, 7.8000, 1.9000, 0.2800, 7800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (27, 2, 1, 2, 2, 5.8000, 1.4000, 0.1800, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (28, 2, 1, 2, 3, 10.5000, 2.9000, 0.4500, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (29, 2, 1, 2, 4, 14.2000, 4.1000, 0.7200, 8600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (30, 2, 1, 2, 5, 17.0000, 5.5000, 1.1000, 5200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (31, 3, 1, 1, 1, 26.5000, 5.5000, 1.1500, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (32, 3, 1, 1, 2, 21.2000, 4.2000, 0.7800, 6000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (33, 3, 1, 1, 3, 30.5000, 7.0000, 1.7500, 7500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (34, 3, 1, 1, 4, 37.8000, 8.3000, 2.4500, 8900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (35, 3, 1, 1, 5, 44.0000, 9.5000, 3.6500, 5400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (36, 3, 1, 2, 1, 8.2000, 2.0000, 0.3000, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (37, 3, 1, 2, 2, 6.0000, 1.4500, 0.1900, 6000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (38, 3, 1, 2, 3, 11.2000, 3.1000, 0.4800, 7500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (39, 3, 1, 2, 4, 15.0000, 4.3000, 0.7800, 8900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (40, 3, 1, 2, 5, 17.8000, 5.7000, 1.1500, 5400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (41, 4, 1, 1, 1, 24.8000, 5.0000, 1.0500, 7500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (42, 4, 1, 1, 2, 19.8000, 3.8000, 0.7200, 5500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (43, 4, 1, 1, 3, 28.2000, 6.5000, 1.5500, 7000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (44, 4, 1, 1, 4, 35.2000, 7.6000, 2.2000, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (45, 4, 1, 1, 5, 40.8000, 8.8000, 3.3000, 5000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (46, 4, 1, 2, 1, 7.2000, 1.7500, 0.2500, 7500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (47, 4, 1, 2, 2, 5.2000, 1.2500, 0.1600, 5500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (48, 4, 1, 2, 3, 9.8000, 2.7000, 0.4200, 7000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (49, 4, 1, 2, 4, 13.2000, 3.8000, 0.6800, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (50, 4, 1, 2, 5, 16.0000, 5.1000, 1.0200, 5000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (51, 5, 1, 1, 1, 23.5000, 4.7000, 0.9800, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (52, 5, 1, 1, 2, 18.5000, 3.5000, 0.6800, 5200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (53, 5, 1, 1, 3, 26.8000, 6.1000, 1.4500, 6800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (54, 5, 1, 1, 4, 33.5000, 7.2000, 2.0500, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (55, 5, 1, 1, 5, 39.0000, 8.4000, 3.1000, 4800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (56, 5, 1, 2, 1, 6.8000, 1.6500, 0.2300, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (57, 5, 1, 2, 2, 4.8000, 1.1500, 0.1500, 5200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (58, 5, 1, 2, 3, 9.2000, 2.5000, 0.3800, 6800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (59, 5, 1, 2, 4, 12.5000, 3.6000, 0.6200, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (60, 5, 1, 2, 5, 15.2000, 4.8000, 0.9500, 4800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (61, 6, 1, 1, 1, 27.2000, 5.7000, 1.1800, 8400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (62, 6, 1, 1, 2, 21.8000, 4.4000, 0.8200, 6100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (63, 6, 1, 1, 3, 31.0000, 7.1000, 1.7800, 7700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (64, 6, 1, 1, 4, 38.2000, 8.4000, 2.4800, 9100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (65, 6, 1, 1, 5, 44.8000, 9.6000, 3.7200, 5500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (66, 6, 1, 2, 1, 8.4000, 2.0500, 0.3100, 8400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (67, 6, 1, 2, 2, 6.1000, 1.4800, 0.1900, 6100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (68, 6, 1, 2, 3, 11.5000, 3.1500, 0.4900, 7700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (69, 6, 1, 2, 4, 15.3000, 4.4000, 0.8000, 9100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (70, 6, 1, 2, 5, 18.5000, 5.9000, 1.1800, 5500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (71, 7, 1, 1, 1, 25.5000, 5.1000, 1.0800, 7600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (72, 7, 1, 1, 2, 20.2000, 3.9000, 0.7400, 5600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (73, 7, 1, 1, 3, 29.0000, 6.6000, 1.5800, 7100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (74, 7, 1, 1, 4, 36.0000, 7.8000, 2.2500, 8400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (75, 7, 1, 1, 5, 42.0000, 9.0000, 3.4000, 5100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (76, 7, 1, 2, 1, 7.5000, 1.8000, 0.2600, 7600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (77, 7, 1, 2, 2, 5.5000, 1.3000, 0.1700, 5600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (78, 7, 1, 2, 3, 10.2000, 2.8000, 0.4300, 7100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (79, 7, 1, 2, 4, 13.8000, 3.9500, 0.7000, 8400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (80, 7, 1, 2, 5, 16.5000, 5.2500, 1.0500, 5100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (81, 8, 1, 1, 1, 26.8000, 5.6000, 1.1600, 8300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (82, 8, 1, 1, 2, 21.5000, 4.3000, 0.8000, 6050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (83, 8, 1, 1, 3, 30.8000, 7.0500, 1.7600, 7650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (84, 8, 1, 1, 4, 37.8000, 8.3500, 2.4500, 9050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (85, 8, 1, 1, 5, 44.5000, 9.5500, 3.6800, 5450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (86, 8, 1, 2, 1, 8.3000, 2.0200, 0.3000, 8300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (87, 8, 1, 2, 2, 6.0500, 1.4600, 0.1900, 6050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (88, 8, 1, 2, 3, 11.4000, 3.1200, 0.4800, 7650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (89, 8, 1, 2, 4, 15.2000, 4.3500, 0.7900, 9050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (90, 8, 1, 2, 5, 18.3000, 5.8500, 1.1600, 5450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (91, 9, 1, 1, 1, 24.2000, 4.8000, 1.0000, 7300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (92, 9, 1, 1, 2, 19.2000, 3.6500, 0.7000, 5350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (93, 9, 1, 1, 3, 27.5000, 6.2500, 1.4800, 6900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (94, 9, 1, 1, 4, 34.2000, 7.3500, 2.1000, 8100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (95, 9, 1, 1, 5, 39.8000, 8.5500, 3.1800, 4900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (96, 9, 1, 2, 1, 7.0000, 1.6800, 0.2400, 7300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (97, 9, 1, 2, 2, 5.0000, 1.1800, 0.1500, 5350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (98, 9, 1, 2, 3, 9.5000, 2.5800, 0.4000, 6900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (99, 9, 1, 2, 4, 12.8000, 3.6500, 0.6400, 8100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (100, 9, 1, 2, 5, 15.5000, 4.8800, 0.9800, 4900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (101, 10, 1, 1, 1, 28.5000, 6.1000, 1.2800, 8900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (102, 10, 1, 1, 2, 22.8000, 4.8000, 0.8800, 6500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (103, 10, 1, 1, 3, 32.5000, 7.5000, 1.8800, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (104, 10, 1, 1, 4, 39.8000, 8.8000, 2.6200, 9600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (105, 10, 1, 1, 5, 46.8000, 10.1000, 3.9500, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (106, 10, 1, 2, 1, 9.2000, 2.2500, 0.3400, 8900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (107, 10, 1, 2, 2, 6.8000, 1.6200, 0.2100, 6500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (108, 10, 1, 2, 3, 12.8000, 3.4500, 0.5600, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (109, 10, 1, 2, 4, 16.8000, 4.8000, 0.8800, 9600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (110, 10, 1, 2, 5, 19.5000, 6.2000, 1.3200, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (111, 11, 1, 1, 1, 25.2000, 5.0500, 1.0600, 7500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (112, 11, 1, 1, 2, 20.0000, 3.8500, 0.7300, 5500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (113, 11, 1, 1, 3, 28.8000, 6.5500, 1.5600, 7000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (114, 11, 1, 1, 4, 35.8000, 7.7500, 2.2200, 8300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (115, 11, 1, 1, 5, 41.8000, 8.9500, 3.3500, 5050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (116, 11, 1, 2, 1, 7.4000, 1.7800, 0.2500, 7500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (117, 11, 1, 2, 2, 5.4000, 1.2800, 0.1600, 5500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (118, 11, 1, 2, 3, 10.0000, 2.7500, 0.4200, 7000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (119, 11, 1, 2, 4, 13.5000, 3.8800, 0.6800, 8300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (120, 11, 1, 2, 5, 16.2000, 5.1500, 1.0200, 5050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (121, 12, 1, 1, 1, 26.0000, 5.3500, 1.1200, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (122, 12, 1, 1, 2, 20.8000, 4.1000, 0.7700, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (123, 12, 1, 1, 3, 29.8000, 6.8500, 1.6500, 7400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (124, 12, 1, 1, 4, 37.0000, 8.1000, 2.3500, 8700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (125, 12, 1, 1, 5, 43.2000, 9.2500, 3.5200, 5300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (126, 12, 1, 2, 1, 8.0000, 1.9500, 0.2900, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (127, 12, 1, 2, 2, 5.9000, 1.4200, 0.1800, 5800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (128, 12, 1, 2, 3, 10.8000, 2.9800, 0.4600, 7400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (129, 12, 1, 2, 4, 14.5000, 4.1800, 0.7500, 8700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (130, 12, 1, 2, 5, 17.5000, 5.5500, 1.1200, 5300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (131, 13, 1, 1, 1, 24.5000, 4.9000, 1.0200, 7400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (132, 13, 1, 1, 2, 19.5000, 3.7200, 0.7100, 5400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (133, 13, 1, 1, 3, 27.8000, 6.3500, 1.5000, 6950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (134, 13, 1, 1, 4, 34.5000, 7.4200, 2.1200, 8150, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (135, 13, 1, 1, 5, 40.2000, 8.6200, 3.2200, 4920, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (136, 13, 1, 2, 1, 7.1000, 1.7000, 0.2400, 7400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (137, 13, 1, 2, 2, 5.1000, 1.2000, 0.1500, 5400, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (138, 13, 1, 2, 3, 9.6000, 2.6200, 0.4000, 6950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (139, 13, 1, 2, 4, 13.0000, 3.7000, 0.6500, 8150, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (140, 13, 1, 2, 5, 15.8000, 4.9200, 0.9900, 4920, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (141, 14, 1, 1, 1, 23.8000, 4.7500, 0.9900, 7100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (142, 14, 1, 1, 2, 18.8000, 3.5500, 0.6900, 5200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (143, 14, 1, 1, 3, 26.5000, 6.0500, 1.4200, 6700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (144, 14, 1, 1, 4, 32.8000, 7.0500, 2.0000, 7850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (145, 14, 1, 1, 5, 38.2000, 8.1500, 3.0200, 4700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (146, 14, 1, 2, 1, 6.6000, 1.5800, 0.2200, 7100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (147, 14, 1, 2, 2, 4.7000, 1.1000, 0.1400, 5200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (148, 14, 1, 2, 3, 8.8000, 2.3800, 0.3600, 6700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (149, 14, 1, 2, 4, 11.8000, 3.3800, 0.5800, 7850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (150, 14, 1, 2, 5, 14.5000, 4.5200, 0.8800, 4700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (151, 15, 1, 1, 1, 27.8000, 5.8500, 1.2200, 8600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (152, 15, 1, 1, 2, 22.2000, 4.5500, 0.8500, 6300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (153, 15, 1, 1, 3, 31.8000, 7.2500, 1.8200, 7950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (154, 15, 1, 1, 4, 39.0000, 8.6000, 2.5500, 9350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (155, 15, 1, 1, 5, 45.8000, 9.8500, 3.8200, 5650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (156, 15, 1, 2, 1, 8.8000, 2.1500, 0.3200, 8600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (157, 15, 1, 2, 2, 6.5000, 1.5500, 0.2000, 6300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (158, 15, 1, 2, 3, 12.2000, 3.3200, 0.5200, 7950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (159, 15, 1, 2, 4, 16.2000, 4.6800, 0.8500, 9350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (160, 15, 1, 2, 5, 19.2000, 6.0800, 1.2800, 5650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (161, 16, 1, 1, 1, 26.2000, 5.4200, 1.1300, 8000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (162, 16, 1, 1, 2, 21.0000, 4.1500, 0.7800, 5850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (163, 16, 1, 1, 3, 30.0000, 6.9000, 1.6800, 7450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (164, 16, 1, 1, 4, 37.2000, 8.1500, 2.3800, 8780, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (165, 16, 1, 1, 5, 43.5000, 9.3000, 3.5500, 5320, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (166, 16, 1, 2, 1, 8.1000, 1.9800, 0.2900, 8000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (167, 16, 1, 2, 2, 6.0000, 1.4400, 0.1900, 5850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (168, 16, 1, 2, 3, 11.0000, 3.0200, 0.4700, 7450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (169, 16, 1, 2, 4, 14.8000, 4.2200, 0.7600, 8780, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (170, 16, 1, 2, 5, 17.8000, 5.6200, 1.1400, 5320, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (171, 17, 1, 1, 1, 25.8000, 5.2800, 1.1000, 7800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (172, 17, 1, 1, 2, 20.5000, 4.0500, 0.7600, 5700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (173, 17, 1, 1, 3, 29.2000, 6.7000, 1.6200, 7250, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (174, 17, 1, 1, 4, 36.5000, 7.9200, 2.2800, 8550, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (175, 17, 1, 1, 5, 42.5000, 9.1200, 3.4200, 5180, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (176, 17, 1, 2, 1, 7.8000, 1.8800, 0.2700, 7800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (177, 17, 1, 2, 2, 5.7000, 1.3500, 0.1700, 5700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (178, 17, 1, 2, 3, 10.5000, 2.8800, 0.4400, 7250, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (179, 17, 1, 2, 4, 14.2000, 4.0500, 0.7200, 8550, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (180, 17, 1, 2, 5, 17.2000, 5.3800, 1.0800, 5180, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (181, 18, 1, 1, 1, 25.5000, 5.2000, 1.0800, 7700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (182, 18, 1, 1, 2, 20.2000, 3.9800, 0.7500, 5620, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (183, 18, 1, 1, 3, 28.8000, 6.5800, 1.5800, 7180, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (184, 18, 1, 1, 4, 36.0000, 7.8200, 2.2500, 8450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (185, 18, 1, 1, 5, 42.0000, 9.0200, 3.3800, 5120, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (186, 18, 1, 2, 1, 7.6000, 1.8200, 0.2600, 7700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (187, 18, 1, 2, 2, 5.5500, 1.3000, 0.1700, 5620, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (188, 18, 1, 2, 3, 10.2000, 2.8200, 0.4300, 7180, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (189, 18, 1, 2, 4, 13.8000, 3.9500, 0.7000, 8450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (190, 18, 1, 2, 5, 16.8000, 5.2200, 1.0500, 5120, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (191, 19, 1, 1, 1, 28.8000, 6.1500, 1.3000, 9000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (192, 19, 1, 1, 2, 23.2000, 4.8500, 0.9000, 6600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (193, 19, 1, 1, 3, 32.8000, 7.6000, 1.9200, 8350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (194, 19, 1, 1, 4, 40.2000, 8.9500, 2.6800, 9800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (195, 19, 1, 1, 5, 47.5000, 10.2500, 4.0500, 5900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (196, 19, 1, 2, 1, 9.5000, 2.3200, 0.3500, 9000, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (197, 19, 1, 2, 2, 7.0000, 1.6800, 0.2200, 6600, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (198, 19, 1, 2, 3, 13.2000, 3.5800, 0.5800, 8350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (199, 19, 1, 2, 4, 17.2000, 4.9500, 0.9200, 9800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (200, 19, 1, 2, 5, 20.0000, 6.4000, 1.3800, 5900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (201, 20, 1, 1, 1, 24.0000, 4.7800, 1.0000, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (202, 20, 1, 1, 2, 19.0000, 3.5800, 0.7000, 5250, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (203, 20, 1, 1, 3, 26.8000, 6.1200, 1.4400, 6750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (204, 20, 1, 1, 4, 33.2000, 7.1500, 2.0500, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (205, 20, 1, 1, 5, 38.8000, 8.2500, 3.0800, 4750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (206, 20, 1, 2, 1, 6.8000, 1.6200, 0.2300, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (207, 20, 1, 2, 2, 4.9000, 1.1200, 0.1400, 5250, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (208, 20, 1, 2, 3, 9.0000, 2.4200, 0.3700, 6750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (209, 20, 1, 2, 4, 12.0000, 3.4200, 0.5900, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (210, 20, 1, 2, 5, 14.8000, 4.5800, 0.9000, 4750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (211, 21, 1, 1, 1, 23.2000, 4.6200, 0.9600, 6950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (212, 21, 1, 1, 2, 18.2000, 3.4200, 0.6600, 5050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (213, 21, 1, 1, 3, 25.8000, 5.8800, 1.3800, 6500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (214, 21, 1, 1, 4, 31.8000, 6.8200, 1.9200, 7650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (215, 21, 1, 1, 5, 37.2000, 7.9200, 2.9200, 4580, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (216, 21, 1, 2, 1, 6.2000, 1.4800, 0.2100, 6950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (217, 21, 1, 2, 2, 4.5000, 1.0500, 0.1300, 5050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (218, 21, 1, 2, 3, 8.2000, 2.2500, 0.3400, 6500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (219, 21, 1, 2, 4, 11.0000, 3.1800, 0.5400, 7650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (220, 21, 1, 2, 5, 13.5000, 4.2500, 0.8200, 4580, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (221, 22, 1, 1, 1, 26.5000, 5.5200, 1.1500, 8100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (222, 22, 1, 1, 2, 21.2000, 4.2200, 0.7900, 5900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (223, 22, 1, 1, 3, 30.2000, 6.9200, 1.6800, 7480, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (224, 22, 1, 1, 4, 37.5000, 8.1800, 2.4000, 8820, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (225, 22, 1, 1, 5, 43.8000, 9.3800, 3.5800, 5350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (226, 22, 1, 2, 1, 8.2000, 2.0000, 0.3000, 8100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (227, 22, 1, 2, 2, 6.1000, 1.4800, 0.1900, 5900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (228, 22, 1, 2, 3, 11.2000, 3.0800, 0.4800, 7480, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (229, 22, 1, 2, 4, 15.0000, 4.2800, 0.7800, 8820, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (230, 22, 1, 2, 5, 18.0000, 5.6800, 1.1600, 5350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (231, 23, 1, 1, 1, 27.5000, 5.7800, 1.2200, 8500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (232, 23, 1, 1, 2, 22.0000, 4.5200, 0.8500, 6200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (233, 23, 1, 1, 3, 31.5000, 7.2200, 1.8000, 7850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (234, 23, 1, 1, 4, 38.8000, 8.5500, 2.5200, 9250, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (235, 23, 1, 1, 5, 45.5000, 9.7800, 3.7800, 5580, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (236, 23, 1, 2, 1, 8.6000, 2.1000, 0.3200, 8500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (237, 23, 1, 2, 2, 6.4000, 1.5200, 0.2000, 6200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (238, 23, 1, 2, 3, 12.0000, 3.2800, 0.5200, 7850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (239, 23, 1, 2, 4, 16.0000, 4.6200, 0.8400, 9250, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (240, 23, 1, 2, 5, 19.0000, 6.0200, 1.2600, 5580, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (241, 24, 1, 1, 1, 25.2000, 5.0800, 1.0600, 7550, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (242, 24, 1, 1, 2, 20.0000, 3.8800, 0.7400, 5520, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (243, 24, 1, 1, 3, 28.5000, 6.5200, 1.5500, 7050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (244, 24, 1, 1, 4, 35.5000, 7.6800, 2.1800, 8320, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (245, 24, 1, 1, 5, 41.5000, 8.8800, 3.3200, 5020, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (246, 24, 1, 2, 1, 7.3000, 1.7500, 0.2500, 7550, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (247, 24, 1, 2, 2, 5.3000, 1.2500, 0.1600, 5520, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (248, 24, 1, 2, 3, 9.8000, 2.6800, 0.4200, 7050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (249, 24, 1, 2, 4, 13.2000, 3.8200, 0.6600, 8320, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (250, 24, 1, 2, 5, 16.0000, 5.0800, 1.0000, 5020, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (251, 25, 1, 1, 1, 26.0000, 5.3500, 1.1200, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (252, 25, 1, 1, 2, 20.8000, 4.1200, 0.7800, 5780, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (253, 25, 1, 1, 3, 29.5000, 6.7800, 1.6500, 7350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (254, 25, 1, 1, 4, 36.8000, 8.0200, 2.3200, 8650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (255, 25, 1, 1, 5, 42.8000, 9.1800, 3.4800, 5220, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (256, 25, 1, 2, 1, 7.9000, 1.9200, 0.2800, 7900, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (257, 25, 1, 2, 2, 5.8000, 1.3800, 0.1800, 5780, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (258, 25, 1, 2, 3, 10.8000, 2.9500, 0.4500, 7350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (259, 25, 1, 2, 4, 14.5000, 4.1500, 0.7400, 8650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (260, 25, 1, 2, 5, 17.5000, 5.5200, 1.1200, 5220, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (261, 26, 1, 1, 1, 22.5000, 4.4800, 0.9200, 6700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (262, 26, 1, 1, 2, 17.5000, 3.2800, 0.6200, 4850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (263, 26, 1, 1, 3, 24.8000, 5.6200, 1.3200, 6200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (264, 26, 1, 1, 4, 30.5000, 6.5200, 1.8500, 7350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (265, 26, 1, 1, 5, 35.8000, 7.5800, 2.7800, 4380, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (266, 26, 1, 2, 1, 5.8000, 1.3800, 0.1900, 6700, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (267, 26, 1, 2, 2, 4.2000, 0.9800, 0.1200, 4850, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (268, 26, 1, 2, 3, 7.8000, 2.1200, 0.3200, 6200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (269, 26, 1, 2, 4, 10.5000, 3.0200, 0.5000, 7350, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (270, 26, 1, 2, 5, 12.8000, 4.0200, 0.7500, 4380, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (271, 27, 1, 1, 1, 25.8000, 5.2500, 1.1000, 7750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (272, 27, 1, 1, 2, 20.5000, 4.0200, 0.7600, 5650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (273, 27, 1, 1, 3, 29.0000, 6.6500, 1.6000, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (274, 27, 1, 1, 4, 36.2000, 7.8800, 2.2600, 8500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (275, 27, 1, 1, 5, 42.2000, 9.0800, 3.4000, 5100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (276, 27, 1, 2, 1, 7.7000, 1.8500, 0.2700, 7750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (277, 27, 1, 2, 2, 5.6500, 1.3200, 0.1700, 5650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (278, 27, 1, 2, 3, 10.4000, 2.8500, 0.4300, 7200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (279, 27, 1, 2, 4, 14.0000, 4.0200, 0.7100, 8500, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (280, 27, 1, 2, 5, 17.0000, 5.3200, 1.0600, 5100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (281, 28, 1, 1, 1, 26.2000, 5.4200, 1.1400, 8050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (282, 28, 1, 1, 2, 21.0000, 4.1800, 0.8000, 5880, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (283, 28, 1, 1, 3, 30.0000, 6.8800, 1.6800, 7480, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (284, 28, 1, 1, 4, 37.2000, 8.1200, 2.3800, 8780, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (285, 28, 1, 1, 5, 43.5000, 9.2800, 3.5500, 5320, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (286, 28, 1, 2, 1, 8.1000, 1.9800, 0.2900, 8050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (287, 28, 1, 2, 2, 6.0000, 1.4500, 0.1900, 5880, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (288, 28, 1, 2, 3, 11.0000, 3.0200, 0.4700, 7480, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (289, 28, 1, 2, 4, 14.8000, 4.2200, 0.7600, 8780, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (290, 28, 1, 2, 5, 17.8000, 5.6200, 1.1400, 5320, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (291, 29, 1, 1, 1, 24.8000, 5.0200, 1.0400, 7450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (292, 29, 1, 1, 2, 19.8000, 3.8200, 0.7200, 5420, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (293, 29, 1, 1, 3, 28.0000, 6.4200, 1.5200, 6950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (294, 29, 1, 1, 4, 34.8000, 7.5200, 2.1500, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (295, 29, 1, 1, 5, 40.5000, 8.7200, 3.2500, 4920, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (296, 29, 1, 2, 1, 7.2000, 1.7200, 0.2400, 7450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (297, 29, 1, 2, 2, 5.2000, 1.2200, 0.1500, 5420, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (298, 29, 1, 2, 3, 9.6000, 2.6200, 0.4100, 6950, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (299, 29, 1, 2, 4, 12.8000, 3.7200, 0.6400, 8200, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (300, 29, 1, 2, 5, 15.5000, 4.9200, 0.9800, 4920, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (301, 30, 1, 1, 1, 23.5000, 4.6800, 0.9800, 7050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (302, 30, 1, 1, 2, 18.5000, 3.4500, 0.6800, 5100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (303, 30, 1, 1, 3, 26.2000, 5.9500, 1.4000, 6580, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (304, 30, 1, 1, 4, 32.2000, 6.9200, 1.9800, 7750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (305, 30, 1, 1, 5, 37.8000, 8.0500, 3.0200, 4650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (306, 30, 1, 2, 1, 6.5000, 1.5500, 0.2200, 7050, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (307, 30, 1, 2, 2, 4.7000, 1.0800, 0.1400, 5100, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (308, 30, 1, 2, 3, 8.5000, 2.3200, 0.3500, 6580, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (309, 30, 1, 2, 4, 11.5000, 3.2800, 0.5600, 7750, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (310, 30, 1, 2, 5, 14.0000, 4.3500, 0.8500, 4650, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (311, 31, 1, 1, 1, 22.8000, 4.5500, 0.9400, 6800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (312, 31, 1, 1, 2, 17.8000, 3.3200, 0.6400, 4920, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (313, 31, 1, 1, 3, 25.2000, 5.7200, 1.3500, 6300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (314, 31, 1, 1, 4, 31.0000, 6.6800, 1.9000, 7450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (315, 31, 1, 1, 5, 36.5000, 7.7500, 2.8500, 4450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (316, 31, 1, 2, 1, 6.0000, 1.4200, 0.2000, 6800, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (317, 31, 1, 2, 2, 4.4000, 1.0200, 0.1300, 4920, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (318, 31, 1, 2, 3, 8.0000, 2.1800, 0.3300, 6300, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (319, 31, 1, 2, 4, 10.8000, 3.0800, 0.5200, 7450, '国家统计局', '2026-06-04 11:26:56');
INSERT INTO `t_chronic_disease_data` VALUES (320, 31, 1, 2, 5, 13.2000, 4.1200, 0.7800, 4450, '国家统计局', '2026-06-04 11:26:56');

-- ----------------------------
-- Table structure for t_disease_type
-- ----------------------------
DROP TABLE IF EXISTS `t_disease_type`;
CREATE TABLE `t_disease_type`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `disease_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疾病编码',
  `disease_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疾病名称',
  `disease_category` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '疾病分类',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '疾病描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_disease_code`(`disease_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '慢性病类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_disease_type
-- ----------------------------
INSERT INTO `t_disease_type` VALUES (1, 'HYP', '高血压', '心血管疾病', '以动脉血压持续升高为主要特征的慢性病');
INSERT INTO `t_disease_type` VALUES (2, 'DIA', '糖尿病', '代谢性疾病', '以血糖升高为主要特征的代谢性疾病');
INSERT INTO `t_disease_type` VALUES (3, 'CHD', '冠心病', '心血管疾病', '冠状动脉粥样硬化性心脏病');
INSERT INTO `t_disease_type` VALUES (4, 'CER', '脑卒中', '心血管疾病', '脑血管意外，包括脑梗死和脑出血');
INSERT INTO `t_disease_type` VALUES (5, 'COP', '慢性阻塞性肺疾病', '呼吸系统疾病', '以气流受限为特征的慢性呼吸系统疾病');
INSERT INTO `t_disease_type` VALUES (6, 'CAN', '癌症', '恶性肿瘤', '各种恶性肿瘤的总称');

-- ----------------------------
-- Table structure for t_health_factor
-- ----------------------------
DROP TABLE IF EXISTS `t_health_factor`;
CREATE TABLE `t_health_factor`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_id` bigint(20) NOT NULL COMMENT '地区ID',
  `time_id` bigint(20) NOT NULL COMMENT '时间ID',
  `smoking_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '吸烟率(%)',
  `drinking_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '饮酒率(%)',
  `obesity_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '肥胖率(%)',
  `exercise_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '经常锻炼率(%)',
  `hypertension_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '高血压知晓率(%)',
  `diabetes_rate` decimal(5, 2) NULL DEFAULT NULL COMMENT '糖尿病知晓率(%)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_region_time`(`region_id` ASC, `time_id` ASC) USING BTREE,
  INDEX `idx_region_id`(`region_id` ASC) USING BTREE,
  INDEX `idx_time_id`(`time_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '健康影响因素表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_health_factor
-- ----------------------------
INSERT INTO `t_health_factor` VALUES (1, 1, 1, 22.50, 35.80, 32.50, 42.80, 52.50, 48.20);
INSERT INTO `t_health_factor` VALUES (2, 2, 1, 24.80, 38.20, 34.20, 40.50, 50.80, 46.50);
INSERT INTO `t_health_factor` VALUES (3, 3, 1, 26.50, 32.50, 36.80, 38.20, 48.20, 44.80);
INSERT INTO `t_health_factor` VALUES (4, 4, 1, 28.20, 30.80, 38.50, 36.50, 46.50, 43.20);
INSERT INTO `t_health_factor` VALUES (5, 5, 1, 30.50, 28.50, 40.20, 34.80, 44.80, 41.50);
INSERT INTO `t_health_factor` VALUES (6, 6, 1, 25.80, 36.50, 33.80, 41.20, 51.20, 47.80);
INSERT INTO `t_health_factor` VALUES (7, 7, 1, 27.50, 34.20, 35.50, 39.50, 49.50, 45.20);
INSERT INTO `t_health_factor` VALUES (8, 8, 1, 26.20, 35.80, 34.50, 40.80, 50.50, 46.80);
INSERT INTO `t_health_factor` VALUES (9, 9, 1, 20.50, 32.50, 30.20, 45.50, 55.20, 52.50);
INSERT INTO `t_health_factor` VALUES (10, 10, 1, 23.80, 34.80, 32.80, 43.20, 53.80, 49.50);
INSERT INTO `t_health_factor` VALUES (11, 11, 1, 22.20, 33.50, 31.50, 44.50, 54.50, 50.80);
INSERT INTO `t_health_factor` VALUES (12, 12, 1, 25.50, 31.80, 35.20, 40.20, 48.80, 45.50);
INSERT INTO `t_health_factor` VALUES (13, 13, 1, 24.20, 30.50, 33.80, 41.80, 50.20, 47.20);
INSERT INTO `t_health_factor` VALUES (14, 14, 1, 26.80, 32.20, 36.20, 39.20, 47.50, 44.50);
INSERT INTO `t_health_factor` VALUES (15, 15, 1, 23.50, 35.50, 33.20, 42.50, 52.20, 48.80);
INSERT INTO `t_health_factor` VALUES (16, 16, 1, 25.20, 33.80, 35.80, 40.80, 49.80, 46.20);
INSERT INTO `t_health_factor` VALUES (17, 17, 1, 24.80, 34.50, 34.20, 41.50, 50.80, 47.50);
INSERT INTO `t_health_factor` VALUES (18, 18, 1, 23.20, 32.80, 32.80, 43.20, 52.50, 49.20);
INSERT INTO `t_health_factor` VALUES (19, 19, 1, 21.80, 36.20, 31.20, 45.80, 55.80, 51.50);
INSERT INTO `t_health_factor` VALUES (20, 20, 1, 26.20, 31.50, 36.50, 39.50, 47.20, 44.20);
INSERT INTO `t_health_factor` VALUES (21, 21, 1, 19.50, 30.20, 28.80, 48.50, 58.20, 54.80);
INSERT INTO `t_health_factor` VALUES (22, 22, 1, 24.50, 33.20, 33.50, 42.20, 51.50, 48.20);
INSERT INTO `t_health_factor` VALUES (23, 23, 1, 22.80, 35.50, 32.20, 43.80, 53.20, 49.80);
INSERT INTO `t_health_factor` VALUES (24, 24, 1, 23.80, 34.20, 33.80, 42.50, 52.20, 48.50);
INSERT INTO `t_health_factor` VALUES (25, 25, 1, 24.20, 32.80, 34.50, 41.20, 50.80, 47.20);
INSERT INTO `t_health_factor` VALUES (26, 26, 1, 18.50, 28.50, 26.80, 52.50, 62.50, 58.20);
INSERT INTO `t_health_factor` VALUES (27, 27, 1, 25.50, 32.50, 35.20, 40.50, 48.50, 45.80);
INSERT INTO `t_health_factor` VALUES (28, 28, 1, 23.50, 30.80, 32.80, 42.80, 51.80, 48.50);
INSERT INTO `t_health_factor` VALUES (29, 29, 1, 20.20, 26.50, 28.50, 48.80, 56.80, 53.50);
INSERT INTO `t_health_factor` VALUES (30, 30, 1, 22.80, 28.80, 30.20, 46.50, 54.50, 51.20);
INSERT INTO `t_health_factor` VALUES (31, 31, 1, 25.80, 30.20, 34.50, 40.20, 49.20, 46.50);
INSERT INTO `t_health_factor` VALUES (32, 1, 2, 21.80, 35.20, 33.20, 43.50, 53.20, 49.20);
INSERT INTO `t_health_factor` VALUES (33, 2, 2, 24.20, 37.80, 34.80, 41.20, 51.50, 47.20);
INSERT INTO `t_health_factor` VALUES (34, 3, 2, 25.80, 32.00, 37.50, 38.80, 49.00, 45.50);
INSERT INTO `t_health_factor` VALUES (35, 4, 2, 27.50, 30.20, 39.20, 37.20, 47.20, 43.80);
INSERT INTO `t_health_factor` VALUES (36, 5, 2, 29.80, 28.00, 40.80, 35.50, 45.50, 42.20);
INSERT INTO `t_health_factor` VALUES (37, 6, 2, 25.20, 36.00, 34.50, 41.80, 52.00, 48.50);
INSERT INTO `t_health_factor` VALUES (38, 7, 2, 26.80, 33.80, 36.20, 40.20, 50.20, 46.00);
INSERT INTO `t_health_factor` VALUES (39, 8, 2, 25.50, 35.20, 35.20, 41.50, 51.20, 47.50);
INSERT INTO `t_health_factor` VALUES (40, 9, 2, 19.80, 32.00, 30.80, 46.20, 56.00, 53.20);
INSERT INTO `t_health_factor` VALUES (41, 10, 2, 23.20, 34.20, 33.50, 44.00, 54.50, 50.20);
INSERT INTO `t_health_factor` VALUES (42, 11, 2, 21.50, 33.00, 32.20, 45.20, 55.20, 51.50);
INSERT INTO `t_health_factor` VALUES (43, 12, 2, 24.80, 31.20, 35.80, 40.80, 49.50, 46.20);
INSERT INTO `t_health_factor` VALUES (44, 13, 2, 23.50, 30.00, 34.50, 42.50, 51.00, 48.00);
INSERT INTO `t_health_factor` VALUES (45, 14, 2, 26.20, 31.80, 36.80, 39.80, 48.20, 45.20);
INSERT INTO `t_health_factor` VALUES (46, 15, 2, 22.80, 35.00, 33.80, 43.20, 53.00, 49.50);
INSERT INTO `t_health_factor` VALUES (47, 16, 2, 24.50, 33.20, 36.50, 41.50, 50.50, 47.00);
INSERT INTO `t_health_factor` VALUES (48, 17, 2, 24.20, 34.00, 34.80, 42.20, 51.50, 48.20);
INSERT INTO `t_health_factor` VALUES (49, 18, 2, 22.50, 32.20, 33.50, 44.00, 53.20, 50.00);
INSERT INTO `t_health_factor` VALUES (50, 19, 2, 21.20, 35.80, 31.80, 46.50, 56.50, 52.20);
INSERT INTO `t_health_factor` VALUES (51, 20, 2, 25.50, 31.00, 37.20, 40.20, 48.00, 45.00);
INSERT INTO `t_health_factor` VALUES (52, 21, 2, 18.80, 29.80, 29.50, 49.20, 59.00, 55.50);
INSERT INTO `t_health_factor` VALUES (53, 22, 2, 23.80, 32.80, 34.20, 42.80, 52.20, 49.00);
INSERT INTO `t_health_factor` VALUES (54, 23, 2, 22.20, 35.00, 32.80, 44.50, 54.00, 50.50);
INSERT INTO `t_health_factor` VALUES (55, 24, 2, 23.20, 33.80, 34.50, 43.20, 53.00, 49.20);
INSERT INTO `t_health_factor` VALUES (56, 25, 2, 23.50, 32.20, 35.20, 41.80, 51.50, 48.00);
INSERT INTO `t_health_factor` VALUES (57, 26, 2, 17.80, 28.00, 27.50, 53.20, 63.20, 59.00);
INSERT INTO `t_health_factor` VALUES (58, 27, 2, 24.80, 32.00, 35.80, 41.20, 49.20, 46.50);
INSERT INTO `t_health_factor` VALUES (59, 28, 2, 22.80, 30.20, 33.50, 43.50, 52.50, 49.20);
INSERT INTO `t_health_factor` VALUES (60, 29, 2, 19.50, 26.00, 29.20, 49.50, 57.50, 54.20);
INSERT INTO `t_health_factor` VALUES (61, 30, 2, 22.20, 28.20, 30.80, 47.20, 55.20, 52.00);
INSERT INTO `t_health_factor` VALUES (62, 31, 2, 25.20, 29.80, 35.20, 40.80, 50.00, 47.20);
INSERT INTO `t_health_factor` VALUES (63, 1, 3, 21.20, 34.80, 33.80, 44.20, 54.00, 50.00);
INSERT INTO `t_health_factor` VALUES (64, 2, 3, 23.80, 37.20, 35.50, 41.80, 52.20, 48.00);
INSERT INTO `t_health_factor` VALUES (65, 3, 3, 25.20, 31.50, 38.20, 39.50, 49.80, 46.20);
INSERT INTO `t_health_factor` VALUES (66, 4, 3, 26.80, 29.80, 39.80, 37.80, 48.00, 44.50);
INSERT INTO `t_health_factor` VALUES (67, 5, 3, 29.20, 27.50, 41.50, 36.20, 46.20, 42.80);
INSERT INTO `t_health_factor` VALUES (68, 6, 3, 24.80, 35.50, 35.20, 42.50, 52.80, 49.20);
INSERT INTO `t_health_factor` VALUES (69, 7, 3, 26.20, 33.20, 36.80, 40.80, 51.00, 46.80);
INSERT INTO `t_health_factor` VALUES (70, 8, 3, 25.00, 34.80, 35.80, 42.20, 52.00, 48.20);
INSERT INTO `t_health_factor` VALUES (71, 9, 3, 19.20, 31.50, 31.50, 47.00, 56.80, 54.00);
INSERT INTO `t_health_factor` VALUES (72, 10, 3, 22.80, 33.80, 34.20, 44.80, 55.20, 51.00);
INSERT INTO `t_health_factor` VALUES (73, 11, 3, 21.00, 32.50, 32.80, 46.00, 56.00, 52.20);
INSERT INTO `t_health_factor` VALUES (74, 12, 3, 24.20, 30.80, 36.50, 41.50, 50.20, 47.00);
INSERT INTO `t_health_factor` VALUES (75, 13, 3, 23.00, 29.50, 35.20, 43.20, 51.80, 48.80);
INSERT INTO `t_health_factor` VALUES (76, 14, 3, 25.50, 31.20, 37.50, 40.50, 49.00, 46.00);
INSERT INTO `t_health_factor` VALUES (77, 15, 3, 22.20, 34.50, 34.50, 43.80, 53.80, 50.20);
INSERT INTO `t_health_factor` VALUES (78, 16, 3, 24.00, 32.80, 37.20, 42.20, 51.20, 47.80);
INSERT INTO `t_health_factor` VALUES (79, 17, 3, 23.50, 33.50, 35.50, 42.80, 52.20, 49.00);
INSERT INTO `t_health_factor` VALUES (80, 18, 3, 22.00, 31.80, 34.20, 44.80, 54.00, 50.80);
INSERT INTO `t_health_factor` VALUES (81, 19, 3, 20.50, 35.20, 32.50, 47.20, 57.20, 53.00);
INSERT INTO `t_health_factor` VALUES (82, 20, 3, 25.00, 30.50, 37.80, 41.00, 48.80, 45.80);
INSERT INTO `t_health_factor` VALUES (83, 21, 3, 18.20, 29.20, 30.20, 50.00, 59.80, 56.20);
INSERT INTO `t_health_factor` VALUES (84, 22, 3, 23.20, 32.20, 34.80, 43.50, 53.00, 49.80);
INSERT INTO `t_health_factor` VALUES (85, 23, 3, 21.50, 34.50, 33.50, 45.20, 54.80, 51.20);
INSERT INTO `t_health_factor` VALUES (86, 24, 3, 22.80, 33.20, 35.20, 43.80, 53.80, 50.00);
INSERT INTO `t_health_factor` VALUES (87, 25, 3, 23.00, 31.80, 35.80, 42.50, 52.20, 48.80);
INSERT INTO `t_health_factor` VALUES (88, 26, 3, 17.20, 27.50, 28.20, 54.00, 64.00, 59.80);
INSERT INTO `t_health_factor` VALUES (89, 27, 3, 24.20, 31.50, 36.50, 41.80, 50.00, 47.20);
INSERT INTO `t_health_factor` VALUES (90, 28, 3, 22.20, 29.80, 34.20, 44.20, 53.20, 50.00);
INSERT INTO `t_health_factor` VALUES (91, 29, 3, 18.80, 25.50, 29.80, 50.20, 58.20, 55.00);
INSERT INTO `t_health_factor` VALUES (92, 30, 3, 21.80, 27.80, 31.50, 48.00, 56.00, 52.80);
INSERT INTO `t_health_factor` VALUES (93, 31, 3, 24.80, 29.20, 35.80, 41.50, 50.80, 48.00);
INSERT INTO `t_health_factor` VALUES (94, 1, 4, 20.50, 34.20, 34.50, 45.00, 54.80, 50.80);
INSERT INTO `t_health_factor` VALUES (95, 2, 4, 23.20, 36.80, 36.20, 42.50, 53.00, 48.80);
INSERT INTO `t_health_factor` VALUES (96, 3, 4, 24.80, 31.00, 38.80, 40.20, 50.50, 47.00);
INSERT INTO `t_health_factor` VALUES (97, 4, 4, 26.20, 29.20, 40.50, 38.50, 48.80, 45.20);
INSERT INTO `t_health_factor` VALUES (98, 5, 4, 28.50, 27.00, 42.20, 37.00, 47.00, 43.50);
INSERT INTO `t_health_factor` VALUES (99, 6, 4, 24.20, 35.00, 35.80, 43.20, 53.50, 50.00);
INSERT INTO `t_health_factor` VALUES (100, 7, 4, 25.80, 32.80, 37.50, 41.50, 51.80, 47.50);
INSERT INTO `t_health_factor` VALUES (101, 8, 4, 24.50, 34.20, 36.50, 43.00, 52.80, 49.00);
INSERT INTO `t_health_factor` VALUES (102, 9, 4, 18.50, 31.00, 32.20, 47.80, 57.50, 54.80);
INSERT INTO `t_health_factor` VALUES (103, 10, 4, 22.20, 33.20, 35.00, 45.50, 56.00, 51.80);
INSERT INTO `t_health_factor` VALUES (104, 11, 4, 20.50, 32.00, 33.50, 46.80, 56.80, 53.00);
INSERT INTO `t_health_factor` VALUES (105, 12, 4, 23.80, 30.20, 37.20, 42.20, 51.00, 47.80);
INSERT INTO `t_health_factor` VALUES (106, 13, 4, 22.50, 29.00, 35.80, 44.00, 52.50, 49.50);
INSERT INTO `t_health_factor` VALUES (107, 14, 4, 25.00, 30.80, 38.20, 41.20, 49.80, 46.80);
INSERT INTO `t_health_factor` VALUES (108, 15, 4, 21.80, 34.00, 35.20, 44.50, 54.50, 51.00);
INSERT INTO `t_health_factor` VALUES (109, 16, 4, 23.50, 32.20, 37.80, 43.00, 52.00, 48.50);
INSERT INTO `t_health_factor` VALUES (110, 17, 4, 23.00, 33.00, 36.20, 43.50, 53.00, 49.80);
INSERT INTO `t_health_factor` VALUES (111, 18, 4, 21.50, 31.20, 35.00, 45.50, 54.80, 51.50);
INSERT INTO `t_health_factor` VALUES (112, 19, 4, 20.00, 34.80, 33.20, 48.00, 58.00, 53.80);
INSERT INTO `t_health_factor` VALUES (113, 20, 4, 24.50, 30.00, 38.50, 41.80, 49.50, 46.50);
INSERT INTO `t_health_factor` VALUES (114, 21, 4, 17.50, 28.50, 31.00, 50.80, 60.50, 57.00);
INSERT INTO `t_health_factor` VALUES (115, 22, 4, 22.80, 31.80, 35.50, 44.20, 53.80, 50.50);
INSERT INTO `t_health_factor` VALUES (116, 23, 4, 21.00, 34.00, 34.20, 46.00, 55.50, 52.00);
INSERT INTO `t_health_factor` VALUES (117, 24, 4, 22.20, 32.80, 36.00, 44.50, 54.50, 50.80);
INSERT INTO `t_health_factor` VALUES (118, 25, 4, 22.50, 31.20, 36.50, 43.20, 53.00, 49.50);
INSERT INTO `t_health_factor` VALUES (119, 26, 4, 16.50, 27.00, 29.00, 54.80, 64.80, 60.50);
INSERT INTO `t_health_factor` VALUES (120, 27, 4, 23.80, 31.00, 37.20, 42.50, 50.80, 48.00);
INSERT INTO `t_health_factor` VALUES (121, 28, 4, 21.80, 29.20, 35.00, 45.00, 54.00, 50.80);
INSERT INTO `t_health_factor` VALUES (122, 29, 4, 18.20, 25.00, 30.50, 51.00, 59.00, 55.80);
INSERT INTO `t_health_factor` VALUES (123, 30, 4, 21.20, 27.20, 32.20, 48.80, 56.80, 53.50);
INSERT INTO `t_health_factor` VALUES (124, 31, 4, 24.20, 28.80, 36.50, 42.20, 51.50, 48.80);
INSERT INTO `t_health_factor` VALUES (125, 1, 5, 19.80, 33.80, 35.20, 45.80, 55.50, 51.50);
INSERT INTO `t_health_factor` VALUES (126, 2, 5, 22.50, 36.20, 36.80, 43.20, 53.80, 49.50);
INSERT INTO `t_health_factor` VALUES (127, 3, 5, 24.20, 30.50, 39.50, 41.00, 51.20, 47.80);
INSERT INTO `t_health_factor` VALUES (128, 4, 5, 25.80, 28.80, 41.20, 39.20, 49.50, 46.00);
INSERT INTO `t_health_factor` VALUES (129, 5, 5, 28.00, 26.50, 42.80, 37.80, 47.80, 44.20);
INSERT INTO `t_health_factor` VALUES (130, 6, 5, 23.80, 34.50, 36.50, 44.00, 54.20, 50.80);
INSERT INTO `t_health_factor` VALUES (131, 7, 5, 25.20, 32.20, 38.20, 42.20, 52.50, 48.20);
INSERT INTO `t_health_factor` VALUES (132, 8, 5, 24.00, 33.80, 37.20, 43.80, 53.50, 49.80);
INSERT INTO `t_health_factor` VALUES (133, 9, 5, 18.00, 30.50, 32.80, 48.50, 58.20, 55.50);
INSERT INTO `t_health_factor` VALUES (134, 10, 5, 21.80, 32.80, 35.80, 46.20, 56.80, 52.50);
INSERT INTO `t_health_factor` VALUES (135, 11, 5, 20.00, 31.50, 34.20, 47.50, 57.50, 53.80);
INSERT INTO `t_health_factor` VALUES (136, 12, 5, 23.20, 29.80, 37.80, 43.00, 51.80, 48.50);
INSERT INTO `t_health_factor` VALUES (137, 13, 5, 22.00, 28.50, 36.50, 44.80, 53.20, 50.20);
INSERT INTO `t_health_factor` VALUES (138, 14, 5, 24.50, 30.20, 38.80, 42.00, 50.50, 47.50);
INSERT INTO `t_health_factor` VALUES (139, 15, 5, 21.20, 33.50, 35.80, 45.20, 55.20, 51.80);
INSERT INTO `t_health_factor` VALUES (140, 16, 5, 23.00, 31.80, 38.50, 43.80, 52.80, 49.20);
INSERT INTO `t_health_factor` VALUES (141, 17, 5, 22.50, 32.50, 37.00, 44.20, 53.80, 50.50);
INSERT INTO `t_health_factor` VALUES (142, 18, 5, 21.00, 30.80, 35.80, 46.20, 55.50, 52.20);
INSERT INTO `t_health_factor` VALUES (143, 19, 5, 19.50, 34.20, 34.00, 48.80, 58.80, 54.50);
INSERT INTO `t_health_factor` VALUES (144, 20, 5, 24.00, 29.50, 39.20, 42.50, 50.20, 47.20);
INSERT INTO `t_health_factor` VALUES (145, 21, 5, 17.00, 28.00, 31.80, 51.50, 61.20, 57.80);
INSERT INTO `t_health_factor` VALUES (146, 22, 5, 22.20, 31.20, 36.20, 45.00, 54.50, 51.20);
INSERT INTO `t_health_factor` VALUES (147, 23, 5, 20.50, 33.50, 35.00, 46.80, 56.20, 52.80);
INSERT INTO `t_health_factor` VALUES (148, 24, 5, 21.80, 32.20, 36.80, 45.20, 55.20, 51.50);
INSERT INTO `t_health_factor` VALUES (149, 25, 5, 22.00, 30.80, 37.20, 44.00, 53.80, 50.20);
INSERT INTO `t_health_factor` VALUES (150, 26, 5, 16.00, 26.50, 29.80, 55.50, 65.50, 61.20);
INSERT INTO `t_health_factor` VALUES (151, 27, 5, 23.20, 30.50, 37.80, 43.20, 51.50, 48.80);
INSERT INTO `t_health_factor` VALUES (152, 28, 5, 21.20, 28.80, 35.80, 45.80, 54.80, 51.50);
INSERT INTO `t_health_factor` VALUES (153, 29, 5, 17.80, 24.50, 31.20, 51.80, 59.80, 56.50);
INSERT INTO `t_health_factor` VALUES (154, 30, 5, 20.80, 26.80, 32.80, 49.50, 57.50, 54.20);
INSERT INTO `t_health_factor` VALUES (155, 31, 5, 23.80, 28.20, 37.20, 43.00, 52.20, 49.50);
INSERT INTO `t_health_factor` VALUES (156, 1, 6, 19.20, 33.20, 35.80, 46.50, 56.20, 52.20);
INSERT INTO `t_health_factor` VALUES (157, 2, 6, 22.00, 35.80, 37.50, 43.80, 54.50, 50.20);
INSERT INTO `t_health_factor` VALUES (158, 3, 6, 23.50, 30.00, 40.20, 41.80, 52.00, 48.50);
INSERT INTO `t_health_factor` VALUES (159, 4, 6, 25.20, 28.20, 41.80, 39.80, 50.20, 46.80);
INSERT INTO `t_health_factor` VALUES (160, 5, 6, 27.50, 26.00, 43.50, 38.50, 48.50, 45.00);
INSERT INTO `t_health_factor` VALUES (161, 6, 6, 23.20, 34.00, 37.20, 44.80, 55.00, 51.50);
INSERT INTO `t_health_factor` VALUES (162, 7, 6, 24.80, 31.80, 38.80, 43.00, 53.20, 49.00);
INSERT INTO `t_health_factor` VALUES (163, 8, 6, 23.50, 33.20, 38.00, 44.50, 54.20, 50.50);
INSERT INTO `t_health_factor` VALUES (164, 9, 6, 17.50, 30.00, 33.50, 49.20, 59.00, 56.20);
INSERT INTO `t_health_factor` VALUES (165, 10, 6, 21.20, 32.20, 36.50, 47.00, 57.50, 53.20);
INSERT INTO `t_health_factor` VALUES (166, 11, 6, 19.50, 31.00, 35.00, 48.20, 58.20, 54.50);
INSERT INTO `t_health_factor` VALUES (167, 12, 6, 22.80, 29.20, 38.50, 43.80, 52.50, 49.20);
INSERT INTO `t_health_factor` VALUES (168, 13, 6, 21.50, 28.00, 37.20, 45.50, 54.00, 51.00);
INSERT INTO `t_health_factor` VALUES (169, 14, 6, 24.00, 29.80, 39.50, 42.80, 51.20, 48.20);
INSERT INTO `t_health_factor` VALUES (170, 15, 6, 20.80, 33.00, 36.50, 45.80, 55.80, 52.50);
INSERT INTO `t_health_factor` VALUES (171, 16, 6, 22.50, 31.20, 39.20, 44.50, 53.50, 50.00);
INSERT INTO `t_health_factor` VALUES (172, 17, 6, 22.00, 32.00, 37.80, 45.00, 54.50, 51.20);
INSERT INTO `t_health_factor` VALUES (173, 18, 6, 20.50, 30.20, 36.50, 47.00, 56.20, 53.00);
INSERT INTO `t_health_factor` VALUES (174, 19, 6, 19.00, 33.80, 34.80, 49.50, 59.50, 55.20);
INSERT INTO `t_health_factor` VALUES (175, 20, 6, 23.50, 29.00, 39.80, 43.20, 51.00, 48.00);
INSERT INTO `t_health_factor` VALUES (176, 21, 6, 16.50, 27.50, 32.50, 52.20, 62.00, 58.50);
INSERT INTO `t_health_factor` VALUES (177, 22, 6, 21.80, 30.80, 37.00, 45.80, 55.20, 52.00);
INSERT INTO `t_health_factor` VALUES (178, 23, 6, 20.00, 33.00, 35.80, 47.50, 57.00, 53.50);
INSERT INTO `t_health_factor` VALUES (179, 24, 6, 21.20, 31.80, 37.50, 46.00, 56.00, 52.20);
INSERT INTO `t_health_factor` VALUES (180, 25, 6, 21.50, 30.20, 38.00, 44.80, 54.50, 51.00);
INSERT INTO `t_health_factor` VALUES (181, 26, 6, 15.50, 26.00, 30.50, 56.20, 66.20, 62.00);
INSERT INTO `t_health_factor` VALUES (182, 27, 6, 22.80, 30.00, 38.50, 44.00, 52.20, 49.50);
INSERT INTO `t_health_factor` VALUES (183, 28, 6, 20.80, 28.20, 36.50, 46.50, 55.50, 52.20);
INSERT INTO `t_health_factor` VALUES (184, 29, 6, 17.20, 24.00, 32.00, 52.50, 60.50, 57.20);
INSERT INTO `t_health_factor` VALUES (185, 30, 6, 20.20, 26.20, 33.50, 50.20, 58.20, 55.00);
INSERT INTO `t_health_factor` VALUES (186, 31, 6, 23.20, 27.80, 38.00, 43.80, 53.00, 50.20);
INSERT INTO `t_health_factor` VALUES (187, 1, 7, 18.50, 32.80, 36.50, 47.20, 57.00, 53.00);
INSERT INTO `t_health_factor` VALUES (188, 2, 7, 21.50, 35.20, 38.20, 44.50, 55.20, 51.00);
INSERT INTO `t_health_factor` VALUES (189, 3, 7, 23.00, 29.50, 40.80, 42.50, 52.80, 49.20);
INSERT INTO `t_health_factor` VALUES (190, 4, 7, 24.80, 27.80, 42.50, 40.50, 51.00, 47.50);
INSERT INTO `t_health_factor` VALUES (191, 5, 7, 27.00, 25.50, 44.20, 39.20, 49.20, 45.80);
INSERT INTO `t_health_factor` VALUES (192, 6, 7, 22.80, 33.50, 38.00, 45.50, 55.80, 52.20);
INSERT INTO `t_health_factor` VALUES (193, 7, 7, 24.20, 31.20, 39.50, 43.80, 54.00, 49.80);
INSERT INTO `t_health_factor` VALUES (194, 8, 7, 23.00, 32.80, 38.80, 45.20, 55.00, 51.20);
INSERT INTO `t_health_factor` VALUES (195, 9, 7, 17.00, 29.50, 34.20, 50.00, 59.80, 57.00);
INSERT INTO `t_health_factor` VALUES (196, 10, 7, 20.80, 31.80, 37.20, 47.80, 58.20, 54.00);
INSERT INTO `t_health_factor` VALUES (197, 11, 7, 19.00, 30.50, 35.80, 49.00, 59.00, 55.20);
INSERT INTO `t_health_factor` VALUES (198, 12, 7, 22.20, 28.80, 39.20, 44.50, 53.20, 50.00);
INSERT INTO `t_health_factor` VALUES (199, 13, 7, 21.00, 27.50, 38.00, 46.20, 54.80, 51.80);
INSERT INTO `t_health_factor` VALUES (200, 14, 7, 23.50, 29.20, 40.20, 43.50, 52.00, 49.00);
INSERT INTO `t_health_factor` VALUES (201, 15, 7, 20.20, 32.50, 37.20, 46.50, 56.50, 53.20);
INSERT INTO `t_health_factor` VALUES (202, 16, 7, 22.00, 30.80, 39.80, 45.20, 54.20, 50.80);
INSERT INTO `t_health_factor` VALUES (203, 17, 7, 21.50, 31.50, 38.50, 45.80, 55.20, 52.00);
INSERT INTO `t_health_factor` VALUES (204, 18, 7, 20.00, 29.80, 37.20, 47.80, 57.00, 53.80);
INSERT INTO `t_health_factor` VALUES (205, 19, 7, 18.50, 33.20, 35.50, 50.20, 60.20, 56.00);
INSERT INTO `t_health_factor` VALUES (206, 20, 7, 23.00, 28.50, 40.50, 44.00, 51.80, 48.80);
INSERT INTO `t_health_factor` VALUES (207, 21, 7, 16.00, 27.00, 33.20, 53.00, 62.80, 59.20);
INSERT INTO `t_health_factor` VALUES (208, 22, 7, 21.20, 30.20, 37.80, 46.50, 56.00, 52.80);
INSERT INTO `t_health_factor` VALUES (209, 23, 7, 19.50, 32.50, 36.50, 48.20, 57.80, 54.20);
INSERT INTO `t_health_factor` VALUES (210, 24, 7, 20.80, 31.20, 38.20, 46.80, 56.80, 53.00);
INSERT INTO `t_health_factor` VALUES (211, 25, 7, 21.00, 29.80, 38.80, 45.50, 55.20, 51.80);
INSERT INTO `t_health_factor` VALUES (212, 26, 7, 15.00, 25.50, 31.20, 57.00, 67.00, 62.80);
INSERT INTO `t_health_factor` VALUES (213, 27, 7, 22.20, 29.50, 39.20, 44.80, 53.00, 50.20);
INSERT INTO `t_health_factor` VALUES (214, 28, 7, 20.20, 27.80, 37.20, 47.20, 56.20, 53.00);
INSERT INTO `t_health_factor` VALUES (215, 29, 7, 16.80, 23.50, 32.80, 53.20, 61.20, 58.00);
INSERT INTO `t_health_factor` VALUES (216, 30, 7, 19.80, 25.80, 34.20, 51.00, 59.00, 55.80);
INSERT INTO `t_health_factor` VALUES (217, 31, 7, 22.80, 27.20, 38.80, 44.50, 53.80, 51.00);

-- ----------------------------
-- Table structure for t_medical_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_medical_resource`;
CREATE TABLE `t_medical_resource`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_id` bigint(20) NOT NULL COMMENT '地区ID',
  `time_id` bigint(20) NOT NULL COMMENT '时间ID',
  `hospital_count` int(11) NULL DEFAULT NULL COMMENT '医疗机构数量',
  `bed_count` int(11) NULL DEFAULT NULL COMMENT '床位数',
  `doctor_count` int(11) NULL DEFAULT NULL COMMENT '执业医师数',
  `nurse_count` int(11) NULL DEFAULT NULL COMMENT '注册护士数',
  `health_expenditure` decimal(12, 2) NULL DEFAULT NULL COMMENT '卫生总费用(亿元)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_region_time`(`region_id` ASC, `time_id` ASC) USING BTREE,
  INDEX `idx_region_id`(`region_id` ASC) USING BTREE,
  INDEX `idx_time_id`(`time_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '医疗资源表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_medical_resource
-- ----------------------------
INSERT INTO `t_medical_resource` VALUES (1, 1, 1, 736, 128500, 98500, 125800, 2850.50);
INSERT INTO `t_medical_resource` VALUES (2, 2, 1, 425, 68200, 52300, 68500, 1520.80);
INSERT INTO `t_medical_resource` VALUES (3, 3, 1, 1856, 385200, 185600, 235800, 4250.60);
INSERT INTO `t_medical_resource` VALUES (4, 4, 1, 1285, 245600, 128500, 168200, 2850.40);
INSERT INTO `t_medical_resource` VALUES (5, 5, 1, 856, 158200, 82500, 105800, 1920.50);
INSERT INTO `t_medical_resource` VALUES (6, 6, 1, 1520, 298500, 152800, 198500, 3850.80);
INSERT INTO `t_medical_resource` VALUES (7, 7, 1, 1180, 225600, 118500, 152800, 2750.60);
INSERT INTO `t_medical_resource` VALUES (8, 8, 1, 1350, 268500, 135800, 178500, 3250.40);
INSERT INTO `t_medical_resource` VALUES (9, 9, 1, 685, 112500, 85200, 108500, 2650.80);
INSERT INTO `t_medical_resource` VALUES (10, 10, 1, 2850, 585200, 285800, 368500, 8520.60);
INSERT INTO `t_medical_resource` VALUES (11, 11, 1, 2650, 525800, 265800, 342500, 7850.40);
INSERT INTO `t_medical_resource` VALUES (12, 12, 1, 1680, 325600, 168500, 218800, 3850.80);
INSERT INTO `t_medical_resource` VALUES (13, 13, 1, 1385, 278500, 138800, 182500, 3250.60);
INSERT INTO `t_medical_resource` VALUES (14, 14, 1, 1520, 298500, 152500, 198800, 3650.40);
INSERT INTO `t_medical_resource` VALUES (15, 15, 1, 2850, 568200, 285800, 368500, 8250.80);
INSERT INTO `t_medical_resource` VALUES (16, 16, 1, 2680, 528500, 268800, 348500, 7850.60);
INSERT INTO `t_medical_resource` VALUES (17, 17, 1, 1985, 385200, 198800, 258800, 4850.40);
INSERT INTO `t_medical_resource` VALUES (18, 18, 1, 1850, 358500, 185800, 242500, 4520.80);
INSERT INTO `t_medical_resource` VALUES (19, 19, 1, 3250, 685200, 325800, 425800, 9850.60);
INSERT INTO `t_medical_resource` VALUES (20, 20, 1, 1385, 268500, 138800, 182500, 3250.40);
INSERT INTO `t_medical_resource` VALUES (21, 21, 1, 580, 98500, 58800, 78500, 1250.80);
INSERT INTO `t_medical_resource` VALUES (22, 22, 1, 1580, 312500, 158800, 205800, 3850.60);
INSERT INTO `t_medical_resource` VALUES (23, 23, 1, 2680, 528500, 268800, 348500, 7250.40);
INSERT INTO `t_medical_resource` VALUES (24, 24, 1, 1850, 358200, 185800, 242500, 4250.80);
INSERT INTO `t_medical_resource` VALUES (25, 25, 1, 1680, 328500, 168800, 218500, 3850.60);
INSERT INTO `t_medical_resource` VALUES (26, 26, 1, 285, 48500, 28800, 38500, 850.40);
INSERT INTO `t_medical_resource` VALUES (27, 27, 1, 1520, 298500, 152800, 198800, 3650.80);
INSERT INTO `t_medical_resource` VALUES (28, 28, 1, 1385, 275800, 138500, 182500, 3250.60);
INSERT INTO `t_medical_resource` VALUES (29, 29, 1, 385, 68500, 38800, 52500, 985.40);
INSERT INTO `t_medical_resource` VALUES (30, 30, 1, 425, 78500, 42800, 58500, 1120.80);
INSERT INTO `t_medical_resource` VALUES (31, 31, 1, 685, 125800, 68800, 92500, 1650.60);
INSERT INTO `t_medical_resource` VALUES (32, 1, 2, 752, 132800, 102500, 132800, 3050.80);
INSERT INTO `t_medical_resource` VALUES (33, 2, 2, 438, 72500, 55800, 72800, 1650.60);
INSERT INTO `t_medical_resource` VALUES (34, 3, 2, 1920, 402500, 192800, 245800, 4520.40);
INSERT INTO `t_medical_resource` VALUES (35, 4, 2, 1320, 258800, 132800, 175800, 3050.80);
INSERT INTO `t_medical_resource` VALUES (36, 5, 2, 885, 165800, 86800, 112500, 2050.60);
INSERT INTO `t_medical_resource` VALUES (37, 6, 2, 1580, 312800, 158800, 208500, 4050.40);
INSERT INTO `t_medical_resource` VALUES (38, 7, 2, 1220, 238500, 122800, 158800, 2920.80);
INSERT INTO `t_medical_resource` VALUES (39, 8, 2, 1395, 282500, 139800, 185800, 3420.60);
INSERT INTO `t_medical_resource` VALUES (40, 9, 2, 712, 118500, 89800, 115200, 2820.40);
INSERT INTO `t_medical_resource` VALUES (41, 10, 2, 2980, 612800, 298800, 385800, 8950.80);
INSERT INTO `t_medical_resource` VALUES (42, 11, 2, 2780, 552800, 278800, 362500, 8250.60);
INSERT INTO `t_medical_resource` VALUES (43, 12, 2, 1750, 342800, 175800, 228800, 4050.40);
INSERT INTO `t_medical_resource` VALUES (44, 13, 2, 1425, 292800, 142800, 192500, 3420.80);
INSERT INTO `t_medical_resource` VALUES (45, 14, 2, 1580, 312800, 158800, 208500, 3820.60);
INSERT INTO `t_medical_resource` VALUES (46, 15, 2, 2980, 595800, 298800, 388500, 8650.40);
INSERT INTO `t_medical_resource` VALUES (47, 16, 2, 2780, 552800, 278800, 368500, 8220.80);
INSERT INTO `t_medical_resource` VALUES (48, 17, 2, 2050, 402800, 205800, 268800, 5080.60);
INSERT INTO `t_medical_resource` VALUES (49, 18, 2, 1920, 375800, 192800, 252800, 4720.40);
INSERT INTO `t_medical_resource` VALUES (50, 19, 2, 3380, 712800, 338800, 445800, 10250.80);
INSERT INTO `t_medical_resource` VALUES (51, 20, 2, 1425, 282800, 142800, 192500, 3420.60);
INSERT INTO `t_medical_resource` VALUES (52, 21, 2, 608, 105800, 62800, 82800, 1320.40);
INSERT INTO `t_medical_resource` VALUES (53, 22, 2, 1650, 328800, 165800, 215800, 4050.80);
INSERT INTO `t_medical_resource` VALUES (54, 23, 2, 2780, 552800, 278800, 368500, 7620.60);
INSERT INTO `t_medical_resource` VALUES (55, 24, 2, 1920, 375800, 192800, 252800, 4450.40);
INSERT INTO `t_medical_resource` VALUES (56, 25, 2, 1750, 345800, 175800, 228800, 4050.80);
INSERT INTO `t_medical_resource` VALUES (57, 26, 2, 302, 52800, 30800, 42500, 902.60);
INSERT INTO `t_medical_resource` VALUES (58, 27, 2, 1580, 312800, 158800, 208500, 3820.40);
INSERT INTO `t_medical_resource` VALUES (59, 28, 2, 1425, 288800, 142800, 192500, 3420.80);
INSERT INTO `t_medical_resource` VALUES (60, 29, 2, 402, 72800, 40800, 56800, 1050.60);
INSERT INTO `t_medical_resource` VALUES (61, 30, 2, 442, 82800, 45200, 62800, 1185.40);
INSERT INTO `t_medical_resource` VALUES (62, 31, 2, 712, 132800, 72800, 98500, 1750.80);
INSERT INTO `t_medical_resource` VALUES (63, 1, 3, 768, 138500, 106800, 142800, 3280.60);
INSERT INTO `t_medical_resource` VALUES (64, 2, 3, 452, 78200, 59800, 78500, 1785.40);
INSERT INTO `t_medical_resource` VALUES (65, 3, 3, 1985, 422500, 198800, 258800, 4820.80);
INSERT INTO `t_medical_resource` VALUES (66, 4, 3, 1358, 272800, 136800, 185800, 3280.60);
INSERT INTO `t_medical_resource` VALUES (67, 5, 3, 918, 175800, 91200, 118800, 2185.40);
INSERT INTO `t_medical_resource` VALUES (68, 6, 3, 1645, 328800, 165800, 218800, 4280.80);
INSERT INTO `t_medical_resource` VALUES (69, 7, 3, 1265, 252800, 126800, 165800, 3120.60);
INSERT INTO `t_medical_resource` VALUES (70, 8, 3, 1445, 298800, 145800, 195800, 3620.40);
INSERT INTO `t_medical_resource` VALUES (71, 9, 3, 742, 125800, 94200, 122500, 3020.80);
INSERT INTO `t_medical_resource` VALUES (72, 10, 3, 3120, 645800, 312800, 408800, 9420.60);
INSERT INTO `t_medical_resource` VALUES (73, 11, 3, 2920, 582800, 292800, 385800, 8680.40);
INSERT INTO `t_medical_resource` VALUES (74, 12, 3, 1825, 362800, 182800, 242800, 4280.80);
INSERT INTO `t_medical_resource` VALUES (75, 13, 3, 1468, 308800, 146800, 202800, 3620.60);
INSERT INTO `t_medical_resource` VALUES (76, 14, 3, 1645, 328800, 165800, 218800, 4020.40);
INSERT INTO `t_medical_resource` VALUES (77, 15, 3, 3120, 625800, 312800, 412800, 9080.80);
INSERT INTO `t_medical_resource` VALUES (78, 16, 3, 2920, 582800, 292800, 392800, 8620.60);
INSERT INTO `t_medical_resource` VALUES (79, 17, 3, 2128, 425800, 212800, 282800, 5350.40);
INSERT INTO `t_medical_resource` VALUES (80, 18, 3, 1985, 395800, 198800, 265800, 4950.80);
INSERT INTO `t_medical_resource` VALUES (81, 19, 3, 3520, 745800, 352800, 468800, 10720.60);
INSERT INTO `t_medical_resource` VALUES (82, 20, 3, 1468, 298800, 146800, 202800, 3620.40);
INSERT INTO `t_medical_resource` VALUES (83, 21, 3, 638, 115800, 66800, 88500, 1420.80);
INSERT INTO `t_medical_resource` VALUES (84, 22, 3, 1725, 348800, 172800, 228800, 4280.60);
INSERT INTO `t_medical_resource` VALUES (85, 23, 3, 2920, 582800, 292800, 392800, 8020.40);
INSERT INTO `t_medical_resource` VALUES (86, 24, 3, 1985, 395800, 198800, 265800, 4680.80);
INSERT INTO `t_medical_resource` VALUES (87, 25, 3, 1825, 368800, 182800, 242800, 4280.60);
INSERT INTO `t_medical_resource` VALUES (88, 26, 3, 325, 58200, 32800, 46800, 968.40);
INSERT INTO `t_medical_resource` VALUES (89, 27, 3, 1645, 328800, 165800, 218800, 4020.80);
INSERT INTO `t_medical_resource` VALUES (90, 28, 3, 1468, 302800, 146800, 202800, 3620.60);
INSERT INTO `t_medical_resource` VALUES (91, 29, 3, 425, 78500, 43200, 61200, 1125.40);
INSERT INTO `t_medical_resource` VALUES (92, 30, 3, 465, 88500, 48200, 67200, 1265.80);
INSERT INTO `t_medical_resource` VALUES (93, 31, 3, 742, 142500, 76800, 105800, 1865.60);
INSERT INTO `t_medical_resource` VALUES (94, 1, 4, 788, 145800, 112500, 152800, 3520.40);
INSERT INTO `t_medical_resource` VALUES (95, 2, 4, 468, 82500, 64200, 82800, 1925.80);
INSERT INTO `t_medical_resource` VALUES (96, 3, 4, 2058, 445800, 205800, 272800, 5120.60);
INSERT INTO `t_medical_resource` VALUES (97, 4, 4, 1398, 288500, 139800, 195800, 3520.40);
INSERT INTO `t_medical_resource` VALUES (98, 5, 4, 952, 185800, 95800, 125800, 2325.80);
INSERT INTO `t_medical_resource` VALUES (99, 6, 4, 1715, 345800, 172800, 228800, 4520.60);
INSERT INTO `t_medical_resource` VALUES (100, 7, 4, 1308, 268500, 130800, 172800, 3320.40);
INSERT INTO `t_medical_resource` VALUES (101, 8, 4, 1495, 315800, 149800, 205800, 3820.80);
INSERT INTO `t_medical_resource` VALUES (102, 9, 4, 775, 132800, 98500, 128800, 3220.60);
INSERT INTO `t_medical_resource` VALUES (103, 10, 4, 3280, 682800, 328800, 432800, 9880.40);
INSERT INTO `t_medical_resource` VALUES (104, 11, 4, 3080, 615800, 308800, 408800, 9120.80);
INSERT INTO `t_medical_resource` VALUES (105, 12, 4, 1905, 382800, 190800, 258800, 4520.60);
INSERT INTO `t_medical_resource` VALUES (106, 13, 4, 1512, 325800, 151800, 212800, 3820.40);
INSERT INTO `t_medical_resource` VALUES (107, 14, 4, 1715, 345800, 172800, 228800, 4220.80);
INSERT INTO `t_medical_resource` VALUES (108, 15, 4, 3280, 658800, 328800, 438800, 9520.60);
INSERT INTO `t_medical_resource` VALUES (109, 16, 4, 3080, 615800, 308800, 418800, 9020.40);
INSERT INTO `t_medical_resource` VALUES (110, 17, 4, 2208, 448800, 220800, 298800, 5620.80);
INSERT INTO `t_medical_resource` VALUES (111, 18, 4, 2058, 418800, 205800, 278800, 5180.60);
INSERT INTO `t_medical_resource` VALUES (112, 19, 4, 3680, 782800, 368800, 492800, 11220.40);
INSERT INTO `t_medical_resource` VALUES (113, 20, 4, 1512, 315800, 151800, 212800, 3820.80);
INSERT INTO `t_medical_resource` VALUES (114, 21, 4, 668, 122800, 70800, 94200, 1520.60);
INSERT INTO `t_medical_resource` VALUES (115, 22, 4, 1805, 368800, 180800, 242800, 4520.40);
INSERT INTO `t_medical_resource` VALUES (116, 23, 4, 3080, 615800, 308800, 418800, 8420.80);
INSERT INTO `t_medical_resource` VALUES (117, 24, 4, 2058, 418800, 205800, 278800, 4920.60);
INSERT INTO `t_medical_resource` VALUES (118, 25, 4, 1905, 388800, 190800, 258800, 4520.40);
INSERT INTO `t_medical_resource` VALUES (119, 26, 4, 352, 62800, 35200, 51200, 1040.80);
INSERT INTO `t_medical_resource` VALUES (120, 27, 4, 1715, 345800, 172800, 228800, 4220.60);
INSERT INTO `t_medical_resource` VALUES (121, 28, 4, 1512, 318800, 151800, 212800, 3820.40);
INSERT INTO `t_medical_resource` VALUES (122, 29, 4, 452, 85200, 46500, 65800, 1205.80);
INSERT INTO `t_medical_resource` VALUES (123, 30, 4, 492, 94200, 51800, 72200, 1355.60);
INSERT INTO `t_medical_resource` VALUES (124, 31, 4, 775, 152800, 81200, 112800, 1985.40);
INSERT INTO `t_medical_resource` VALUES (125, 1, 5, 812, 155800, 118800, 162800, 3780.80);
INSERT INTO `t_medical_resource` VALUES (126, 2, 5, 488, 88500, 68800, 88200, 2085.60);
INSERT INTO `t_medical_resource` VALUES (127, 3, 5, 2138, 472800, 213800, 288800, 5450.40);
INSERT INTO `t_medical_resource` VALUES (128, 4, 5, 1442, 305800, 144200, 208800, 3780.80);
INSERT INTO `t_medical_resource` VALUES (129, 5, 5, 988, 198500, 99800, 135200, 2485.60);
INSERT INTO `t_medical_resource` VALUES (130, 6, 5, 1788, 365800, 179800, 242800, 4780.40);
INSERT INTO `t_medical_resource` VALUES (131, 7, 5, 1355, 285800, 135500, 182800, 3540.80);
INSERT INTO `t_medical_resource` VALUES (132, 8, 5, 1548, 335800, 154800, 218800, 4050.60);
INSERT INTO `t_medical_resource` VALUES (133, 9, 5, 808, 142800, 103500, 138200, 3450.40);
INSERT INTO `t_medical_resource` VALUES (134, 10, 5, 3450, 725800, 345800, 458800, 10380.80);
INSERT INTO `t_medical_resource` VALUES (135, 11, 5, 3250, 652800, 325800, 435800, 9580.60);
INSERT INTO `t_medical_resource` VALUES (136, 12, 5, 1988, 405800, 198800, 275800, 4780.40);
INSERT INTO `t_medical_resource` VALUES (137, 13, 5, 1558, 345800, 155800, 225800, 4050.80);
INSERT INTO `t_medical_resource` VALUES (138, 14, 5, 1788, 365800, 179800, 242800, 4450.60);
INSERT INTO `t_medical_resource` VALUES (139, 15, 5, 3450, 695800, 345800, 468800, 10020.40);
INSERT INTO `t_medical_resource` VALUES (140, 16, 5, 3250, 652800, 325800, 442800, 9450.80);
INSERT INTO `t_medical_resource` VALUES (141, 17, 5, 2298, 475800, 229800, 318800, 5920.60);
INSERT INTO `t_medical_resource` VALUES (142, 18, 5, 2138, 445800, 213800, 298800, 5420.40);
INSERT INTO `t_medical_resource` VALUES (143, 19, 5, 3850, 825800, 385800, 518800, 11780.80);
INSERT INTO `t_medical_resource` VALUES (144, 20, 5, 1558, 335800, 155800, 225800, 4050.60);
INSERT INTO `t_medical_resource` VALUES (145, 21, 5, 698, 132800, 74800, 102500, 1630.40);
INSERT INTO `t_medical_resource` VALUES (146, 22, 5, 1888, 392800, 188800, 258800, 4780.80);
INSERT INTO `t_medical_resource` VALUES (147, 23, 5, 3250, 652800, 325800, 442800, 8850.60);
INSERT INTO `t_medical_resource` VALUES (148, 24, 5, 2138, 445800, 213800, 298800, 5180.40);
INSERT INTO `t_medical_resource` VALUES (149, 25, 5, 1988, 412800, 198800, 275800, 4780.80);
INSERT INTO `t_medical_resource` VALUES (150, 26, 5, 378, 68500, 38200, 56500, 1120.60);
INSERT INTO `t_medical_resource` VALUES (151, 27, 5, 1788, 365800, 179800, 242800, 4450.40);
INSERT INTO `t_medical_resource` VALUES (152, 28, 5, 1558, 338800, 155800, 225800, 4050.80);
INSERT INTO `t_medical_resource` VALUES (153, 29, 5, 482, 92800, 49800, 71200, 1300.60);
INSERT INTO `t_medical_resource` VALUES (154, 30, 5, 525, 102800, 55800, 78800, 1460.40);
INSERT INTO `t_medical_resource` VALUES (155, 31, 5, 808, 165800, 86200, 122800, 2120.80);
INSERT INTO `t_medical_resource` VALUES (156, 1, 6, 838, 168500, 125800, 175800, 4050.60);
INSERT INTO `t_medical_resource` VALUES (157, 2, 6, 508, 95200, 73800, 95200, 2250.40);
INSERT INTO `t_medical_resource` VALUES (158, 3, 6, 2225, 502800, 222800, 305800, 5820.80);
INSERT INTO `t_medical_resource` VALUES (159, 4, 6, 1488, 325800, 148800, 222800, 4050.60);
INSERT INTO `t_medical_resource` VALUES (160, 5, 6, 1028, 212800, 104500, 145800, 2660.40);
INSERT INTO `t_medical_resource` VALUES (161, 6, 6, 1868, 388800, 187800, 258800, 5060.80);
INSERT INTO `t_medical_resource` VALUES (162, 7, 6, 1405, 305800, 140800, 195800, 3780.60);
INSERT INTO `t_medical_resource` VALUES (163, 8, 6, 1605, 358800, 160800, 232800, 4300.40);
INSERT INTO `t_medical_resource` VALUES (164, 9, 6, 842, 155200, 108800, 148500, 3700.80);
INSERT INTO `t_medical_resource` VALUES (165, 10, 6, 3650, 772800, 365800, 488800, 10920.60);
INSERT INTO `t_medical_resource` VALUES (166, 11, 6, 3420, 695800, 342800, 465800, 10080.40);
INSERT INTO `t_medical_resource` VALUES (167, 12, 6, 2078, 432800, 207800, 295800, 5060.80);
INSERT INTO `t_medical_resource` VALUES (168, 13, 6, 1608, 368800, 160800, 242800, 4300.60);
INSERT INTO `t_medical_resource` VALUES (169, 14, 6, 1868, 388800, 187800, 258800, 4700.40);
INSERT INTO `t_medical_resource` VALUES (170, 15, 6, 3650, 742800, 365800, 498800, 10580.80);
INSERT INTO `t_medical_resource` VALUES (171, 16, 6, 3420, 695800, 342800, 472800, 9920.60);
INSERT INTO `t_medical_resource` VALUES (172, 17, 6, 2398, 508800, 239800, 342800, 6240.40);
INSERT INTO `t_medical_resource` VALUES (173, 18, 6, 2225, 478800, 222800, 322800, 5720.80);
INSERT INTO `t_medical_resource` VALUES (174, 19, 6, 4050, 875800, 405800, 548800, 12380.60);
INSERT INTO `t_medical_resource` VALUES (175, 20, 6, 1608, 358800, 160800, 242800, 4300.40);
INSERT INTO `t_medical_resource` VALUES (176, 21, 6, 732, 145200, 79200, 112500, 1750.80);
INSERT INTO `t_medical_resource` VALUES (177, 22, 6, 1978, 422800, 197800, 278800, 5060.60);
INSERT INTO `t_medical_resource` VALUES (178, 23, 6, 3420, 695800, 342800, 472800, 9320.40);
INSERT INTO `t_medical_resource` VALUES (179, 24, 6, 2225, 478800, 222800, 322800, 5480.80);
INSERT INTO `t_medical_resource` VALUES (180, 25, 6, 2078, 438800, 207800, 295800, 5060.60);
INSERT INTO `t_medical_resource` VALUES (181, 26, 6, 405, 75200, 41200, 62500, 1210.40);
INSERT INTO `t_medical_resource` VALUES (182, 27, 6, 1868, 388800, 187800, 258800, 4700.80);
INSERT INTO `t_medical_resource` VALUES (183, 28, 6, 1608, 362800, 160800, 242800, 4300.60);
INSERT INTO `t_medical_resource` VALUES (184, 29, 6, 512, 102500, 53800, 78200, 1400.40);
INSERT INTO `t_medical_resource` VALUES (185, 30, 6, 562, 112800, 60200, 86200, 1580.80);
INSERT INTO `t_medical_resource` VALUES (186, 31, 6, 842, 178500, 92200, 135800, 2280.60);
INSERT INTO `t_medical_resource` VALUES (187, 1, 7, 865, 182500, 132800, 188800, 4350.40);
INSERT INTO `t_medical_resource` VALUES (188, 2, 7, 528, 102800, 79200, 102800, 2420.80);
INSERT INTO `t_medical_resource` VALUES (189, 3, 7, 2318, 535800, 231800, 325800, 6220.60);
INSERT INTO `t_medical_resource` VALUES (190, 4, 7, 1538, 348800, 153800, 238800, 4350.40);
INSERT INTO `t_medical_resource` VALUES (191, 5, 7, 1072, 228800, 109500, 158500, 2850.80);
INSERT INTO `t_medical_resource` VALUES (192, 6, 7, 1958, 415800, 196800, 278800, 5380.60);
INSERT INTO `t_medical_resource` VALUES (193, 7, 7, 1458, 328800, 145800, 212800, 4050.40);
INSERT INTO `t_medical_resource` VALUES (194, 8, 7, 1668, 385800, 166800, 248800, 4580.80);
INSERT INTO `t_medical_resource` VALUES (195, 9, 7, 878, 168500, 114500, 162500, 3980.60);
INSERT INTO `t_medical_resource` VALUES (196, 10, 7, 3880, 825800, 388800, 522800, 11520.40);
INSERT INTO `t_medical_resource` VALUES (197, 11, 7, 3620, 742800, 362800, 498800, 10620.80);
INSERT INTO `t_medical_resource` VALUES (198, 12, 7, 2178, 462800, 217800, 318800, 5380.60);
INSERT INTO `t_medical_resource` VALUES (199, 13, 7, 1668, 395800, 166800, 262800, 4580.40);
INSERT INTO `t_medical_resource` VALUES (200, 14, 7, 1958, 415800, 196800, 278800, 4980.80);
INSERT INTO `t_medical_resource` VALUES (201, 15, 7, 3880, 795800, 388800, 532800, 11180.60);
INSERT INTO `t_medical_resource` VALUES (202, 16, 7, 3620, 742800, 362800, 508800, 10420.40);
INSERT INTO `t_medical_resource` VALUES (203, 17, 7, 2508, 542800, 250800, 368800, 6600.80);
INSERT INTO `t_medical_resource` VALUES (204, 18, 7, 2318, 512800, 231800, 348800, 6050.60);
INSERT INTO `t_medical_resource` VALUES (205, 19, 7, 4280, 932800, 428800, 582800, 13020.40);
INSERT INTO `t_medical_resource` VALUES (206, 20, 7, 1668, 385800, 166800, 262800, 4580.80);
INSERT INTO `t_medical_resource` VALUES (207, 21, 7, 768, 158500, 84200, 122800, 1880.60);
INSERT INTO `t_medical_resource` VALUES (208, 22, 7, 2078, 455800, 207800, 302800, 5380.40);
INSERT INTO `t_medical_resource` VALUES (209, 23, 7, 3620, 742800, 362800, 508800, 9850.80);
INSERT INTO `t_medical_resource` VALUES (210, 24, 7, 2318, 512800, 231800, 348800, 5820.60);
INSERT INTO `t_medical_resource` VALUES (211, 25, 7, 2178, 468800, 217800, 318800, 5380.40);
INSERT INTO `t_medical_resource` VALUES (212, 26, 7, 435, 82500, 44500, 69500, 1300.80);
INSERT INTO `t_medical_resource` VALUES (213, 27, 7, 1958, 415800, 196800, 278800, 4980.60);
INSERT INTO `t_medical_resource` VALUES (214, 28, 7, 1668, 388800, 166800, 262800, 4580.40);
INSERT INTO `t_medical_resource` VALUES (215, 29, 7, 545, 112800, 58200, 86200, 1510.80);
INSERT INTO `t_medical_resource` VALUES (216, 30, 7, 598, 125800, 65200, 95200, 1720.60);
INSERT INTO `t_medical_resource` VALUES (217, 31, 7, 878, 195800, 98500, 152500, 2450.40);

-- ----------------------------
-- Table structure for t_population
-- ----------------------------
DROP TABLE IF EXISTS `t_population`;
CREATE TABLE `t_population`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `age_group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年龄段',
  `age_min` int(11) NOT NULL COMMENT '最小年龄',
  `age_max` int(11) NOT NULL COMMENT '最大年龄',
  `gender` tinyint(4) NOT NULL COMMENT '性别：0-不限 1-男 2-女',
  `gender_name` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别名称',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_age_gender`(`age_group` ASC, `gender` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '人群维度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_population
-- ----------------------------
INSERT INTO `t_population` VALUES (1, '0-17岁', 0, 17, 0, '不限');
INSERT INTO `t_population` VALUES (2, '18-34岁', 18, 34, 0, '不限');
INSERT INTO `t_population` VALUES (3, '35-49岁', 35, 49, 0, '不限');
INSERT INTO `t_population` VALUES (4, '50-64岁', 50, 64, 0, '不限');
INSERT INTO `t_population` VALUES (5, '65岁以上', 65, 100, 0, '不限');
INSERT INTO `t_population` VALUES (6, '18-34岁', 18, 34, 1, '男');
INSERT INTO `t_population` VALUES (7, '18-34岁', 18, 34, 2, '女');
INSERT INTO `t_population` VALUES (8, '35-49岁', 35, 49, 1, '男');
INSERT INTO `t_population` VALUES (9, '35-49岁', 35, 49, 2, '女');
INSERT INTO `t_population` VALUES (10, '50-64岁', 50, 64, 1, '男');
INSERT INTO `t_population` VALUES (11, '50-64岁', 50, 64, 2, '女');
INSERT INTO `t_population` VALUES (12, '65岁以上', 65, 100, 1, '男');
INSERT INTO `t_population` VALUES (13, '65岁以上', 65, 100, 2, '女');

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `region_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地区编码',
  `region_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '地区名称',
  `parent_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父级地区编码',
  `region_level` tinyint(4) NOT NULL COMMENT '层级：1-省 2-市 3-县',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_region_code`(`region_code` ASC) USING BTREE,
  INDEX `idx_parent_code`(`parent_code` ASC) USING BTREE,
  INDEX `idx_region_level`(`region_level` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '地区信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_region
-- ----------------------------
INSERT INTO `t_region` VALUES (1, '110000', '北京市', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (2, '120000', '天津市', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (3, '130000', '河北省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (4, '140000', '山西省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (5, '150000', '内蒙古自治区', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (6, '210000', '辽宁省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (7, '220000', '吉林省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (8, '230000', '黑龙江省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (9, '310000', '上海市', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (10, '320000', '江苏省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (11, '330000', '浙江省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (12, '340000', '安徽省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (13, '350000', '福建省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (14, '360000', '江西省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (15, '370000', '山东省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (16, '410000', '河南省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (17, '420000', '湖北省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (18, '430000', '湖南省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (19, '440000', '广东省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (20, '450000', '广西壮族自治区', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (21, '460000', '海南省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (22, '500000', '重庆市', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (23, '510000', '四川省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (24, '520000', '贵州省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (25, '530000', '云南省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (26, '540000', '西藏自治区', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (27, '610000', '陕西省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (28, '620000', '甘肃省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (29, '630000', '青海省', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (30, '640000', '宁夏回族自治区', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);
INSERT INTO `t_region` VALUES (31, '650000', '新疆维吾尔自治区', NULL, 1, '2026-06-04 11:26:26', '2026-06-04 11:26:26', 1);

-- ----------------------------
-- Table structure for t_time
-- ----------------------------
DROP TABLE IF EXISTS `t_time`;
CREATE TABLE `t_time`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `year` int(11) NOT NULL COMMENT '年份',
  `quarter` tinyint(4) NULL DEFAULT NULL COMMENT '季度',
  `month` tinyint(4) NULL DEFAULT NULL COMMENT '月份',
  `year_quarter` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '年季度',
  `year_month` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年月',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_year_quarter`(`year_quarter` ASC) USING BTREE,
  INDEX `idx_year`(`year` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '时间维度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_time
-- ----------------------------
INSERT INTO `t_time` VALUES (1, 2018, NULL, NULL, '2018', NULL);
INSERT INTO `t_time` VALUES (2, 2019, NULL, NULL, '2019', NULL);
INSERT INTO `t_time` VALUES (3, 2020, NULL, NULL, '2020', NULL);
INSERT INTO `t_time` VALUES (4, 2021, NULL, NULL, '2021', NULL);
INSERT INTO `t_time` VALUES (5, 2022, NULL, NULL, '2022', NULL);
INSERT INTO `t_time` VALUES (6, 2023, NULL, NULL, '2023', NULL);
INSERT INTO `t_time` VALUES (7, 2024, NULL, NULL, '2024', NULL);

SET FOREIGN_KEY_CHECKS = 1;
