@echo off
netsh wlan show networks
SET /p q = You wanna connect to HotSpot? [y/n]: 
if %q % == y netsh wlan connect name="Fasttracks iPhone"
if %q % == n hotspot