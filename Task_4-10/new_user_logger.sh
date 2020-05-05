#!/bin/bash -
#===============================================================================
#
#          FILE: new_user_logger.sh
# 
#         USAGE: ./new_user_logger.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 05.05.20 05:10:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

log_file=new_user.log

if [ ! -f $log_file ]
then
    touch $log_file
fi

while read l_passwd; do
	cur_user=`echo "$l_passwd" | cut -d ":" -f1`
	cur_uid=`echo "$l_passwd" | cut -d ":" -f3`
	if [ `awk -v uid=$cur_uid '{if ($4==uid) print "1 "; else;}' $log_file | wc -w` -gt 0 ]
	then
		continue
#		echo `awk -v uid=$cur_uid '{if ($4==uid) print "1 " uid; else;}' $log_file | wc -w`  
#		echo "$cur_user old ones"
	else
#		echo `awk -v uid=$cur_uid '{if ($4==uid) print "1 " uid; else;}' $log_file | wc -w`  

#		echo "$cur_user NEW user since previous run"
		echo "`date "+%D %T"`" $cur_user $cur_uid >>$log_file
	 fi
		
done </etc/passwd
