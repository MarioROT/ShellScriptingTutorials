#!/bin/sh
echo -en "What is your name [ `whoami` ] "
read myname
echo "Your name is: ${myname:-Mario Rosas}"
