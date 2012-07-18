@echo off
echo [INFO] 确保已用mvn install安裝tools\maven下的项目模板

set MVN=mvn
if exist "tools\maven\apache-maven-3.0.2\" set MVN="%cd%\tools\maven\apache-maven-3.0.2\bin\mvn.bat"
echo Maven命令为%MVN%


set /p drive=请输入目录名(如:D:\\summall-test):
if "%drive%"=="" set drive=D:\\generated-projects
if not exist "%drive%" mkdir %drive%
cd %drive%
call %MVN% archetype:generate -DarchetypeCatalog=local
pause
