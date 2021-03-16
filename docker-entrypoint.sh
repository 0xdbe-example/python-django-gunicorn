#!/bin/sh
set -e

# Database migration
python manage.py migrate
# Build Static Files
python manage.py collectstatic --noinput

exec gunicorn --config ./gunicorn.conf.py demo.wsgi:application