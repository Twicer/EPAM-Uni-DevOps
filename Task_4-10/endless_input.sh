#!/bin/bash -
#===============================================================================
#
#          FILE: endless_input.sh
# 
#         USAGE: ./endless_input.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 04.05.20 18:59:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

to_quit="quit"
while read -p "Enter Your\`s Arguments or \"$to_quit\": " line
do
	if [ $line = $to_quit ]; then break
  else
	echo "$line"  # Здесь может быть любое действие с введенной строкой
	fi
done
