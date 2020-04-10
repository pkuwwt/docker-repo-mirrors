NAME = pkuwwt/npm-mirrors

ifndef NPM_STORAGE_DIR
override NPM_STORAGE_DIR = ./storage
endif

ifndef NPM_PORT
override NPM_PORT = 4873
endif

STORAGE_DIR = $(shell readlink -f $(NPM_STORAGE_DIR))

all: build

build:
	sudo docker build -t $(NAME):latest --rm .

push:
	sudo docker push $(NAME)

proxy:
	sudo docker run -p 0.0.0.0:${NPM_PORT}:4873 -v $(STORAGE_DIR):/usr/local/verdaccio/storage --name npm_proxy --rm $(NAME) proxy

install:
	npm --registry http://127.0.0.1:$(NPM_PORT) install

serve:
	sudo docker run -d --name npm_server -v $(STORAGE_DIR):/usr/local/verdaccio/storage -p 0.0.0.0:$(NPM_NPM_PORT):4873 $(NAME) serve

shell_proxy:
	sudo docker exec -it npm_proxy sh

shell_serve:
	sudo docker exec -it npm_server sh

stop_proxy:
	sudo docker stop npm_proxy

stop_server:
	sudo docker stop npm_server
