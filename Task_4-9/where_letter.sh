#!/bin/bash -
#===============================================================================
#
#          FILE: where_letter.sh
# 
#         USAGE: ./where_letter.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 02.05.20 02:13:17
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

letter=a
if [ "$#" -lt 1 ]; then 					# проверка, передан ли аргумент
	echo "Please use argument"								

else 
	for (( i=0; i<${#1}; i++ )); do
		if [ X${1:$i:1} = X$letter ]; then
			echo $(($i+1))
			break
		fi
	done
fi
