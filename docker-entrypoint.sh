#!/bin/sh
set -e

if [[ "$1" = 'run' ]]; then
    echo "Running database migrations..."
    /app/bin/papercups eval "ChatApi.Release.migrate()"
    echo "Starting application..."
    exec /app/bin/papercups start

elif [[ "$1" = 'db' ]]; then
    exec /app/"$2".sh
else
    exec "$@"

fi

exec "$@"
