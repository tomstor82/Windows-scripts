@echo off
netsh interface ip set address "USB Ethernet" static 192.168.88.10 255.255.255.0 && echo IP set to 192.168.88.10 && ping 192.168.88.1 -n 50