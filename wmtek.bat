@echo off
netsh interface ip set address "Wireless Network Connection" static 192.168.88.10 255.255.255.0 && echo Wireless Ethernet IP set to 192.168.88.10 && ping 192.168.88.1 -n 50