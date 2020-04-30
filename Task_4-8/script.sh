#!/bin/bash 
ls -Rl > list_home_folder.txt
sed -e '/^\S\{10,11\}\s\+[0-9]\{1,\}\s\+\S\{1,32\}\s\+/s:\S\{1,\}:sed:3'  list_home_folder.txt > username_sed.txt 
awk 'NF>=9 {$3="awk"} 1' list_home_folder.txt > username_awk.txt
sed '/^total\s[0-9]\{1,\}/d' list_home_folder.txt > withoutotal.txt
awk '{if ($1 ~ /^\.\//) cur_dir=$1; else if (NF>=9 && $1 ~ /^-/) print $7 " " $6 " " $8 "  "  substr(cur_dir, 1, length(cur_dir)-1) "/" $9; else;}' list_home_folder.txt > date_name.txt
awk '{if ($1 ~ /^\.\//) cur_dir=$1; else if (NF>=9 && $1 ~ /^-/ && $9 ~ /[0-9]/) print substr(cur_dir, 1, length(cur_dir)-1) "/" $9; else;}' list_home_folder.txt > numb_in_names.txt
awk '{if ($1 ~ /^\.\//) cur_dir=$1; else if (NF>=9 && $1 ~ /^-/ && $9 ~ /.\../) print substr(cur_dir, 1, length(cur_dir)-1) "/" $9; else;}' list_home_folder.txt > files_with_ext.txt
