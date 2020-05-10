#!/bin/bash - 
#===============================================================================
#
#          FILE: pwd_fcount.sh
# 
#         USAGE: ./pwd_fcount.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 10.05.20 00:17:58
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
echo "Домашний каталог пользователя"
whoami
echo "содержит обычных файлов:"
ls ~ -Rla | awk '{if (NF>=9 && $1 !~ /^d/ && $9 !~ /^\./) print $9; else;}' | wc -l
echo "скрытых файлов:"
ls ~ -Rla | awk '{if (NF>=9 && $1 !~ /^d/ && $9 ~ /^\./) print $9; else;}' | wc -l
