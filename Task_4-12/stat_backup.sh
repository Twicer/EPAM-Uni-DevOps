#!/bin/bash - 
#===============================================================================
#
#          FILE: stat_backup.sh
# 
#         USAGE: ./stat_backup.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Oleksandr Briukhanov (sysop), a.briukhanov@gmail.com
#  ORGANIZATION: wibob.net
#       CREATED: 11.05.20 12:15:00
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
tar zcfP /home/bruh/devops/scripts_4_12/backup/stat_on_$(date +"%F-%T").tgz ~/memory/stat ~/devops/scripts_4_12/system_avg_stat

