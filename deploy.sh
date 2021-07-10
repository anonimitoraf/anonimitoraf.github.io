#!/usr/bin/env bash
set -euo pipefail

# Don't continue if there are uncommitted changes
if [ -n "$(git status -s)" ]; then
  echo "You are not allowed to deploy when there are uncommitted changes in your working tree!" > /dev/stderr
  exit 1
fi

git subtree push --prefix public origin gh-pages
