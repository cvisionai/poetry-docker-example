# poetry-docker-example
An example project using Poetry inside a docker environment inspired by this
[Dockerfile](https://github.com/wemake-services/wemake-django-template/blob/fd6c4105e99c97313905235f5d46a30e624d1375/%7B%7Bcookiecutter.project_name%7D%7D/docker/django/Dockerfile).

# Prerequisites

This assumes [make](https://www.gnu.org/software/make/), [Python
3.10+](https://www.python.org/downloads/), and [Poetry](https://python-poetry.org/docs) are
installed.


# Local development

After cloning this repository, install all dependencies (production and development) locally with
`make dev-install`. This will run `poetry install --no-root --all-extras` if `poetry` is found on
the system. Next, `make dev-run` will run the server locally, instead of in a docker container. This
make target will run the code `cd src && poetry run uvicorn main:app`.

# Building and running docker images

To build for and run in production, the project and its dependencies can be packaged in a docker
image. Running `make build` will build the docker image (`docker build -t poetry_docker:latest .`),
while `make rebuild` will add the `--no-cache` flag and build from scratch. Running `make run` will
start a docker container running the latest build of `poetry_docker` on the host network (`docker
run --rm -it --net=host poetry_docker:latest`), type `Ctrl+C` to stop the container.
