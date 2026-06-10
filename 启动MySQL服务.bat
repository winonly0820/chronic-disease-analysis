@echo off
chcp 65001 >nul
echo ========================================
echo 启动MySQL服务
echo ========================================
echo.

echo [检查] MySQL服务状态...
sc query MySQL | findstr "STATE"
echo.

echo [启动] 正在启动MySQL服务...
net start MySQL
echo.

if %errorlevel%==0 (
    echo ✅ MySQL服务启动成功！
    echo.
    echo [验证] 测试数据库连接...
    mysql -u root -p0107 -e "SELECT '连接成功！' AS status;"
) else (
    echo ❌ MySQL服务启动失败
    echo.
    echo 请尝试以下方法：
    echo 1. 以管理员身份运行此脚本
    echo 2. 手动启动：Win+R → services.msc → 找到MySQL → 右键启动
    echo 3. 检查MySQL是否正确安装
)

echo.
pause
