#!/bin/bash
echo "Enter a word folowed by [Enter]"
read magicword
echo -n $magicword | sed 's:\s+::1' | awk '{if (NF>1) print "You enter more than 1 word! Try again."; else print length($1);}'
