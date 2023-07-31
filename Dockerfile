FROM python:3.11.4-slim

ENV POETRY_VERSION=1.5.1 \
    POETRY_VIRTUALENVS_CREATE=false

# Install poetry
RUN pip install "poetry==$POETRY_VERSION"

# Copy project requirements
WORKDIR /code
COPY poetry.lock pyproject.toml /code/

# Install project dependencies
RUN poetry install --no-dev --no-root --no-interaction --no-ansi

# Copy project code
COPY src /code

ENTRYPOINT uvicorn main:app
