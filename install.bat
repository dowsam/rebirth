@echo off
echo [INFO] ȷ��Ĭ��JDK�汾ΪJDK6.0�����ϰ汾,������JAVA_HOME.
set MVN=mvn
set ANT=ant
set MAVEN_OPTS=-Xms1024m -Xmx1024m -XX:MaxPermSize=128m

if exist "tools\maven\apache-maven-3.0.3\" set MVN="%cd%\tools\maven\apache-maven-3.0.3\bin\mvn.bat"
if exist "tools\ant\apache-ant-1.8.2\" set ANT="%cd%\tools\ant\apache-ant-1.8.2\bin\ant.bat"
echo Maven����Ϊ%MVN%
echo Ant����Ϊ%ANT%

echo [Step 1] ��װRebirth ����modules������Maven�ֿ�, Ϊ������Ŀ����Eclipse��Ŀ�ļ�.
call %MVN% clean install -Dmaven.test.skip=true
if errorlevel 1 goto error
call %MVN% eclipse:clean eclipse:eclipse -DdownloadSources=true
if errorlevel 1 goto error

goto end
:error
echo "�д�����"
:end
pause