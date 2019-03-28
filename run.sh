#!/bin/bash

# Usage: ./run.sh <mode> <file>
# 	mode: scan|tokens|parse|pretty|symbol|typecheck|codegen
                                
# Check the command-line arguments are valid

if [ $# -lt 2 ]
then
	echo "Missing arguments"
	echo "Usage: $0 <mode> <file>"
	echo " + mode: scan|tokens|parse|pretty|symbol|typecheck|codegen|dumpast"
	echo " + file: path to file (absolute or relative)"
	exit 1
fi

if [[ "|scan|tokens|parse|pretty|symbol|typecheck|codegen|dumpast|" != *"|$1|"* ]]
then
	echo "Unknown mode \"$1\""
	echo "Usage: $0 <mode> <file>"
	echo " + mode: scan|tokens|parse|pretty|symbol|typecheck|codegen|dumpast"
	echo " + file: path to file (absolute or relative)"
	exit 1

fi

# Invoke the compiler with the provided arguments: mode ($1) and file ($2)
#
# You MUST replace the following command with the command for invoking your compiler

# https://stackoverflow.com/questions/38746/how-to-detect-file-ends-in-newline
last_ch=`tail -c 1 $2`
if [ "$last_ch" != "" ]; then echo >> "$2"; fi

./src/goc.byte "$1" "$2"

