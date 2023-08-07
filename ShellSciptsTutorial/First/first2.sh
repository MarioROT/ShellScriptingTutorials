#!/bin/sh
# This is a comment
echo "Hello     World" # Hello     World 
echo "Hello World" # Hello World 
echo "Hello * World" # Hello * World 
echo Hello * World # Hello\n*\nWorld 
echo Hello     World # Hello World 
echo "Hello" World # Hello world 
echo Hello "    " World # Hello    World
echo "Hello  "*"  World" # error 
echo `hello` world # error 
echo 'hello' world # hello world 
# --- Real Outputs
# Hello     World 
# Hello World 
# Hello * World 
# Hello first2.sh first.sh my-script.sh World 
# Hello World 
# Hello World 
# Hello      World Hello World 
# Hello  *  World 
# first2.sh: line 11: hello: command not found 
# world 
# hello world 
