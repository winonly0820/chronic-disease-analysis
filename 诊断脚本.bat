@echo off
chcp 65001 >nul
echo ========================================
echo 慢性病分析项目 - 500错误诊断脚本
echo ========================================
echo.

echo [步骤1] 检查MySQL服务状态...
sc query MySQL80 2>nul | findstr "STATE" >nul
if %errorlevel%==0 (
    echo ✅ MySQL服务正在运行
) else (
    echo ❌ MySQL服务未运行，正在尝试启动...
    net start MySQL80 2>nul
    if %errorlevel%==0 (
        echo ✅ MySQL服务启动成功
    ) else (
        echo ❌ MySQL服务启动失败，请手动启动
        pause
        exit /b 1
    )
)

echo.
echo [步骤2] 检查数据库是否存在...
mysql -u root -p0107 -e "USE chronic_disease_db;" 2>nul
if %errorlevel%==0 (
    echo ✅ 数据库 chronic_disease_db 存在
) else (
    echo ❌ 数据库 chronic_disease_db 不存在，正在创建...
    mysql -u root -p0107 < "D:\Project\chronic-disease-analysis\sql\init.sql"
    if %errorlevel%==0 (
        echo ✅ 数据库创建成功
    ) else (
        echo ❌ 数据库创建失败，请检查MySQL密码或手动执行SQL脚本
        echo 提示：请确认MySQL密码是否为 0107
        pause
        exit /b 1
    )
)

echo.
echo [步骤3] 检查数据库表数据...
mysql -u root -p0107 chronic_disease_db -e "SELECT COUNT(*) AS '地区数量' FROM t_region; SELECT COUNT(*) AS '疾病类型数量' FROM t_disease_type; SELECT COUNT(*) AS '慢性病数据量' FROM t_chronic_disease_data;" 2>nul

echo.
echo [步骤4] 运行单元测试...
cd /d "D:\Project\chronic-disease-analysis\backend"
set JAVA_HOME=D:\jdk-17.0.16

echo 编译项目...
call mvn clean compile -DskipTests -q
if %errorlevel%==0 (
    echo ✅ 编译成功
) else (
    echo ❌ 编译失败，请检查代码
    pause
    exit /b 1
)

echo.
echo 运行数据库连接测试...
call mvn test -Dtest=DatabaseConnectionTest -pl . -q
if %errorlevel%==0 (
    echo ✅ 测试运行完成
) else (
    echo ⚠️ 部分测试失败，请查看上方输出
)

echo.
echo [步骤5] 构建项目...
call mvn clean package -DskipTests -q
if %errorlevel%==0 (
    echo ✅ 构建成功
    echo.
    echo ========================================
    echo 诊断完成！
    echo ========================================
    echo.
    echo 下一步操作：
    echo 1. 启动后端：java -jar target\chronic-disease-analysis-1.0.0.jar
    echo 2. 启动前端：cd ..\frontend ^& npm run serve
    echo 3. 访问：http://localhost:8081
    echo.
    echo 如果仍有500错误，请检查：
    echo - 后端控制台日志
    echo - 浏览器开发者工具的Network标签
    echo - 确认MySQL密码是否正确（当前配置：0107）
) else (
    echo ❌ 构建失败，请检查代码
)

echo.
pause
