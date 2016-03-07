#!/bin/bash 
#
# This program was made possible by
# Copy & Paste, Inc. Special thanks to
# tonight's contributors:
# domenic https://gist.github.com/domenic/ec8b0fc8ab45f39403dd
# evanbrown: http://evanbrown.io/post/hugo-on-the-go/
#
set -e # exit with nonzero exit code if anything fails 
hugo
cd public
git init 
git config user.name "Travis CI" 
git config user.email "<you>@<your-email>" 
git add . 
git commit -m "Deploy to GitHub Pages"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
