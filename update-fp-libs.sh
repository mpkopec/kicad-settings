#!/bin/bash

last_dir=`pwd`
green='\033[1;32m'
nc='\033[0m'

if [[ ! -d $1 ]]; then
	printf "Please provide a directory to which .pretty libraries are installed"
	printf "e.g. ~/kicad/lib/"
	exit 1
fi
cd $1

files=`ls | grep .pretty`
i=1
n=`echo $files | wc -w`

for f in $files; do
	printf "Entering ${green}${f}${nc}\n"
	cd $f

	if git checkout master; then
		printf "Progress ${green}${i}/${n}${nc}\r"
		git pull origin master
	else
		printf "Progress ${green}${i}/${n}${nc}\r"
		printf "You probably have some uncommitted changes in ${green}${f}${nc}\n"
	fi

	let "i+=1"
	cd ..
done

cd $last_dir
