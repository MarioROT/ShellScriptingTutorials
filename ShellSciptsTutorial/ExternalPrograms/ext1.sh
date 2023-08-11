#!/bin/sh
# First trial, will take too long
# find / -name ".html" -print | grep "/index.html$"
# find / -name ".html" -print | grep "/contents.html$"
# A better solution
HTML_FILES=`find / -name ".html" -print`
echo "$HTML_FILES" | grep "/index.html$"
echo "$HTML_FILES" | grep "/contents.html$"
