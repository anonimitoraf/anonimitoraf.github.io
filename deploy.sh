#!/usr/bin/env bash
set -euo pipefail

COMMIT_MESSAGE=$1

hugo && sleep 5

git add .
git commit -m "${COMMIT_MESSAGE}" --allow-empty
git push
