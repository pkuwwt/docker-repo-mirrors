# Build a npm private mirror for offline use

## Build the image

```
make
```

## Use the image

```
mkdir /tmp/npm-mirror
docker run -it --rm --name npm-mirror -v /tmp/apt-mirror:/usr/local/npm-mirror pkuwwt/npm-mirror
```

## Start a proxy server for caching

```bash
NPM_STORAGE_DIR=./storage NPM_PORT=4873 make proxy
```

Use the proxy server to install packages for package.json in current dir

```bash
NPM_PORT=4873 make install
```

## Start a npm server for offline usage

```bash
NPM_STORAGE_DIR=./storage NPM_PORT=4873 make serve
```

There is a sample [`~/.npmrc`](./my_npmrc) file and a wrapper script [`npm.sh`](./npm.sh).

