#!/bin/bash -
#===============================================================================
#
#          FILE: wget_lynx.sh
# 
#         USAGE: ./wget_lynx.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 02.05.20 06:03:02
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
wget http://adv-it.net -o wget_log.txt
path_link=$PWD/`cat wget_log.txt | grep Saving | cut -d ' ' -f 3 | tr -d '‘’'`
lynx -dump file:///$path_link
