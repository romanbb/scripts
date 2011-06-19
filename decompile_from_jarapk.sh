#!/bin/bash

#echo -e '\E[34;47mThis prints in blue.'; tput sgr0

red='\E[31;47m'

if [ $# = 0 ]; then
	echo ""; echo -e $red "inputs: <jar/apk name source for classes.dex> <folder destination for *.smali>"; tput sgr0; echo "";
	exit
fi


#OUTPUT=$(smali -o ./classes.dex $1 2>&1)

clear



echo "Unzipping classes.dex"
echo ""

unzip -o $1 classes.dex 

baksmali -o $2 classes.dex

echo "Done"
echo ""
