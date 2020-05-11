#!/bin/bash - 
#===============================================================================
#
#          FILE: upassgen.sh
# 
#         USAGE: ./upassgen.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 11.05.20 01:45:50
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error



function user_create {				# проверка, генерация пароля и создание пользователя вынесены в функцию
	egrep "^$1\:" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$1 exists!"
	else
		pass=`openssl rand -base64 6`
		useradd -m -p $(openssl passwd -1 $pass) -s /bin/bash $1
		if [ $? -eq 0 ]; then
			echo "User $1 has been added to system!"
			filename=$1-loginpassword.txt
			echo "$1 - $pass" > $filename
		else
			echo "Failed to add a user! $1"
		fi
	fi
}

if [ $(id -u) -eq 0 ]; then			# проверка от рута ли запущен скрипт
	while read user_str; do			# цикл построчной, для всех строк в переданоом файле, обработки списка пользователей
			user_create `echo $user_str | cut -f 2 -d " "`  # вызов функции с передачей в качестве параметра имени пользователя из строки
	done <$1
else
	echo "Only root may add a user to the system."
	exit 2
fi

