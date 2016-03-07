#!/bin/bash
#
# This program was made possible by Copy & Paste, Inc.
# Special thanks to:
# domenic: https://gist.github.com/domenic/ec8b0fc8ab45f39403dd
# evanbrown: http://evanbrown.io/post/hugo-on-the-go/
# travis-ci: https://docs.travis-ci.com/user/deployment/custom/
#
set -e # exit with nonzero exit code if anything fails
# start SSH agent
eval "$(ssh-agent -s)" # Yes, that is intentional
chmod 600 ./deploy_key
ssh-add ./deploy_key
# Create a repo inside public and force-push everything to the gh-pages branch
cd "$PUB_DIR"
git init
git config user.name "Travis CI"
git config user.email "travis@travis-ci.com"
git add .
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "git@github.com:${TRAVIS_REPO_SLUG}.git" master:gh-pages
