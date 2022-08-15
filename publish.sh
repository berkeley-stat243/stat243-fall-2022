#!/bin/bash
git checkout gh-pages && cp -pr _site/* . && git commit -am'update website' && git push
git checkout main

## need to `git add` new html files manually to gh-pages
