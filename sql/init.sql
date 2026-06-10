-- ===========================================
-- 慢性病分析项目 - 数据库初始化脚本
-- ===========================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS chronic_disease_db
    DEFAULT CHARACTER SET utf8mb4
    DEFAULT COLLATE utf8mb4_general_ci;

-- 使用数据库
USE chronic_disease_db;

-- 设置字符集
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ===========================================
-- 1. 地区信息表
-- ===========================================
DROP TABLE IF EXISTS t_region;
CREATE TABLE t_region (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    region_code VARCHAR(10) NOT NULL COMMENT '地区编码',
    region_name VARCHAR(50) NOT NULL COMMENT '地区名称',
    parent_code VARCHAR(10) DEFAULT NULL COMMENT '父级地区编码',
    region_level TINYINT NOT NULL COMMENT '层级：1-省 2-市 3-县',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    status TINYINT DEFAULT 1 COMMENT '状态：0-禁用 1-启用',
    UNIQUE KEY uk_region_code (region_code),
    KEY idx_parent_code (parent_code),
    KEY idx_region_level (region_level)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区信息表';

-- 插入省份数据
INSERT INTO t_region (region_code, region_name, parent_code, region_level) VALUES
('110000', '北京市', NULL, 1),
('120000', '天津市', NULL, 1),
('130000', '河北省', NULL, 1),
('140000', '山西省', NULL, 1),
('150000', '内蒙古自治区', NULL, 1),
('210000', '辽宁省', NULL, 1),
('220000', '吉林省', NULL, 1),
('230000', '黑龙江省', NULL, 1),
('310000', '上海市', NULL, 1),
('320000', '江苏省', NULL, 1),
('330000', '浙江省', NULL, 1),
('340000', '安徽省', NULL, 1),
('350000', '福建省', NULL, 1),
('360000', '江西省', NULL, 1),
('370000', '山东省', NULL, 1),
('410000', '河南省', NULL, 1),
('420000', '湖北省', NULL, 1),
('430000', '湖南省', NULL, 1),
('440000', '广东省', NULL, 1),
('450000', '广西壮族自治区', NULL, 1),
('460000', '海南省', NULL, 1),
('500000', '重庆市', NULL, 1),
('510000', '四川省', NULL, 1),
('520000', '贵州省', NULL, 1),
('530000', '云南省', NULL, 1),
('540000', '西藏自治区', NULL, 1),
('610000', '陕西省', NULL, 1),
('620000', '甘肃省', NULL, 1),
('630000', '青海省', NULL, 1),
('640000', '宁夏回族自治区', NULL, 1),
('650000', '新疆维吾尔自治区', NULL, 1);

-- ===========================================
-- 2. 时间维度表
-- ===========================================
DROP TABLE IF EXISTS t_time;
CREATE TABLE t_time (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    year INT NOT NULL COMMENT '年份',
    quarter TINYINT DEFAULT NULL COMMENT '季度',
    month TINYINT DEFAULT NULL COMMENT '月份',
    year_quarter VARCHAR(10) NOT NULL COMMENT '年季度',
    year_month VARCHAR(10) DEFAULT NULL COMMENT '年月',
    UNIQUE KEY uk_year_quarter (year_quarter),
    KEY idx_year (year)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='时间维度表';

-- 插入年份数据
INSERT INTO t_time (year, year_quarter) VALUES
(2018, '2018'),
(2019, '2019'),
(2020, '2020'),
(2021, '2021'),
(2022, '2022'),
(2023, '2023'),
(2024, '2024');

-- ===========================================
-- 3. 人群维度表
-- ===========================================
DROP TABLE IF EXISTS t_population;
CREATE TABLE t_population (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    age_group VARCHAR(30) NOT NULL COMMENT '年龄段',
    age_min INT NOT NULL COMMENT '最小年龄',
    age_max INT NOT NULL COMMENT '最大年龄',
    gender TINYINT NOT NULL COMMENT '性别：0-不限 1-男 2-女',
    gender_name VARCHAR(10) NOT NULL COMMENT '性别名称',
    UNIQUE KEY uk_age_gender (age_group, gender)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='人群维度表';

-- 插入人群维度数据
INSERT INTO t_population (age_group, age_min, age_max, gender, gender_name) VALUES
('0-17岁', 0, 17, 0, '不限'),
('18-34岁', 18, 34, 0, '不限'),
('35-49岁', 35, 49, 0, '不限'),
('50-64岁', 50, 64, 0, '不限'),
('65岁以上', 65, 100, 0, '不限'),
('18-34岁', 18, 34, 1, '男'),
('18-34岁', 18, 34, 2, '女'),
('35-49岁', 35, 49, 1, '男'),
('35-49岁', 35, 49, 2, '女'),
('50-64岁', 50, 64, 1, '男'),
('50-64岁', 50, 64, 2, '女'),
('65岁以上', 65, 100, 1, '男'),
('65岁以上', 65, 100, 2, '女');

-- ===========================================
-- 4. 慢性病类型表
-- ===========================================
DROP TABLE IF EXISTS t_disease_type;
CREATE TABLE t_disease_type (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    disease_code VARCHAR(20) NOT NULL COMMENT '疾病编码',
    disease_name VARCHAR(50) NOT NULL COMMENT '疾病名称',
    disease_category VARCHAR(30) NOT NULL COMMENT '疾病分类',
    description VARCHAR(200) DEFAULT NULL COMMENT '疾病描述',
    UNIQUE KEY uk_disease_code (disease_code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='慢性病类型表';

-- 插入慢性病类型数据
INSERT INTO t_disease_type (disease_code, disease_name, disease_category, description) VALUES
('HYP', '高血压', '心血管疾病', '以动脉血压持续升高为主要特征的慢性病'),
('DIA', '糖尿病', '代谢性疾病', '以血糖升高为主要特征的代谢性疾病'),
('CHD', '冠心病', '心血管疾病', '冠状动脉粥样硬化性心脏病'),
('CER', '脑卒中', '心血管疾病', '脑血管意外，包括脑梗死和脑出血'),
('COP', '慢性阻塞性肺疾病', '呼吸系统疾病', '以气流受限为特征的慢性呼吸系统疾病'),
('CAN', '癌症', '恶性肿瘤', '各种恶性肿瘤的总称');

-- ===========================================
-- 5. 慢性病数据事实表
-- ===========================================
DROP TABLE IF EXISTS t_chronic_disease_data;
CREATE TABLE t_chronic_disease_data (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    region_id BIGINT NOT NULL COMMENT '地区ID',
    time_id BIGINT NOT NULL COMMENT '时间ID',
    disease_id BIGINT NOT NULL COMMENT '疾病ID',
    population_id BIGINT NOT NULL COMMENT '人群ID',
    prevalence_rate DECIMAL(10,4) DEFAULT NULL COMMENT '患病率(%)',
    incidence_rate DECIMAL(10,4) DEFAULT NULL COMMENT '发病率(%)',
    mortality_rate DECIMAL(10,4) DEFAULT NULL COMMENT '死亡率(%)',
    sample_size INT DEFAULT NULL COMMENT '样本量',
    data_source VARCHAR(100) DEFAULT NULL COMMENT '数据来源',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    KEY idx_region_id (region_id),
    KEY idx_time_id (time_id),
    KEY idx_disease_id (disease_id),
    KEY idx_population_id (population_id),
    KEY idx_composite (region_id, time_id, disease_id, population_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='慢性病数据事实表';

-- 插入示例数据（高血压 - 北京 - 2024 - 全年龄段 - 不限性别）
INSERT INTO t_chronic_disease_data (region_id, time_id, disease_id, population_id, prevalence_rate, incidence_rate, mortality_rate, sample_size, data_source)
SELECT
    r.id AS region_id,
    t.id AS time_id,
    d.id AS disease_id,
    p.id AS population_id,
    ROUND(10 + RAND() * 20, 2) AS prevalence_rate,
    ROUND(2 + RAND() * 8, 2) AS incidence_rate,
    ROUND(0.5 + RAND() * 3, 2) AS mortality_rate,
    FLOOR(1000 + RAND() * 9000) AS sample_size,
    '国家统计局' AS data_source
FROM t_region r
CROSS JOIN t_time t
CROSS JOIN t_disease_type d
CROSS JOIN t_population p
WHERE r.region_level = 1
  AND p.gender = 0
  AND t.year = 2024
LIMIT 200;

-- ===========================================
-- 6. 医疗资源表
-- ===========================================
DROP TABLE IF EXISTS t_medical_resource;
CREATE TABLE t_medical_resource (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    region_id BIGINT NOT NULL COMMENT '地区ID',
    time_id BIGINT NOT NULL COMMENT '时间ID',
    hospital_count INT DEFAULT NULL COMMENT '医疗机构数量',
    bed_count INT DEFAULT NULL COMMENT '床位数',
    doctor_count INT DEFAULT NULL COMMENT '执业医师数',
    nurse_count INT DEFAULT NULL COMMENT '注册护士数',
    health_expenditure DECIMAL(12,2) DEFAULT NULL COMMENT '卫生总费用(亿元)',
    KEY idx_region_id (region_id),
    KEY idx_time_id (time_id),
    UNIQUE KEY uk_region_time (region_id, time_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='医疗资源表';

-- ===========================================
-- 7. 健康影响因素表
-- ===========================================
DROP TABLE IF EXISTS t_health_factor;
CREATE TABLE t_health_factor (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '主键ID',
    region_id BIGINT NOT NULL COMMENT '地区ID',
    time_id BIGINT NOT NULL COMMENT '时间ID',
    smoking_rate DECIMAL(5,2) DEFAULT NULL COMMENT '吸烟率(%)',
    drinking_rate DECIMAL(5,2) DEFAULT NULL COMMENT '饮酒率(%)',
    obesity_rate DECIMAL(5,2) DEFAULT NULL COMMENT '肥胖率(%)',
    exercise_rate DECIMAL(5,2) DEFAULT NULL COMMENT '经常锻炼率(%)',
    hypertension_rate DECIMAL(5,2) DEFAULT NULL COMMENT '高血压知晓率(%)',
    diabetes_rate DECIMAL(5,2) DEFAULT NULL COMMENT '糖尿病知晓率(%)',
    KEY idx_region_id (region_id),
    KEY idx_time_id (time_id),
    UNIQUE KEY uk_region_time (region_id, time_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='健康影响因素表';

SET FOREIGN_KEY_CHECKS = 1;

-- 完成提示
SELECT '数据库初始化完成！' AS message;
SELECT COUNT(*) AS '地区数量' FROM t_region WHERE region_level = 1;
SELECT COUNT(*) AS '时间维度数量' FROM t_time;
SELECT COUNT(*) AS '人群维度数量' FROM t_population;
SELECT COUNT(*) AS '病种数量' FROM t_disease_type;
SELECT COUNT(*) AS '慢性病数据量' FROM t_chronic_disease_data;
