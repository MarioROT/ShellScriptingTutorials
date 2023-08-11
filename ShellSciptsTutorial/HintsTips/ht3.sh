#!/bin/sh
# changes every instance of eth0 in file1 to eth1 in file2
# sed s/eth0/eth1/g file1 > file2
sed s/"bad word"/"oops"/g testF1.txt testF2.txt
#Remove the phrase 'bad word' from the variable SOMETHING
echo ${SOMETHING} | sed s/"bad word"//g
