#!/bin/bash

set -o errexit

cd $TRAVIS_BUILD_DIR

# Order the bibtex
python sort_bibtex.py

git remote set-url origin "https://glemaitre:${GH_TOKEN}@github.com/I2Cvb/imbalanced-bibtex.git"

git config --global user.email $EMAIL
git config --global user.name $USERNAME
git add imbalanced-bibtex.bib
git commit -m "Sort the bibtex file"

echo "Done with the commit, let's push"

git push --force origin master
