@echo off
SET /p ip = Type IPv4 address: 
ping -t %ip % |cmd /q /v /c "(pause&pause)>nul & for /l %%a in () do (set /p "data=" && echo(!date! !time! !data!)&ping -n 2 localhost>nul" > log.log