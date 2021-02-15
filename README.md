# Bash and Batch scripts mainly for manipulating IP and netmasks from bash terminal run in Microsoft PowerShell.

As the commands to change IP address in cmd or powerShell are overwhelming I decided to make a script to allow this. I am more acustomed to bash scripts and found them more usable than a batch script. I later discovered the powerShell scripts are very usable and something to look into for the future shell scripts (That is if I use windows in the future).

Script running in bash on powerShell using netsh

Script gives the option to select preset adapter first before abbreviated or full IP with or without netmask bits are inserted. Prompt for full net mask follows if not inserted.

If DHCP is selected a ping to the google server is automatically started, prompting for connectivity error should the network be disconnected.
