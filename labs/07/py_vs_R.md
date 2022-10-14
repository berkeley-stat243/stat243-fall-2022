---
title: "Python vs. R"
author: "Zoe Vernon, Andrew Vaughn, James Duncan"
date: "2022-10-14"
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

[PDF](./py_vs_R.pdf){.btn .btn-primary}

# Comparing the Behavior of Python and R

This week, we will be exploring the behavior of Python for several common
actions that we have previously covered in R. The final product of today's work
will be a PDF which is uploaded as a group submission to Gradescope.

For quick reference, there is some example Python code in [`syntax.py`](https://github.com/berkeley-stat243/stat243-fall-2022/blob/main/labs/07/syntax.py).

## Instructions

:::{.callout-important} 

Please carefully read the full instructions before starting the assignment, as
you will need to decide with your group how to organize and combine your
efforts.

:::

Your group is expected to work on this for **~60 minutes** (so office hours will be
cut short by about 10 minutes today). 

It's OK if you don't get through all of the questions in one hour (i.e., you can
just submit what you have at the end of section), but it should be clear that
you put some thought and effort into the questions your group worked on.

:::{.callout-tip}
Do your best to document your efforts and insights as you go.
:::

1. We will separate into groups of (ideally) 3 or (if necessary) 4. I'll try to
make sure that each group has at least one person with some Python experience,
so **please wait to get started** until we've figured that out.

1. Groups should try to answer every question in the [Main Questions](#main-questions) section.
Here are some **options** for working through these questions:
    
    - Option A -- **Divide, consult, conquer**: Individual group members work on different
    questions, consulting with each other as they go or as needed.
    
    - Option B -- **Many minds, one task**: The group works together, discussing and
    answering each question sequentially.
    
    - Option C -- **Go with the flow**: Feel free to use a flexible mixture of
    Option A and Option B, working separately on some tasks and uniting on
    others as you see fit.
    
1. At the end of section (say, the last ~10-15 minutes), combine the solutions
into **one PDF**. Each group member will then **individually submit** copies of
this PDF on Gradescope.

    - Make sure to include the name of each group member at the top of the PDF.

    - How you create the PDF is up to you but some **options** are: 
    
        a. (recommended) Using **Google Docs**.
            
            - _Separate documents, then combine_: Each group member uses a separate Google Doc, then one person combines those documents into a final shared document.

            - _One document_: Everyone adds to a single document at the same time.
                        
            - You can take screenshots of code / outputs that you run in Jupyter or RStudio (alternatively, the IPython or R consoles), or just copy paste code and outputs directly to the document.
            
            - When your final shared document is ready, each group member will export it to PDF and make individual submission to Gradescope.
        
        a. Create an **R Markdown** file with the code and render to PDF. This may be
        more of a headache to combine if each person is working separately.
        
        a. Create a **Jupyter Notebook** and export to PDF.
        
            - In JupyterLab, **File > Save and Export Notebook As... > PDF**.
            
            - In the classic Jupyter Notebook interface, **File > Download as > PDF via LaTeX (.pdf)**.

## Questions

### Main Questions

:::{.callout-tip}

Ideally, you will make it through all of these, although if you run out of time
that is okay.

:::

1. Do Python functions behave like pass-by-value or pass-by-reference? In other
words, if you pass in an object and modify it, does that affect the value of the
object in the environment from which the function was called? Check this for a
scalar, a list, and a `numpy` array.

1. If you copy a list, dictionary, or `numpy` array in Python, are the values
copied or does the new object just use the same memory as the original object?

1. How are `NA`s handled in Python lists? What about in `numpy` arrays?

1. Do Python functions use promises/lazy evaluation?

1. How does variable scoping work in Python - does it use lexical scoping and 
look for variables in the environment where a function was defined?

1. Consider the relative efficiency of `for` loops versus vectorized
calculations for `numpy` arrays and see how it compares to the equivalent
operation in R.

1. Can lists and `numpy` arrays be modified in place, without copying the
   object?

1. Consider whether Python allows you to have functions and variables in the
global environment that have the same names as functions/variables in packages
or in modules (e.g., make a file `test.py` in your working directory that you
can import using `import test`). Consider `math.cos` and create your own `cos`
function. How does this compare to how R finds objects?


### Additional Questions

:::{.callout-tip}

Work on these if you finish quickly/are curious

:::

1. Can you create a closure with embedded data, like we did in R?

1. Can you determine if the speed of looking up values in a dictionary varies 
with the size of the dictionary (this will indicate if something like hashing is 
going on or if the look up has to scan through all the elements).

1. Compare the Python debugger to R's debugger.

1. If you create classes and objects in Python's object-oriented system, what are 
the similarities and differences relative to R's R6 system? There is a brief section 
on object-oriented programming in Python in the lab 6 materials.

