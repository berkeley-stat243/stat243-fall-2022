---
title: "Simulation studies"
author: "Andrew Vaughn, James Duncan"
date: "2022-10-28"
format:
  pdf:
    documentclass: article
    margin-left: 30mm
    margin-right: 30mm
    toc: true
  html:
    theme: cosmo
    css: ../../styles.css
    toc: true
    code-copy: true
    code-block-background: true
execute:
  freeze: auto
---

[PDF](./simulations.pdf){.btn .btn-primary}


# Overview

Our in-class discussion and participation assignment today focuses on section
**4. Numerical studies** of the paper by [Cao et
al.](https://github.com/berkeley-stat243/stat243-fall-2022/blob/main/ps/cao_etal_2015.pdf),
which you read for Problem Set 5.

Specifically, we'll discuss the goals of the simulation study, the choices the
authors made in designing their data generating mechanisms, how those choices
may affect the results of the study, and interpretation of those results as
presented in Table 1 on page 765.

# Schedule

1. First, to get us all refreshed on the context, I'll give a **brief overview**
   of their method. _~5-10 minutes_
1. Please form groups of 2-3 students. **Open a shared Google Doc**, giving
   access to everyone in your group.
1. Discuss how the authors generate their **simulated datasets**, as described
   in Section 4.1 of the paper. In your Google Doc, have one group member write
   down **pseudo-code** to generate a single dataset. _~5-10 minutes_
   - They use the multivariate normal (MVN) distribution for part of their
     simulation. Given a specific covariance matrix, can you show how to
     efficiently generate MVN data with that covariance structure using the
     Cholesky decomposition (described in [Unit 10](/units/unit10-linalg.html))?
1. Next, **discuss the specific choices** the authors made in designing their
   simulated datasets. As you discuss, **write down those choices** in your
   Google Doc.
1. As a group, pick the **two most important choices** and justify why you
   picked them in the Google Doc. _~5-10 minutes_
1. With those choices in mind, brainstorm and write how you might simulate the
   data differently. _~5-10 minutes_
1. Finally, each group member should export the Google Doc to PDF and submit it
   for the "Lab 8: Simulation studies" Gradescope assignment.
1. For the last _10--15 minutes_, we'll come back together and have a class-wide
   discussion.
