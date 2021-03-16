#!/bin/sh
set -e

# Database migration
python manage.py migrate

exec gunicorn --config ./gunicorn.conf.py demo.wsgi:application