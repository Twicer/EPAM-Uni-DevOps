#!/bin/bash - 
#===============================================================================
#
#          FILE: var_error.sh
# 
#         USAGE: ./var_error.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 02.05.20 04:49:23
#      REVISION:  ---
#===============================================================================

# set -o nounset                              # Treat unset variables as an error
compname=$1
echo "Company name is ${compname:?"company name not set"}"

