FROM python:3.12-slim

LABEL maintainer="amorallex@gmail.com"

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /code

RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    libharfbuzz-dev \
    libfreetype6-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN adduser \
    --disabled-password \
    --home /home/django-user \
    django-user

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

USER django-user

COPY . /code/
