@echo off
netsh interface ip set address "USB Ethernet" dhcp && echo Dynamic IP set && ping 8.8.8.8 -n 10