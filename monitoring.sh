printf '	#Architecture: %s\n' "$(uname -a)"

cores=$(lscpu | grep -Po " *Core\(s\) per socket: *\K\d*")
sockets=$(lscpu | grep -Po " *Socket\(s\): *\K\d*")
p_cores=$((cores * sockets))
printf '	#CPU physical: %i\n' "$p_cores"

printf '	#vCPU: %i\n' "$(nproc)"

printf '	#Memory Usage: \n' ""

printf '	#Disk Usage: %i' ""
printf '/%iGB ' ""
printf '(%i%%)\n' ""

printf '	#CPU Load: %f%%\n' ""

printf '	#Last Boot: %s\n' ""

printf '	#LVM Use: %s\n' ""

printf '	#Connections TCP: %i ESTABLISHED\n' ""

printf '	#User Log: %i\n' ""

printf '	#Network: IP %s\n' ""

printf '	#Sudo: %i cmd\n' ""

