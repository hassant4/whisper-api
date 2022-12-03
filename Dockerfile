FROM python:3.9.15-slim

# need curl and gcc
RUN buildDeps='g++ libblas-dev liblapack-dev libatlas-base-dev gfortran libopenblas-dev curl git ffmpeg' \
    essentials='' \
    && apt update -y \
    && apt install -y $buildDeps $essentials \
    && apt-get clean


# install poetry
ENV POETRY_VERSION=1.1.6
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3
ENV PATH="/root/.poetry/bin:/opt/venv/bin:${PATH}"
ENV PYTHONUNBUFFERED=1


WORKDIR /app/
COPY pyproject.toml ./pyproject.toml
COPY poetry.lock ./poetry.lock

RUN poetry config virtualenvs.create false
RUN poetry install --no-dev --no-root --no-interaction

COPY app.py /app

ENTRYPOINT ["poetry", "run"]
CMD ["flask", "run"]


EXPOSE 5000