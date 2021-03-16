FROM python:3.9-alpine

WORKDIR /usr/src/app

COPY requirements.txt ./
COPY docker-entrypoint.sh .
COPY src .

RUN pip install --no-cache-dir -r requirements.txt \
    && addgroup -g 1000 python \
    && adduser -u 1000 -G python -s /bin/sh -D python \
    && chown -R python:python /usr/src/app \
    && chmod +x ./docker-entrypoint.sh

EXPOSE 8000

USER python

ENTRYPOINT [ "./docker-entrypoint.sh" ]