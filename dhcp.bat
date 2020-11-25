@echo off
netsh interface ip set address "USB Ethernet" dhcp && netsh interface ip set address "Wireless Network Connection" dhcp && echo Dynamic IP set && ping 8.8.8.8 -n 10