NAME = pkuwwt/pip-mirrors

all: build

build:
	docker build -t $(NAME):latest --rm .

push:
	docker push $(NAME)
