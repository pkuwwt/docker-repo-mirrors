
# An offline repository for npm


## Build

```bash
make build
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

