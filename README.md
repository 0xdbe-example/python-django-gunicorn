# Django with Gunicorn

A simple prototype running Django in Gunicorn.

# Run on your host

- Set Secret and Debug env vars

```
pipenv install
cd src
export SECRET=$(openssl rand -hex 32)
export DEBUG=true
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
  --env SECRET=$(openssl rand -hex 32) \
  --env DEBUG=true \
  --rm --name django1 \
  --publish 8000:8000 \
  me/django:latest
```
- Open http://localhost:8000/

# To Do

- [ ] Remove server http header
- [ ] Set worker and thread dynamicly (according hardware config)
- [ ] add django-health-check
- [ ] Add HEALTHCHECK statement in dockerfle