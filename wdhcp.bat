@echo off
netsh interface ip set address "Wireless Network Connection" dhcp && echo Wireless Ethernet Dynamic IP set && ping 8.8.8.8 -n 10