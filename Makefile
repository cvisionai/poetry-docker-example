
.PHONY: build
build:
	docker build -t poetry_docker:latest .

.PHONY: rebuild
rebuild:
	docker build --no-cache -t poetry_docker:latest .

.PHONY: run
run:
	docker run --rm -it --net=host poetry_docker:latest

.PHONY: dev-install
dev-install:
	poetry --version && poetry install --no-root --all-extras || @echo "Could not find poetry"

.PHONY: dev-run
dev-run:
	cd src && poetry run uvicorn main:app
