@echo off
echo [INFO] ȷ������mvn install���btools\maven�µ���Ŀģ��

set MVN=mvn
if exist "tools\maven\apache-maven-3.0.2\" set MVN="%cd%\tools\maven\apache-maven-3.0.2\bin\mvn.bat"
echo Maven����Ϊ%MVN%


set /p drive=������Ŀ¼��(��:D:\\summall-test):
if "%drive%"=="" set drive=D:\\generated-projects
if not exist "%drive%" mkdir %drive%
cd %drive%
call %MVN% archetype:generate -DarchetypeCatalog=local
pause
