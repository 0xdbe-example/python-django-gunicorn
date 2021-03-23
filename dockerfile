FROM python:3.9-slim

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY docker-entrypoint.sh .
COPY src .

RUN pip install --no-cache-dir -r requirements.txt \
    && groupadd --gid 1000 python \
    && useradd --uid 1000 --gid python --shell /bin/bash --create-home python \
    && chown -R python:python /usr/src/app \
    && chmod +x ./docker-entrypoint.sh

EXPOSE 8000

USER python

ENTRYPOINT [ "./docker-entrypoint.sh" ]