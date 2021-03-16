# Django with Gunicorn

A simple prototype running Django in Gunicorn.

# Run on your host

- Set Secret and Debug env vars

```
pipenv install
cd src
pipenv run gunicorn --config ./gunicorn.conf.py demo.wsgi:application
```

# Dockerize

- Build image

```
pipenv lock --keep-outdated --requirements > requirements.txt
docker build --tag me/django .
```

- Run (add Secret and Debug env vars)

```
docker container run \
  --rm --name django1 \
  --publish 8000:8000 \
  me/django:latest
```
