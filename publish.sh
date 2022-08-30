#!/bin/bash

## Notes

## New freeze-based workflow:

## So the workflow when creating a new page that requires R or Python computation is:
## - copy the preamble from units/unit2-dataTech.Rmd (w/ or without the pdf block, depending on if PDFs are required)
## - run `quarto render <new-Rmd-or-qmd>` locally, which will store computations in the _freeze dir (and it won't have to re-do computations previously saved in _freeze)
## - commit the new page and changes to the _freeze dir
## - push to GitHub and the publish action should run fairly quickly


## Publish without re-rendering all files after individually rendering file(s)
## quarto render file.Rmd
## quarto publish --no-render

## Manual workflow as `quarto publish github-pages` was not working.

## Step 1: Make changes to source (md/qmd/Rmd) files in main branch.
## Step 2: Render individual files to html with `quarto render file.ext`, which puts rendered files in _site. Don't commit anything in _site.
## Step 3: Commit source file changes to main branch.
## Step 4: If adding any new html files, copy the new html from _site to the root directory do git add and commit into gh-pages branch.
## Step 4a: If adding anything to main nav, update `_quarto.yml`. Unfortunately, one also needs to run `quarto render` on all source files so that they get the updated nav.  
## Step 5: Publish as follows from root directory:
git checkout gh-pages && cp -pr _site/* . && git commit -am'update website' && git push
git checkout main

