@echo off
echo [INFO] 确保默认JDK版本为JDK6.0及以上版本,已配置JAVA_HOME.
set MVN=mvn
set ANT=ant
set MAVEN_OPTS=-Xms1024m -Xmx1024m -XX:MaxPermSize=128m

if exist "tools\maven\apache-maven-3.0.3\" set MVN="%cd%\tools\maven\apache-maven-3.0.3\bin\mvn.bat"
if exist "tools\ant\apache-ant-1.8.2\" set ANT="%cd%\tools\ant\apache-ant-1.8.2\bin\ant.bat"
echo Maven命令为%MVN%
echo Ant命令为%ANT%

echo [Step 1] 安装Rebirth 所有modules到本地Maven仓库, 为所有项目生成Eclipse项目文件.
call %MVN% clean install -Dmaven.test.skip=true
if errorlevel 1 goto error
call %MVN% eclipse:clean eclipse:eclipse -DdownloadSources=true
if errorlevel 1 goto error

goto end
:error
echo "有错误发生"
:end
pause