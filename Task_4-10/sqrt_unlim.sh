#!/bin/bash -
#===============================================================================
#
#          FILE: sqrt_unlim.sh
# 
#         USAGE: ./sqrt_unlim.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 05.05.20 05:00:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

for var in "$@"
do
	echo "$(($var**2))"
done

