# 基于公开数据的中国居民慢性病分布分析与可视化系统

## 项目概述

本项目旨在利用大数据技术，基于公开医疗健康数据，对中国居民慢性病（高血压、糖尿病等）的分布情况进行分析，并通过可视化技术直观展示分析结果。

## 技术栈

### 后端技术
- **开发框架**: Spring Boot 2.7.18
- **ORM框架**: MyBatis-Plus 3.5.5
- **数据库**: MySQL 8.0
- **JDK版本**: JDK 1.8
- **构建工具**: Maven 3.8+
- **API文档**: Knife4j (Swagger)
- **工具类**: Hutool、Lombok

### 前端技术
- **开发框架**: Vue 2.7
- **UI组件库**: Element UI 2.15
- **图表库**: ECharts 5.4
- **HTTP库**: Axios
- **路由**: Vue Router
- **状态管理**: Vuex

## 项目结构

```
chronic-disease-analysis/
├── backend/                          # 后端项目
│   ├── src/main/java/com/chronic/
│   │   ├── controller/              # 控制层
│   │   ├── service/                 # 服务层接口
│   │   │   └── impl/               # 服务层实现类
│   │   ├── mapper/                  # 数据访问层
│   │   ├── entity/                  # 实体类
│   │   ├── config/                  # 配置类
│   │   ├── common/                  # 公共类（封装类、异常处理等）
│   │   └── ChronicDiseaseApplication.java  # 启动类
│   ├── src/main/resources/
│   │   └── application.yml          # 配置文件
│   └── pom.xml                      # Maven配置
├── frontend/                         # 前端项目
│   ├── src/
│   │   ├── api/                     # API接口
│   │   ├── views/                   # 页面组件
│   │   ├── router/                  # 路由配置
│   │   ├── store/                   # Vuex状态管理
│   │   └── styles/                  # 全局样式
│   └── package.json
├── sql/                              # 数据库脚本
│   └── init.sql                     # 初始化脚本
└── README.md                         # 项目说明
```

## 快速开始

### 1. 环境准备

- JDK 1.8+
- Maven 3.8+
- MySQL 8.0+
- Node.js 14+
- npm 或 yarn

### 2. 数据库初始化

```bash
# 登录MySQL
mysql -u root -p

# 执行初始化脚本
source D:/Project/chronic-disease-analysis/sql/init.sql
```

### 3. 后端启动

```bash
cd backend

# 修改数据库配置（如需要）
# 编辑 src/main/resources/application.yml

# 编译打包
mvn clean package -DskipTests

# 启动应用
java -jar target/chronic-disease-analysis-1.0.0.jar
```

后端启动后访问API文档：http://localhost:8080/doc.html

### 4. 前端启动

```bash
cd frontend

# 安装依赖
npm install

# 启动开发服务器
npm run serve
```

前端启动后访问：http://localhost:8081

## API接口文档

### 地区信息接口
| 接口 | 方法 | 说明 |
|------|------|------|
| /api/region/provinces | GET | 获取所有省份列表 |
| /api/region/children/{parentCode} | GET | 获取下级地区列表 |
| /api/region/tree | GET | 获取地区树形结构 |
| /api/region/{id} | GET | 获取地区详情 |

### 慢性病数据接口
| 接口 | 方法 | 说明 |
|------|------|------|
| /api/disease/page | GET | 分页查询数据 |
| /api/disease/prevalence/province | GET | 获取各省份患病率 |
| /api/disease/prevalence/trend | GET | 获取患病率趋势 |
| /api/disease/prevalence/age | GET | 获取年龄段分布 |
| /api/disease/comparison | GET | 获取病种对比 |
| /api/disease/top10 | GET | 获取Top10排名 |

### 慢性病类型接口
| 接口 | 方法 | 说明 |
|------|------|------|
| /api/disease-type/list | GET | 获取所有病种类型 |
| /api/disease-type/{id} | GET | 获取病种详情 |
| /api/disease-type/code/{code} | GET | 根据编码获取 |

### 时间维度接口
| 接口 | 方法 | 说明 |
|------|------|------|
| /api/time/years | GET | 获取年份列表 |
| /api/time/quarters/{year} | GET | 获取季度列表 |

### 人群维度接口
| 接口 | 方法 | 说明 |
|------|------|------|
| /api/population/age-groups | GET | 获取年龄段列表 |
| /api/population/genders | GET | 获取性别列表 |

### 仪表盘接口
| 接口 | 方法 | 说明 |
|------|------|------|
| /api/dashboard/statistics | GET | 获取统计数据 |
| /api/dashboard/disease-types | GET | 获取病种列表 |

## 数据库设计

### 数据表结构

| 表名 | 说明 | 预估数据量 |
|------|------|-----------|
| t_region | 地区信息表 | 5,000条 |
| t_time | 时间维度表 | 100条 |
| t_population | 人群维度表 | 500条 |
| t_disease_type | 慢性病类型表 | 20条 |
| t_chronic_disease_data | 慢性病数据事实表 | 500,000条 |
| t_medical_resource | 医疗资源表 | 20,000条 |
| t_health_factor | 健康影响因素表 | 50,000条 |

## 功能模块

1. **首页概览** - 展示关键统计指标和图表
2. **地图分析** - 中国地图展示各省份患病率分布
3. **趋势分析** - 展示患病率随时间变化趋势
4. **病种对比** - 对比不同慢性病的患病情况
5. **数据查询** - 分页查询明细数据

## 开发规范

### 后端规范
- 控制层：`@RestController` + `@RequestMapping`
- 服务层：接口 + 实现类分离
- 数据访问层：继承`BaseMapper`
- 统一返回：使用`Result<T>`封装
- 异常处理：全局异常处理器

### 前端规范
- 组件命名：PascalCase
- API调用：统一在`api/`目录管理
- 路由配置：在`router/index.js`统一配置
- 状态管理：使用Vuex

## 常见问题

### 1. 数据库连接失败
检查`application.yml`中的数据库配置是否正确。

### 2. 端口被占用
修改`application.yml`中的`server.port`配置。

### 3. 前端跨域问题
已配置CORS，如仍有问题检查`vue.config.js`中的代理配置。

## 许可证

本项目仅供学习交流使用。
