NAME = pkuwwt/npm-mirror

all: build

build:
	sudo docker build -t $(NAME):latest --rm .

push:
	sudo docker push $(NAME)

run:
	sudo docker run --rm --name=npm-mirror -v $(shell pwd)/storage:/usr/local/verdaccio/storage -p 4873:4873 $(NAME)

stop:
	sudo docker stop npm-mirror >/dev/null 2>&1

clear_local_cache:
	@npm cache clear -f
