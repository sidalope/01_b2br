printf '	#Architecture: %s\n' "$(uname -a)"

cores=$(lscpu | grep -Po " *Core\(s\) per socket: *\K\d*")
sockets=$(lscpu | grep -Po " *Socket\(s\): *\K\d*")
p_cores=$((cores * sockets))
printf '	#CPU physical: %i\n' "$p_cores"

printf '	#vCPU: %i\n' "$(nproc)"

total_mem=$(free --mega | grep -Po "Mem: *\K\d*")
in_use_mem=$(free --mega | grep -Po "Mem: *\d* *\K\d*")
printf '	#Memory Usage: %i' "$in_use_mem"
printf '/%iMB ' "$total_mem"
printf '(%.2f%%)\n' "$((total_mem / in_use_mem))"

# df -h
# TODO create grep at school with sda5 or whatever as output
printf '	#Disk Usage: %i' ""
printf '/%iGb ' ""
printf '(%.2f%%)\n' ""

# Subsequent reads to /proc/stat to get a percentage
# https://www.linuxhowtos.org/System/procstat.htm
printf '	#CPU Load: %.2f%%\n' ""

printf '	#Last Boot: %s\n' "$(who -b | grep -Po "boot *\K.*")"

if [ "$(lsblk | grep -c lvm)" = "0" ]; then
	printf '	#LVM Use: No\n' ""
else
	printf '        #LVM Use: Yes\n' ""
fi

printf '	#Connections TCP: %i ESTABLISHED\n' ""

printf '	#User Log: %i\n' ""

# ip link
# ip maddress
printf '	#Network: IP %s\n' ""

printf '	#Sudo: %i cmd\n' ""

