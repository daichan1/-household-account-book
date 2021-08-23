#!/bin/bash
set -e

# server.pidが存在する場合サーバーが再起動できないようにする
rm -f /household_account_book/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"