# Modify this file
alias ali='nano ~/.bash_aliases && source ~/.bash_aliases';
alias als='cat ~/.bash_aliases | grep -Po "[\w]{1,}\=" | grep -Po "[\w]{1,}"';
# Auto update
alias upd='echo 4109 | sudo -S apt update && upgradable="sudo -S apt list --upgradable" && sudo -S apt -y upgrade && sudo -S apt -y autoremove && $upgradable | grep -Pho "^\w+[-]\w+[-]?(\w+)?"'
# Net-tools
#alias tracert='traceroute';
alias p='ping -Os 24';
alias pgo='ping -Os 24 8.8.8.8';
alias p20='ping -Os 24 192.168.1.20';
alias p88='ping -Os 24 192.168.88.1';
alias pinglog='~/scripts/pinglog.sh';
# Set IP
alias setip='/mnt/c/aliases/setIp';
# Display Local and Public IP
alias ip='echo "Local IP address: " && ifconfig | grep -Po "inet\s((\d){1,3}\.){3}(\d){1,3}" | grep -Po "\d+.+" | grep -v "127.0.0.1" && echo "" && echo "Public IP address: " && dig +short myip.opendns.com @resolver1.opendns.com';
# Variables
moz='/mnt/c/Progra~1/Mozill~1/firefox.exe';
netsh='/mnt/c/Windows/System32/netsh.exe';
# Firefox shortcuts
alias fox='read -p "Search Firefox or leave blank: " search && ${moz} --search "$search"';
alias fox88='${moz} 192.168.88.1:99';
alias fox20='${moz} 192.168.1.20';
alias spd='${moz} https://www.speedtest.net/#';
# Hotspot Windows batch file
alias hotspot='/mnt/c/Windows/System32/cmd.exe /mnt/c/aliases/hotspot.bat';
# Skype
alias skype='/mnt/c/Progra~2/Microsoft/Edge/Application/msedge.exe https://web.skype.com &';
# Traceroute
alias tracert='/mnt/c/Windows/System32/TRACERT.exe';
# set IP shortcuts
alias dhcp='${netsh} interface ip set address "USB Ethernet" dhcp && ${netsh} interface ip set address "Wireless Network Connection" dhcp && echo Dynamic IP set && sleep 2 && pgo';
alias mtek='${netsh} interface ip set address "USB Ethernet" static 192.168.88.2 255.255.255.0 && echo IP set to 192.168.88.2 && sleep 2 && p88';
alias ubnt='${netsh} interface ip set address "USB Ethernet" static 192.168.1.19 255.255.255.0 && echo IP set to 192.168.1.19 && sleep 2 && p20';
# show saved wifi networks
alias show='/mnt/c/Windows/system32/cmd.exe /mnt/c/aliases/show.bat'
# show stored wifi password
alias ssid='${netsh} wlan show profile | more && read -p "Type Wireless Profile Name: " ssid && ${netsh} wlan show profile "${ssid}" key=clear | more';
