#!/bin/sh
# count the lines, words and characters in a file 
# wc ../Loops/myfile.txt 
# To save in a vriable
# To save the num of lines we get only $1 
NO_LINES=`wc -l ../Loops/myfile.txt | awk '{ print $1 }'`
