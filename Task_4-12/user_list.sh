#!/bin/bash - 
#===============================================================================
#
#          FILE: user_list.sh
# 
#         USAGE: ./user_list.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 11.05.20 01:36:35
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

for ((i = 1 ; i < 21 ; i++)); do
  echo "$i. user$i" >> userlist.txt
done


