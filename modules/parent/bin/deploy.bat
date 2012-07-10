@echo off
cd %~dp0
cd ..
call mvn clean package deploy:deploy -U -e -B -Dmaven.test.skip=true

pause