#!/bin/bash

MIRROR_DIR=/usr/local/pip-mirrors
REQUIREMENTS=/usr/local/requirements.txt

serve() {
	if ! [ -d  $MIRROR_DIR ]; then
		echo "Please provide directory $MIRROR_DIR"
		exit 1
	fi
	dir2pi $MIRROR_DIR
	cd $MIRROR_DIR
	python3 -m http.server 80
}

download() {
	if ! [ -d  $MIRROR_DIR ]; then
		echo "Please provide directory $MIRROR_DIR"
		exit 1
	fi
	cd $MIRROR_DIR
	pip3 download $*
}

help() {
	echo "USAGE:"
	echo -e "\tdownload: $0 download -r /path/to/requirements.txt package1 package2 ..."
	echo -e "\tserving: $0"
}

if [ "$1" == "-h" -o "$1" == "--help"  -o "$1" == "-help" ]; then
	help
elif (( $# == 0 )); then
	serve
elif (( $1 == "download" )); then
	shift
	download $*
else
	help
fi

