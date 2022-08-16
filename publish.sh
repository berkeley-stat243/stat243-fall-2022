#!/bin/bash

## Manual workflow as `quarto publish github-pages` not working.

## Step 1: Make changes to source files in main branch.
## Step 2: Render individual files to html with `quarto render file.ext`, which puts rendered files in _site. Don't commit anything in _site.
## Step 3: If adding any new files, copy the new html from _site to the root directory and commit into gh-pages branch.
## Step 4: Publish as follows from root directory:
git checkout gh-pages && cp -pr _site/* . && git commit -am'update website' && git push
git checkout main

