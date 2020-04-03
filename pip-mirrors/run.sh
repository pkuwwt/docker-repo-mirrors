#!/bin/bash

# parse_requirements -r /path/to/requirements1.txt a -r requirements2.txt b ...
#    =>  -v /path/to/requirements1.txt:/path/to/requirements1.txt -v cwd/requirements2.txt:cwd/requirements2.txt
parse_requirements() {
	last=
	map=
	for arg in "$@"; do
		if [ "$last" == "-r" ]; then
			path=`greadlink -f $arg`
			if [ -f "$path" ]; then
				map="$map -v $path:$path"
			fi
		fi
		last=$arg
	done
	echo $map
}

parse_arguments() {
	last=
	map=
	for arg in "$@"; do
		if [ "$last" == "-r" ]; then
			if [ -f "$arg" ]; then
				path=`greadlink -f $arg`
				map="$map $path"
				last=$arg
				continue
			fi
		fi
		last=$arg
		map="$map $arg"
	done
	echo $map
}

# download dir ...
download() {
	dir=`greadlink -f $1`
	shift
	requirements_map=`parse_requirements $*` # map the requirements.txt
	arguments=`parse_arguments $*`           # parse the absolute paths of those requirements.txt
	echo $requirements_map
	docker run -it --rm $requirements_map -v $dir:/usr/local/pip-mirrors pkuwwt/pip-mirrors download $arguments
}

# serve dir port
serve() {
	dir=${1:-.}
	port=${2:-8088}
	dir=`greadlink -f $dir`
	docker run -p 0.0.0.0:$port:80 --name pip-mirrors-$port -v $dir:/usr/local/pip-mirrors pkuwwt/pip-mirrors
}

# service dir port
service() {
	dir=${1:-.}
	port=${2:-8088}
	dir=`greadlink -f $dir`
	docker run -p 0.0.0.0:$port:80 --name pip-mirrors-$port -v $dir:/usr/local/pip-mirrors --restart always -d pkuwwt/pip-mirrors
}

help() {
	echo "USAGE:"
	echo -e "\t$0 download cache_dir -r requirement1.txt -r requirements2.txt flask numpy"
	echo -e "\t$0 serve dir port      # run in foreground"
	echo -e "\t$0 service dir port    # run in background"   
}

cmd=$1
shift

case $cmd in
	download)
		download $*
		;;
	serve)
		serve $*
		;;
	service)
		service $*
		;;
	*)
		help
		;;
esac
