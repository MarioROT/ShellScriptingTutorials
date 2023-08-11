#!/bin/sh
steves=`grep -i steve /etc/passwd | cut -d: -f1`
echo "All users tith the word \"steve\" in their password"
# echo "Entries are: $steves"
echo "Entries are: "
# echo "$steves" | tr ' ' '\012'
echo "$steves" | tr ' ' '\012' | tr '[a-z]' '[A-Z]'

