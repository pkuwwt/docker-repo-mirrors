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
	docker build -t $(NAME):latest --rm .

push:
	docker push $(NAME)

proxy:
	docker run --rm $(NAME) proxy

install:
	docker run -v $(shell pwd):/tmp/cache --rm $(NAME) install 

serve:
	docker run -d -v $(STORAGE_DIR):/usr/local/verdaccio/storage -p $(NPM_NPM_PORT):4873 $(NAME) serve

