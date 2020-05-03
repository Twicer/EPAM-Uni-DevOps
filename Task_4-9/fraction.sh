#!/bin/bash -
#===============================================================================
#
#          FILE: fraction.sh
# 
#         USAGE: ./fraction.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: --
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: gets 3 parameters and celculate
#        AUTHOR: YOUR NAME (Oleksandr Briukhanov), 
#  ORGANIZATION: 
#       CREATED: 28.04.20 12:53:59
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

int_patt='^[0-9]+$'								# шаблон для определения целого

if [ "$#" -ne 3 ]; then 							# проверка, переданы ли 3 аргумента
	echo "Please enter three integer number"								
else 
	if  [[ $1 =~ $int_patt && $2 =~ $int_patt && $3 =~ $int_patt ]]; then	# проверка, аргументов на соответствие шаблону
		if [ "$3" -eq 0 ]; then					# проверка деления на 0
			echo "Result: ERROR. Devision by Zero"
		else
		       	devident_ln=`echo -n "$1 + $2" | wc -c		#вычисляем длинну делителя в сиволах отображения`
			devisor_ln=`echo -n "$3" | wc -c`		# вычисляем длинну делителя в символах
			if [ $devident_ln -gt $devisor_ln ]; then	# определяем длину максимальной длины
				max_ln=$devident_ln
			else
				max_ln=$devisor_ln
			fi
			printf "%*s\n" $(( ( $devident_ln + $max_ln ) / 2 )) "$1 + $2" # выводим отцентровано выражение в числителе
			for ((i=0; i < $max_ln; i++)); do 		# в цикле рисуем дробь нужной длинны
	       		echo -n "-"
			done
			echo -n " = "; echo "( $1 + $2 ) / $3" | bc -l	# выводим в десятичном виде результат преобразования дроби
			printf "%*s\n" $(( ( $devisor_ln + $max_ln ) / 2 )) "$3" # центрируем и выводим знаменатель дроби
		fi 
	else
		echo "Sorry, positive integers only"
	fi
fi
