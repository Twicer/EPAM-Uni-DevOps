#!/bin/bash - 
#===============================================================================
#
#          FILE: proc_count.sh
# 
#         USAGE: ./proc_count.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 10.05.20 01:39:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
echo "Процессов пользователя:"
whoami
ps -u `whoami` u | wc -l
echo "Процессов пользователя root:"
ps -u root u | wc -l


