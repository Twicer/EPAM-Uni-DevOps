#!/bin/bash - 
#===============================================================================
#
#          FILE: memory_stat.sh
# 
#         USAGE: ./memory_stat.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 11.05.20 11:27:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
free | awk -v date="$(date +"%F %T")" 'FNR == 2 { printf "%14s %12s %12s %12s %12s %12s %s\n", $2, $3, $4, $5, $6, $7, date}' >>~/memory/stat

