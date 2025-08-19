#!/bin/bash
set -e

# Wait until Postgres is ready
until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do
  echo "Waiting for Postgres..."
  sleep 2
done

echo "Postgres is ready! Running migrations..."
python manage.py makemigrations
python manage.py migrate --noinput

# Start the Django server
python manage.py runserver 0.0.0.0:8000