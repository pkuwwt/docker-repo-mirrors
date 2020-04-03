# Build a ubuntu mirror for offline use

## Build the image

```
make
```

## Use the image

```
mkdir /tmp/apt-mirror
docker run -it --rm --name apt-mirror -v /tmp/apt-mirror:/var/spool/apt-mirror pkuwwt/apt-mirror
```
