@echo off
netsh interface ip set address "USB Ethernet" static 192.168.1.19 255.255.255.0 && echo IP set to 192.168.1.19 && ping 192.168.1.20 -n 50