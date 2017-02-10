#!/bin/bash

while ! ./manage.py migrate --noinput >> /dev/null 2>&1 ; do
  sleep 1
done

gunicorn fooapi.wsgi:application -b :8000
