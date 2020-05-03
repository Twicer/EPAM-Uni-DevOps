#!/bin/bash
printf "There are $(ls -lR ~ | grep '^d' | wc -l) subdirectories in my home directory: \n"
ls -lR ~ | awk '{if ($1 ~ /^\/.*\:$/) cur_dir=$1; else if (NF>=9 && $1 ~ /^d/) print  substr(cur_dir, 1, length(cur_dir)-1) "/" $9; else;}'
