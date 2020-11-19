#!/bin/bash

# Variables
$ethAdapter='"USB Ethernet"';
$wifiAdapter='"Wireless Network Connection"';
$maskAddress=255.255.255.0;
$sys32=/mnt/c/windows/system32;
# User Input 1
read -p 'Press 1 for USB Ethernet or 2 for WiFi Ethernet (Blank defaults 1): ' adapter;

# Check adapter input
if [ -z $adapter ] || [ $adapter -eq 1 ]; then
	adapter=$ethAdapter;
else adapter=$wifiAdapter;
fi

# User Input 2
read -p "Enter ${adapter} IP address e.g. 88.1/24. Blank for DHCP: " ipmask;

# Was ipmask input?
if [ $ipmask ]; then
	ip=$(grep -Po '(\d{1,3}\.){1,3}\d+|(\d){1,3}\.(\d){1,3}' <<< $ipmask); #filter ip from mask
	ipSeparators=$(grep -Po '[.]' <<< $ipmask); #filter dot separators
	sepLen=$(wc -l <<< $ipSeparators); #count dot separators

	# Was the short format IP address received
#??	if [[ $ip =~ '^(\d){1,3}[.](\d){1,3}$' ]]; then

	# Checking if full IP was received if not concatinate
	if [ $sepLen -eq 1 ]; then
		ip=192.168.$ip #concat to make valid IPv4
	elif [ $sepLen -lt 1 ] || [ $sepLen -gt 3 ]; then
		echo 'Wrong IP format. E.g. 192.168.1.2 or 88.3 or 1.21/24';
		exit
	fi;
# else we set DHCP as IP
else
	$sys32/netsh.exe interface ip set address $adapter dhcp;
	sleep 3; #add delay before ping
	ping 8.8.8.8 -c7 2> ~/.error;
	error=$(wc -l ~/.error | grep -Po '\d');
	rm ~/.error
	# Ping error out suspect connectivity issue
	if [ $error > 0 ]; then echo Check $adapter Connectivity;
	fi;
	exit;
fi;

# Extracting the Mask Bits
maskFilter=$(grep -Po '\/\d+$' <<< $ipmask);
mask=$(grep -Po '\d+' <<< $maskFilter);

# Net bit to address matcher
if [ $mask ]; then
	case $mask in
		32)
		maskAddress=255.255.255.255;;
		#24 set as standard
		16)
		maskAddress=255.255.0.0;;
		8)
		maskAddress=255.0.0.0;;
		0)
		maskAddress=0.0.0.0;;
		*)
		echo 'Mask bit range 0/8/16/24/32 accepted, alternatively full address formats. Default 24 bit set.';
	esac;
else
	read -p 'Type full mask address, alternatively leave blank for default 255.255.255.0: ' maskAddressInput;
fi;



# Net Mask Converter
#if [ $mask ]; then
#	if [ $mask -eq 32 ]; then
#		maskAddress=255.255.255.255;
#	elif [ $mask -eq 24 ]; then
#		maskAddress=255.255.255.0;
#	elif [ $mask -eq 16 ]; then
#		maskAddress=255.255.0.0;
#	elif [ $mask -eq 8 ]; then
#               maskAddress=255.0.0.0;
#        elif [ $mask -eq 0 ]; then
#		maskAddress=0.0.0.0;
#	else
#		#maskAddress=255.255.255.0;
#		echo 'Mask range either 0/8/16/24/32 bits, alternatively full net mask address 255.255.255.0 formats accepted (Default 24bit set)'
#	fi;
# If no mask details given set default
#else
#	read -p "Type full subnet mask address, alternatively leave blank for default 255.255.255.0: " maskAddressInput;
#fi;

# Check maskAddressInput received
if [ $maskAddressInput ]; then
	maskAddress=$maskAddressInput;
fi;

################# DEBUG ######################
#echo Entered IP $ip;
#echo Computed netmask $maskAddress from entereted mask bits $mask;
#echo 'Adapter set to' $adapter;

# Set new IP
$sys32/netsh.exe interface ip set address $adapter static $ip $maskAddress;
#$sys32/ipconfig.exe
