#!/bin/bash

last_dir=`pwd`

if [[ ! -d $1 ]]; then
	echo "Please provide a directory to which .pretty libraries should be"
	echo "cloned to, e.g. ~/kicad/lib/"
	exit 1
fi
cd $1

curl 'https://api.github.com/users/KiCad/repos?per_page=10000' | jq '.[] | select(.name | test(".pretty")) | .clone_url' | xargs -I url git clone url

cd $last_dir
