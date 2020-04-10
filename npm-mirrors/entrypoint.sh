#!/bin/sh

VERDACCIO='verdaccio -l 0.0.0.0:4873'

proxy() {
	node --version
	$VERDACCIO -c /usr/local/verdaccio/config.yaml
}

download () {
	npm install -i 127.0.0.1:${NPM_PORT:-4873} $*
}

# install for a package.json
install () {
	npm install -i 127.0.0.1:${NPM_PORT:-4873}
}

serve() {
	$VERDACCIO -c /usr/local/verdaccio/config_offline.yaml
}

cmd=$1
shift

case $cmd in
	proxy)
		proxy
		;;
	download)
		download $*
		;;
	install)
		install
		;;
	serve)
		serve
		;;
	shell)
		sh $*
		;;
	*)
		serve
		;;
esac
