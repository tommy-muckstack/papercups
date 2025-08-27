#!/bin/sh
set -e

if [[ "$1" = 'run' ]]; then
    echo "Starting application..."
    # Temporarily skip migrations due to connection issues
    # /app/bin/papercups eval "ChatApi.Release.migrate()"
    exec /app/bin/papercups start

elif [[ "$1" = 'db' ]]; then
    exec /app/"$2".sh
else
    exec "$@"

fi

exec "$@"
