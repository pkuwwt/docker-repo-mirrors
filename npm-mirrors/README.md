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
