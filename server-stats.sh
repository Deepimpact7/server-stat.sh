echo "########## Server stats script ##########"
echo ""

echo "#################### CPU usage ####################"
cpu_usage=$(top -bn1 | grep %Cpu | awk '{print 100 - $8}')
echo "CPU: $cpu_usage%"
echo ""

echo "#################### Memory usage: ####################"
total_memory=$(free -mh | grep Mem | awk '{print $2}')
used_memory=$(free -mh | grep Mem | awk '{print $3}')
echo "Total memory: $total_memory"
echo "Used memory: $used_memory"
echo ""

echo "#################### Disk usage: ####################"
free_disk=$(df -h | grep "/" -w | awk '{print $4}')
used_disk=$(df -h | grep "/" -w | awk '{print $3}')
used_percentage=$(df -h | grep "/" -w | awk '{print $5}')
echo "Free disk: $free_disk"
echo "Used disk: $used_disk"
echo "Percentage: $used_percentage"
echo ""

echo "#################### Top 5 processess by cpu usage: ####################"
top -bn1 -o %CPU | head -n 12 | tail -n 6 | awk '{printf "%-10s %-20s %-10s %s\n", $1, $2, $9, $12}'
echo ""

echo "#################### Top 5 processess by memory usage: ####################"
top -bn1 -o %MEM | head -n 12 | tail -n 6 | awk '{printf "%-10s %-20s %-10s %s\n", $1, $2, $10, $12}'
