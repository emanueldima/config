#!/bin/bash

if [ "$1" ]; then
	echo "Building from current file path"
	cd $1
elif [ "$2" ]; then
	echo "Building from current project path"
	cd $2
else
	echo "Cannot build: No current file or project"
	exit 1
fi

START_DIR=`pwd`

while true; do
	if [ -e ./build.sh ]; then
		echo "Building: `pwd`/build.sh"
		./build.sh
		exit
	fi
	if [ -e ./makefile ] || [ -e ./Makefile ]; then
		echo "Make: `pwd`/makefile"
		make
		exit
	fi
	if [ "`pwd`" == "/" ]; then
		echo "Cannot find build.sh or a makefile in $START_DIR"
		exit 1
	fi
	cd ..
done
