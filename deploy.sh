#!/usr/bin/env bash
set -euo pipefail

# Don't continue if there are uncommitted changes
if [ -n "$(git status -s)" ]; then
  echo "You are not allowed to deploy when there are uncommitted changes in your working tree!" > /dev/stderr
  exit 1
fi

COMMIT_MESSAGE=$(git show -s --format=%s)

hugo && sleep 5

(pushd public || exit 1)
git add .
git commit -m "${COMMIT_MESSAGE}"
git push
(popd || exit 1)
