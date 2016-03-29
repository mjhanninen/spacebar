#!/bin/bash

# This script is adapted pretty directly from the Domenic Denicola's
# [deployment script][1].
#
# [1]: https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

if [ $TRAVIS_PULL_REQUEST == "true" ]
then
    cat <<EOF
INFO: This is a pull request. Exiting.
EOF
  exit 0
fi

set -e

[[ -d ./out ]] && rm -rf ./out || true
mkdir ./out

bin/compile.sh

cd out
git init
git config user.name "Travis CI"
git config user.email "${GITHUB_EMAIL}"
git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GITHUB_TOKEN}@${GITHUB_REF}" master:gh-pages > /dev/null 2>&1
