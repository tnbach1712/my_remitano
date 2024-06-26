#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid
bin/rails db:create
rake db:migrate
yarn build
yarn build:css
# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
