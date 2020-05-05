#!/bin/bash
#===============================================================================
#
#          FILE: proc_qlogger.sh
# 
#         USAGE: ./proc_qlogger.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 05.05.20 02:42:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

way_to_store="0"	# "1" to clear old log, "0" - add to tail
log_file=~/tmp/proc_q.log

[[ -f "$log_file" && $way_to_store -eq 1 ]] && rm -f $log_file
[[ ! -d ~/tmp ]] && mkdir ~/tmp

while true  
do  
 	printf "%-10s%10s%10s" $(date "+%D %T") $(ps aux | wc -l) >> $log_file && echo >> $log_file 	
	sleep 59  
done
