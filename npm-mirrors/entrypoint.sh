#!/bin/bash

proxy() {
	node --version
	verdaccio -c /usr/local/verdaccio/config.yaml
}

# install for a package.json
install () {
	npm install $*
}

serve() {
	verdaccio -c /usr/local/verdaccio/config_offline.yaml
}

cmd=$1
shift

case $cmd in
	proxy)
		proxy
		;;
	install)
		install
		;;
	serve)
		serve
		;;
	*)
		serve
		;;
esac
