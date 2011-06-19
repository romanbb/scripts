#!/bin/bash

#echo -e '\E[34;47mThis prints in blue.'; tput sgr0

red='\E[31;47m'

if [ $# = 0 ]; then
	echo ""; echo -e $red "inputs: <folder to compile> <jar/apk name to get classes.dex from>"; tput sgr0; echo "";
	exit
fi

OUTPUT=$(smali -o ./classes.dex $1 2>&1)

clear
echo "Smali-ing $1"
echo ""

if [[ $OUTPUT = "" ]]; then
	zip -r ./$2 classes.dex
	echo ""
	echo "zipped into: " $2
else
	echo -e ${red} "Error in smali files!"; tput sgr0
	echo ""; echo $OUTPUT; echo ""
fi
