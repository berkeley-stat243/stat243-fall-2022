#!/bin/bash
git checkout gh-pages && cp -pr _site/* . && git commit -am'update website' && git push && git checkout main
