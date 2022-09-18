---
title: "Reproducibility discussion"
author: "James Duncan"
date: "2022-09-16"
format:
  html:
    theme: cosmo
    css: ../../styles.css
    toc: true
    code-copy: true
    code-block-background: true
---

# Overview

Today we'll discuss reproducibility in small groups and as a class, using the
paper "A Cohort Location Model of Household Sorting in US Metropolitan Regions"
as a case study.

Please open up the
[paper](https://journals.sagepub.com/doi/full/10.1177/0042098016668783) and
corresponding [code](https://github.com/andykrause/hhLocation).

# Agenda

## Make small groups

_< 5 minutes_

Form a group with the 3--4 people sitting nearest to you, turning your desks
toward one another.

A different person should take each of the following roles:

- **General discussion leader**: Leads the first 15 minutes discussion. You'll keep the
  discussion moving and try to encourage contributions from all members of your
  group.

- **Group consensus leader**: You'll keep track of the group discussion of
  strengths and weaknesses and break any ties in the final consensus.

- **Strengths representative**: During the class discussion at the end, you'll
  give one of the strengths from your group's list, and say any differences in
  your group's ranking vs. what we currently have on the board.

- **Weakness representative**: During the class discussion at the end, you'll
  give one of the weaknesses from your group's list, and say any differences in
  your group's ranking vs. what we currently have on the board.

If you only have 3 people, then one person should serve as the representative
for both the strengths and weaknesses.

## General discussion in small groups

 _10--15 minutes_

Please discuss each of the following together:

- From the paper and documentation on GitHub provided by the authors, try to
  find where the authors carried out each of the following in their code (or if
  they did at all):

  - data collection
  - data cleaning / processing
  - statistical calculations
  - visualizations from the paper

- In terms of their coding, what elements of their project do you like. Consider:

  - documentation
  - comments
  - organization
  - naming
  - workflow
  - data provenance
  - etc.

- What aspects of their code do you think could be improved?

- Without looking at the code itself, can you tell what the purpose of each file is?

- Without looking at the code in detail, can you quickly tell what each block of code does?

- Are there any exceptions to your answers above?

- In what way do the authors document their workflow? Is it effective?

- Take note of any judgment calls you noticed in their workflow. Are those
  judgment calls documented and/or justified in their code?

## Group consensus of strengths & weaknesses

 _10--15 minutes_

As a group, come to a consensus on the most important strengths and weaknesses
of the reproducibility aspects of the paper, and rank each category separately
from most important to least.

These should be succinct enough to write on the board later, so please write
them down and keep them short and specific. Try to come up with 4--5 for each.

## Class discussion

_10--15 minutes_

As a class, we'll discuss the strengths and weaknesses and find the overall
consensus. Please pick two representatives from your group, one for strengths
and one for weaknesses.

# Further reading

Reproducibility is a crucial component of statistical computing and good (data)
science, as well as something that you can work to continuously improve in your
own practice. I encourage you to take a look at the resources and tools below
and to find ways to incorporate reproducibility best practices into your
everyday workflow:

- UC Berkeley Library guide on [Reproducible Research Practices](https://guides.lib.berkeley.edu/reproducibility-guide)
- UC Santa Barbara's [Introduction to Reproducible Publications with RStudio](https://carpentries-incubator.github.io/Reproducible-Publications-with-RStudio)
  (currently in alpha) -- materials from a Nov. 2022 workshop on reproducible research.
- ["Packaging Data Analytical Work Reproducibly Using R (and
  Friends)"](https://www.tandfonline.com/doi/full/10.1080/00031305.2017.1375986)
  -- example reproducible project structure, tailored to R projects.
- ["Reproducbility workflow"](https://github.com/rlbarter/reproducibility-workflow), Rebecca
  Barter (Berkeley Statistics PhD alum and postdoc) -- another example project
  structure you might find useful.
- [`renv`](https://rstudio.github.io/renv/articles/renv.html) -- an R package for
  managing project-local R dependencies (e.g., libraries and other R packages).
- [CRAN Task View: Reproducible
  Research](https://cran.r-project.org/web/views/ReproducibleResearch.html) --
  compilation of R packages related to
