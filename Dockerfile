FROM python:3.12.2-slim

RUN pip install poetry
RUN apt-get update && apt-get install -y bash
RUN apt-get install -y build-essential

WORKDIR /app

COPY pyproject.toml poetry.lock /app/

RUN poetry install

COPY . /app

CMD ["poetry", "run", "python", "main.py"]