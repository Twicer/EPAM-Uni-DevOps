#!/bin/bash -
#===============================================================================
#
#          FILE: linear_equation.sh
# 
#         USAGE: ./linear_equation.sh A B C
# 
#   DESCRIPTION: linar equation Ax+B=C returns
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 05.05.20 13:13:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function linear_eq {
	if [ $1 -eq 0 ]; then

		echo "ERROR - It's nonsence!"
	else
		echo $" ($3-$2) / $1" | bc -l | sed -e 's/\0*$//' | sed -e 's/\.$//' | sed -e '/[^0-9]\./s/\./0\./' | sed -e 's/^$/0/'
	fi
}

echo " x = $(linear_eq $1 $2 $3)"
