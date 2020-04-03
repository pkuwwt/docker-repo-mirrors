
# A utility docker for downloading and serving pip packages

## Build the image

```
make
```

## Use the image

### Download

Provide a `requirements.txt`

```
mkdir /tmp/pip-mirrors
docker run -it --rm --name pip-mirrors \
		   -v /tmp/pip-mirrors:/usr/local/pip-mirrors \
		   -v requirements.txt:/usr/local/requirements.txt \
		   pkuwwt/pip-mirrors download
```

or

```
./run.sh cache_dir flask -r requirements1.txt numpy -r requirements2.txt
```

### Serving

```
docker run -p 0.0.0.0:8080:80 -v /tmp/pip-mirrors:/usr/local/pip-mirrors -d pkuwwt/pip-mirrors
pip install -i 127.0.0.1:8080/pip-mirrors/simple flask
```

or 

```
./run.sh serve cache_dir 9090     # run in foreground
./run.sh service cache_dir 9090   # run in background
```

