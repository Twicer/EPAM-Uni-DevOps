#!/bin/bash - 
#===============================================================================
#
#          FILE: which_grater.sh
# 
#         USAGE: ./which_grater.sh arg1 arg2
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 02.05.20 01:41:23
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
int_patt='^[0-9]+$'						# шаблон для определения целого

if [ "$#" -ne 2 ]; then 					# проверка, переданы ли 2 аргумента
	echo "Please enter two integer number"								
else 
	if  [[ $1 =~ $int_patt && $2 =~ $int_patt ]]; then	# проверка, аргументов на соответствие шаблону
		if [ $1 -eq $2 ]; then				# проверка на равенство аргументов
			echo "Arguments are equal"
		else
			if [ $1 -gt $2 ]; then			# сравнение аргументов
				echo $1
			else
				echo $2
			fi
		fi
	else
		echo "Please, use positive integer number"
	fi
fi
