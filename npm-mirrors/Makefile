NAME = pkuwwt/npm-mirrors
PROXY_SERVER=npm_proxy
OFFLINE_SERVER=npm_server

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
	sudo docker run -p 0.0.0.0:${NPM_PORT}:4873 -v $(STORAGE_DIR):/usr/local/verdaccio/storage --name $(PROXY_SERVER) --rm $(NAME) proxy

install:
	npm --registry http://127.0.0.1:$(NPM_PORT) install

serve:
	sudo docker run -d --name $(OFFLINE_SERVER) -v $(STORAGE_DIR):/usr/local/verdaccio/storage -p 0.0.0.0:$(NPM_PORT):4873 $(NAME) serve

shell_proxy:
	sudo docker exec -it $(PROXY_SERVER) sh

shell_serve:
	sudo docker exec -it $(OFFLINE_SERVER) sh

stop_proxy:
	-@sudo docker stop $(PROXY_SERVER) >/dev/null 2>&1

stop_server:
	-@sudo docker stop $(OFFLINE_SERVER) >/dev/null 2>&1

rm_server:
	-@sudo docker stop $(OFFLINE_SERVER) >/dev/null 2>&1 || true
	-@sudo docker rm $(OFFLINE_SERVER) >/dev/null 2>&1 || true

