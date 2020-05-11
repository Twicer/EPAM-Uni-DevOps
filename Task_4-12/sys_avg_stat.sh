#!/bin/bash - 
#===============================================================================
#
#          FILE: sys_avg_stat.sh
# 
#         USAGE: ./sys_avg_stat.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 11.05.20 12:47:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

echo "==============" >> ~/devops/scripts_4_12/system_avg_stat
date +"%D %R" >> system_avg_stat
echo "--------------" >> ~/devops/scripts_4_12/system_avg_stat
vmstat --one 3 12 | awk 'FNR>3 {cs_avg += $12; n++; } END { if (n > 0) print "cs_avg: " cs_avg / n; }' >> ~/devops/scripts_4_12/system_avg_stat
## на 30 секундах начиная с нулевой отметки помещается 11 измерений, первое отбрасываем так как не релевантны данные
## поэтому в расчет среднего идут 11 строк из 12 снятых (1 строка с донными игнорируется)
echo "---------------" >> ~/devops/scripts_4_12/system_avg_stat
echo "15min load average: `uptime | cut -d " " --fields=15`" >> ~/devops/scripts_4_12/system_avg_stat
echo "------------------------" >> ~/devops/scripts_4_12/system_avg_stat
cat /proc/meminfo >> ~/devops/scripts_4_12/system_avg_stat
echo "---------------------------" >> ~/devops/scripts_4_12/system_avg_stat
sudo fdisk -l >>  ~/devops/scripts_4_12/system_avg_stat
echo "---------------------------" >> ~/devops/scripts_4_12/system_avg_stat
