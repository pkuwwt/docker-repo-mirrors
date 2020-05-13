#!/bin/sh

VERDACCIO="verdaccio -l http://0.0.0.0:${NPM_PORT:-4873}"

proxy() {
	node --version
	$VERDACCIO -c /usr/local/verdaccio/config.yaml
}

serve() {
	$VERDACCIO -c /usr/local/verdaccio/config_offline.yaml
}


download () {
	npm install --registry http://127.0.0.1:${NPM_PORT:-4873} $*
}

# install for a package.json
install () {
	npm install --registry http://127.0.0.1:${NPM_PORT:-4873}
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
