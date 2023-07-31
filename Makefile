
.PHONY: build
build:
	docker build -t poetry_docker:latest .

.PHONY: rebuild
rebuild:
	docker build --no-cache -t poetry_docker:latest .

.PHONY: run
run:
	docker run --rm -it --net=host poetry_docker:latest

all: build run
