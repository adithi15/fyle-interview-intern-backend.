#!/bin/bash\n
# to stop on first error\n
set -e\n
\n
# Delete older .pyc files\n
# find . -type d \( -name env -o -name venv  \) -prune -false -o -name "*.pyc" -exec rm -rf {} \;\n
\n
# Run required migrations\n
export FLASK_APP=core/server.py\n
\n
# flask db init -d core/migrations/\n
# flask db migrate -m "Initial migration." -d core/migrations/\n
# flask db upgrade -d core/migrations/\n
\n
# Run server\n
gunicorn -c gunicorn_config.py core.server:app\n
